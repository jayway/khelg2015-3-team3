//
//  FirstViewController.swift
//  TravelWayThree
//
//  Created by Gustaf Nilklint on 2015-10-02.
//  Copyright © 2015 Gustaf Nilklint. All rights reserved.
//

import UIKit
import MapKit

class FeedViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var eventsTable: UITableView!{
        didSet{
            eventsTable.dataSource = self
            eventsTable.delegate = self
            eventsTable.estimatedRowHeight = 44
            eventsTable.rowHeight = UITableViewAutomaticDimension
            eventsTable.backgroundColor = UIColor.Travelwhite()
        }
    }
    var events: [Event] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.events = EventFactory().createEvents()
        self.eventsTable.reloadData()
        beginObserving()
        LocationService.sharedService.startLocationService()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    deinit {
        endObserving()
    }
    
    private var notifications = [NSObjectProtocol]()
    
    private func beginObserving() {
        let nc = NSNotificationCenter.defaultCenter()
        notifications.append(nc.addObserverForName(LocationServiceDidUpdateCurrentLocationNotification, object: nil, queue: NSOperationQueue.mainQueue()) { [unowned self] notification in
                self.mapView.userTrackingMode = .Follow
            })
    }
    
    private func endObserving() {
        let nc = NSNotificationCenter.defaultCenter()
        notifications.forEach { nc.removeObserver($0) }
        notifications.removeAll(keepCapacity: false)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = eventsTable.dequeueReusableCellWithIdentifier(EventCellIdentifier) as? EventCell {
            cell.configureWithEvent(events[indexPath.row])
            return cell;
        }
        return UITableViewCell()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
}

class EventFactory {
    
    func createEvents(count: Int = 4) -> [Event] {
        var events = [Event]()
        var title: String = ""
        var description: String = ""
        var type: EventType = .Food
        var distance: CLLocationDistance = 1.3
        var date = NSDate()
        var duration: NSTimeInterval = 1 * 60 * 60
        for index in 0..<count {
            switch index {
            case 0:
                title = "Elmo's place"
                description = "Let's meet up at Elmo's place for some drinks after dinner.\n I've heard the mojitos are really good there :). It was my friend who recommended it to me! She visited New York last month. I walked by the place yesterday, looks really nice."
                type = .Social
                distance = 1.3 * 1000
                date = date.dateByAddingTimeInterval(2 * 60 * 60)
                duration = 3 * 60 * 60
            case 1:
                title = "Noma"
                description = "We're all having diner at Noma! Let's meet in the reception at 17:30"
                type = .Food
                distance = 2.5 * 1000
                date = date.dateByAddingTimeInterval(60 * 60)
                duration = 3 * 60 * 60
            case 2:
                title = "Park rest"
                description = "It's such nice weather, let's enjoy the sun in the park nearby the hotel"
                type = .Leisure
                distance = 2.5 * 1000
                date = date.dateByAddingTimeInterval(10 * 60)
                duration = 60 * 60
            case 3:
                title = "Empire State skyview"
                description = "It's maybe a little expensive, but I've heard the view is really great!"
                type = .Culture
                distance =  5.3 * 1000
                date = date.dateByAddingTimeInterval(10 * 60)
                duration = 60 * 60
            default:
                break
            }
            let event = Event(title: title, description: description, type: type, distance: distance, date: date, duration: duration)
            events.append(event)
        }
        return events
    }
    
}

