//
//  FirstViewController.swift
//  TravelWayThree
//
//  Created by Gustaf Nilklint on 2015-10-02.
//  Copyright © 2015 Gustaf Nilklint. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

  @IBOutlet weak var eventsTable: UITableView!{
    didSet{
      eventsTable.dataSource = self
      eventsTable.delegate = self
      eventsTable.estimatedRowHeight = 44
      eventsTable.rowHeight = UITableViewAutomaticDimension
      eventsTable.backgroundColor = UIColor.Travelwhite()
    }
  }
  
  enum CellIdentifiers : String {
    case Event = "fakeEvent"
  }
  
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    if let event = eventsTable.dequeueReusableCellWithIdentifier(CellIdentifiers.Event.rawValue) as? EventCell {
      event.card.backgroundColor = UIColor.TravelGreenLight()
      return event;
    }
    
    return UITableViewCell()
  }

  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 3
  }
  
}

