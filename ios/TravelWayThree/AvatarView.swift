//
//  AvatarView.swift
//  TravelWayThree
//
//  Created by Gustaf Nilklint on 2015-10-02.
//  Copyright © 2015 Gustaf Nilklint. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class AvatarView: UIView {
  
  @IBInspectable
  var borderColor:UIColor = UIColor.clearColor()
  
  @IBInspectable
  var hasBorder:Bool = false
  
  var imageView:UIImageView!
  
  @IBInspectable
  var image:UIImage? {
    set {
      self.imageView.image = newValue
    }
    get {
      return self.imageView.image
    }
  }
  
  required init(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)!
    addSubviews()
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    addSubviews()
  }
  
  private func addSubviews(){
    self.imageView = UIImageView()
    self.imageView.contentMode = UIViewContentMode.ScaleAspectFill
    addSubview(self.imageView)
  }
  
  // We need to update the radius and borderWidth on layoutSubviews because the frame width might change due to AutoLayout
  override func layoutSubviews() {
    super.layoutSubviews()
    self.layoutIfNeeded()
    self.imageView.frame = self.bounds
    self.updateCornerRadius()
    self.updateBorder()
  }
  
  private func updateCornerRadius(){
    self.clipsToBounds = true
    self.layer.cornerRadius = self.layer.frame.width / 2;
    self.layer.borderColor = self.borderColor.CGColor
  }
  
  private func updateBorder(){
    self.layer.borderWidth = self.targetBorderWidth()
  }
  
  private func targetBorderWidth() -> CGFloat {
    if hasBorder {
      return AvatarView.getBorderWidth(self.layer.frame.width)
    } else {
      return 0
    }
  }
  
  func setHasBorder(hasBorder:Bool, animated:Bool=true){
    self.hasBorder = hasBorder
    updateBorder()
  }
  
  class func getBorderWidth(width:CGFloat) -> CGFloat{
    return ceil(width/22.0)
  }
  
  override func prepareForInterfaceBuilder() {
    super.prepareForInterfaceBuilder()
    
    if nil == self.image {
      self.image = UIImage(named: "player_4", inBundle: NSBundle(forClass: self.dynamicType),
        compatibleWithTraitCollection: nil)
    }
  }
}
