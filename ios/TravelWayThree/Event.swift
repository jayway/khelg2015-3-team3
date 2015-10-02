//
//  Event.swift
//  TravelWayThree
//
//  Created by Fredrik Nannestad on 02/10/2015.
//  Copyright © 2015 Gustaf Nilklint. All rights reserved.
//

import Foundation
import CoreLocation

class User {
    
    var image: UIImage?
    var name: String?
    
}

extension UIColor {
    
    static func foodEventColor(alpha: CGFloat = 1.0) -> UIColor {
        return UIColor(red: 197/255, green: 7/255, blue: 181/255, alpha: alpha)
    }
    
    static func socialEventColor(alpha: CGFloat = 1.0) -> UIColor {
        return UIColor(red: 226/255, green: 19/255, blue: 19/255, alpha: alpha)
    }
    
    static func cultureEventColor(alpha: CGFloat = 1.0) -> UIColor {
        return UIColor(red: 10/255, green: 1/255, blue: 94/255, alpha: alpha)
    }
    
    static func leisureEventColor(alpha: CGFloat = 1.0) -> UIColor {
        return UIColor(red: 4/255, green: 146/255, blue: 38/255, alpha: alpha)
    }
    
    static func transportEventColor(alpha: CGFloat = 1.0) -> UIColor {
        return UIColor(red: 31/255, green: 175/255, blue: 205/255, alpha: alpha)
    }
    
    static func workEventColor(alpha: CGFloat = 1.0) -> UIColor {
        return UIColor(red: 253/255, green: 204/255, blue: 41/255, alpha: alpha)
    }
    
}

enum EventType {
    case Food
    case Social
    case Culture
    case Leisure
    case Transport
    case Work
    
    var color: UIColor {
        switch self {
        case .Food:
            return UIColor.foodEventColor()
        case .Social:
            return UIColor.socialEventColor()
        case .Culture:
            return UIColor.cultureEventColor()
        case .Leisure:
            return UIColor.leisureEventColor()
        case .Transport:
            return UIColor.transportEventColor()
        case .Work:
            return UIColor.workEventColor()
        }
    }
}

class Event {
    
    var title: String
    var type: EventType
    var distance: CLLocationDistance
    var date: NSDate
    var duration: NSTimeInterval
    var users: [User]?
    var location: CLLocation?
    var color: UIColor {
        return type.color
    }
    
    init(title: String, type: EventType, distance: CLLocationDistance, date: NSDate, duration: NSTimeInterval) {
        self.title = title
        self.type = type
        self.distance = distance
        self.date = date
        self.duration = duration
    }
    
}