//
//  EventCell.swift
//  TravelWayThree
//
//  Created by Gustaf Nilklint on 2015-10-02.
//  Copyright © 2015 Gustaf Nilklint. All rights reserved.
//

import UIKit

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
}
