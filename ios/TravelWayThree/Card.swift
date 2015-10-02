//
//  Card.swift
//  TravelWayThree
//
//  Created by Gustaf Nilklint on 2015-10-02.
//  Copyright © 2015 Gustaf Nilklint. All rights reserved.
//

import UIKit
import MapKit

@IBDesignable
class Card: UIView {
    
    @IBInspectable var cornerRadius : CGFloat = 10
    @IBInspectable var shadowOffset : CGSize = CGSizeMake(0, 2)
    @IBInspectable var shadowRadius : CGFloat = 4
    @IBInspectable var shadowOpacity : Float = 0.3
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var joinButton: UIButton!
    @IBOutlet weak var joinedView: UIView!
    @IBOutlet weak var joinedUsersView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = self.cornerRadius
        self.layer.shadowOffset = self.shadowOffset
        self.layer.shadowRadius = self.shadowRadius
        self.layer.shadowColor = UIColor.TravelBlack().CGColor
        self.layer.shadowOpacity = self.shadowOpacity
        self.layer.masksToBounds = false
        distanceFormatter.units = MKDistanceFormatterUnits.Metric
        distanceFormatter.unitStyle = MKDistanceFormatterUnitStyle.Abbreviated
    }
    
    override func prepareForInterfaceBuilder() {
        self.layer.cornerRadius = self.cornerRadius
        self.layer.shadowOffset = self.shadowOffset
        self.layer.shadowRadius = self.shadowRadius
        self.layer.shadowColor = UIColor.TravelBlack().CGColor
        self.layer.shadowOpacity = self.shadowOpacity
        self.layer.masksToBounds = false
        self.clipsToBounds = false
    }
    
    var event: Event? {
        didSet {
            if let event = event {
                backgroundColor = event.color
                titleLabel.text = event.title
                dateLabel.text = NSDateFormatter.localizedStringFromDate(event.date, dateStyle: NSDateFormatterStyle.NoStyle, timeStyle: NSDateFormatterStyle.ShortStyle)
                distanceLabel.text = distanceFormatter.stringFromDistance(event.distance)
                descriptionLabel.text = event.description
            }
        }
    }
    
    private var distanceFormatter = MKDistanceFormatter()
    
    
}
