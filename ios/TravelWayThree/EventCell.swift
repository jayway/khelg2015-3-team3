//
//  EventCell.swift
//  TravelWayThree
//
//  Created by Gustaf Nilklint on 2015-10-02.
//  Copyright © 2015 Gustaf Nilklint. All rights reserved.
//

import UIKit

class EventIconView: UIView {
    
    @IBOutlet weak var icon: UIImageView!
    
    var type: EventType = .Food {
        didSet {
            self.backgroundColor = type.color
            
        }
    }
    
    override func awakeFromNib() {
        
    }
    
}

class EventCell: UITableViewCell {
    
    @IBOutlet weak var eventIcon: UIImageView!
    @IBOutlet weak var card: Card!
    @IBOutlet weak var eventTitle: UILabel!
    @IBOutlet weak var eventText: UILabel!
    @IBAction func didPressJoin(sender: UIButton) {
        
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureWithEvent(event: Event) {
        card.backgroundColor = event.color
        
    }
}
