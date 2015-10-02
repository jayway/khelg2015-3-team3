//
//  Card.swift
//  TravelWayThree
//
//  Created by Gustaf Nilklint on 2015-10-02.
//  Copyright © 2015 Gustaf Nilklint. All rights reserved.
//

import UIKit

@IBDesignable
class Card: UIView {

  @IBInspectable var cornerRadius : CGFloat = 10
  @IBInspectable var shadowOffset : CGSize = CGSizeMake(0, 2)
  @IBInspectable var shadowRadius : CGFloat = 4
  @IBInspectable var shadowOpacity : Float = 0.3
  
  override func awakeFromNib() {
    super.awakeFromNib()
    self.layer.cornerRadius = self.cornerRadius
    self.layer.shadowOffset = self.shadowOffset
    self.layer.shadowRadius = self.shadowRadius
    self.layer.shadowColor = UIColor.TravelBlack().CGColor
    self.layer.shadowOpacity = self.shadowOpacity
    self.layer.masksToBounds = false
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
  
}
