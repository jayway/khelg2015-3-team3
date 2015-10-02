//
//  BorderedButton.swift
//  TravelWayThree
//
//  Created by Fredrik Nannestad on 02/10/2015.
//  Copyright © 2015 Gustaf Nilklint. All rights reserved.
//

import Foundation

@IBDesignable
class BorderedButton: UIButton {
    
    @IBInspectable var color: UIColor? {
        didSet {
            tintColor = color
            setNeedsDisplay()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Make sure title set in IB is padded:
        setTitle(self.titleForState(.Normal), forState: .Normal)
        self.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 10)
        titleLabel?.lineBreakMode = NSLineBreakMode.ByClipping
    }
    
    override func drawRect(rect: CGRect) {
        layer.cornerRadius = 5.0
        layer.borderWidth = 1.0
        layer.borderColor = self.color?.CGColor
        super.drawRect(rect)
    }
}