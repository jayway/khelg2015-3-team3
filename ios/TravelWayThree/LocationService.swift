//
//  LocationService.swift
//  TravelCompanion
//
//  Created by Fredrik Nannestad on 14/03/15.
//  Copyright (c) 2015 Jayway. All rights reserved.
//

import Foundation
import CoreLocation

public let LocationServiceDidUpdateCurrentLocationNotification = "LocationServiceDidUpdateCurrentLocationNotification"
public let LocationServiceDidStartNotification = "LocationServiceDidStartNotification"
public let LocationServiceDidStopNotification = "LocationServiceDidStopNotification"
/// Posted if the LocationService failes to obtain a location. The underlying CoreLocation error can be found in the userInfo dictionary under the `kErrorUserInfoKey`
public let LocationServiceDidFailUpdatingLocationNotification = "LocationServiceDidFailUpdatingLocationNotification"
public let kErrorUserInfoKey = "kErrorUserInfoKey"
public let LocationServiceDidUpdateAuthorizationStateNotification = "LocationServiceDidUpdateAuthorizationStateNotification"

public class LocationService: NSObject, CLLocationManagerDelegate {
    
    public class var sharedService: LocationService {
        struct Singleton {
            static let instance = LocationService()
        }
        return Singleton.instance
    }
    
    private var locationManager: CLLocationManager
    private var pendingStart: Bool = false
    private(set) var simulated: Bool = false

    /// Returns whether the location service is started or not.
    public var isStarted: Bool = false
    
    /// The latest obtained location. Nil if no location has been obtained by the location service. Will be updated when location service is running.
    public var currentLocation: CLLocation?
    
    /// The location discovered just before the currentLocation.
    public var previousLocation: CLLocation?
    
    /// The desired accuracy of the LocationService in meters. Updates to `currentLocation` only happens when the desired accuracy is exceeded. Default is 100 meters.
    public var desiredAccuracy: Double = 100 {
        didSet {
            locationManager.desiredAccuracy = desiredAccuracy
        }
    }
    
    override private init() {
        locationManager = CLLocationManager()
        super.init()
        locationManager.delegate = self
    }
    
    public func isAuthorized() -> Bool {
        let status = CLLocationManager.authorizationStatus()
        return status == .AuthorizedAlways || status == .AuthorizedWhenInUse
    }
    
    public typealias LocationServiceAuthorizationStatus = CLAuthorizationStatus
    
    public func authorizationStatus() -> LocationServiceAuthorizationStatus {
        return CLLocationManager.authorizationStatus()
    }
    
    /**
        Starts the location service if or when use of location is authorized by user. If use of location is not authorized `LocationService` will request authorization from CoreLocation. This will present a dialog to the user who will decide if location services should be authorized or not. If location use is authorized the location service will start.
    */
    public func startLocationService(simulated simulated: Bool = false) {
        if isStarted {
            return
        }
        self.simulated = simulated
        if isAuthorized() {
            pendingStart = false
            isStarted = true
            currentLocation = nil
            if simulated {
                self.performSelector("sendSimulatedLocationUpdate", withObject: nil, afterDelay: 2.0)
            } else {
                #if os(iOS)
                locationManager.startUpdatingLocation()
                NSNotificationCenter.defaultCenter().postNotificationName(LocationServiceDidStartNotification, object: self)
                #elseif os(watchOS)
                locationManager.requestLocation()
                #endif
            }
        } else {
            if CLLocationManager.authorizationStatus() == .NotDetermined {
                pendingStart = true
                locationManager.requestWhenInUseAuthorization()
            } else {
                print("LocationService could not start because authorization was denied by user.")
                NSNotificationCenter.defaultCenter().postNotificationName(LocationServiceDidFailUpdatingLocationNotification, object: self)
            }
        }
    }
    
    /**
        Stops the location service.
    */
    public func stopLocationService() {
        if isStarted {
            locationManager.stopUpdatingLocation()
            isStarted = false
            simulated = false
            currentLocation = nil
            NSNotificationCenter.defaultCenter().postNotificationName(LocationServiceDidStopNotification, object: self)
        }
    }
    
    func sendSimulatedLocationUpdate() {
        let location = CLLocation(latitude: 55.673761, longitude: 12.565441)
        currentLocation = location
        NSNotificationCenter.defaultCenter().postNotificationName(LocationServiceDidUpdateCurrentLocationNotification, object: self)
    }
    
}

// MARK: - CLLocationManagerDelegate

extension LocationService {
    
    public func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        switch status {
        case .AuthorizedAlways, .AuthorizedWhenInUse:
            if pendingStart {
                startLocationService(simulated: simulated)
            }
        case .NotDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .Denied:
            stopLocationService()
        case .Restricted:
            stopLocationService()
        }
        NSNotificationCenter.defaultCenter().postNotificationName(LocationServiceDidUpdateAuthorizationStateNotification, object: self)
    }
    
    public func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        NSNotificationCenter.defaultCenter().postNotificationName(LocationServiceDidFailUpdatingLocationNotification, object: self, userInfo: [kErrorUserInfoKey: error])
    }
    
    public func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let newLocation = locations.last where shouldReplaceCurrentLocationWithNewLocation(newLocation) {
            previousLocation = currentLocation
            currentLocation = newLocation
            NSNotificationCenter.defaultCenter().postNotificationName(LocationServiceDidUpdateCurrentLocationNotification, object: self)
        }
    }
    
    private func shouldReplaceCurrentLocationWithNewLocation(newLocation: CLLocation) -> Bool {
        return
            currentLocation == nil ||
            newLocation.distanceFromLocation(currentLocation!) >= desiredAccuracy ||
            (newLocation.horizontalAccuracy < currentLocation?.horizontalAccuracy &&
            newLocation.horizontalAccuracy < desiredAccuracy)
    }
    
}