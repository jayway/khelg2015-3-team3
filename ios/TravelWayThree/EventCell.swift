//
//  EventCell.swift
//  TravelWayThree
//
//  Created by Gustaf Nilklint on 2015-10-02.
//  Copyright © 2015 Gustaf Nilklint. All rights reserved.
//

import UIKit

class EventIcon: UIImageView {
    
    var type: EventType = .Food {
        didSet {
            self.image = type.icon
        }
    }
    
}

class EventIconView: UIView {
    
    @IBOutlet weak var icon: EventIcon!
    
    var type: EventType = .Food {
        didSet {
            backgroundColor = type.color
            icon.type = type
        }
    }
    
}

class EventCell: UITableViewCell {
    
    @IBOutlet weak var card: Card!
    @IBOutlet weak var eventIconView: EventIconView!
    
    func configureWithEvent(event: Event) {
        card.event = event
        eventIconView.type = event.type
    }
    
}
