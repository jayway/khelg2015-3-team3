//
//  CreateEventViewController.swift
//  TravelWayThree
//
//  Created by Fredrik Nannestad on 03/10/2015.
//  Copyright © 2015 Gustaf Nilklint. All rights reserved.
//

import UIKit

class CreateEventButton: UIView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = frame.width / 2
        backgroundColor = UIColor.TravelBlue()
    }
    
}

class EventMenuItem: UIView {
    
    var icon: EventIcon!
    
    var type: EventType = .Food {
        didSet {
            backgroundColor = type.color
            icon.type = type
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let iconFrame = CGRectInset(frame, frame.width * 0.2, frame.height * 0.2)
        icon = EventIcon(frame: iconFrame)
        addSubview(icon)
        layer.cornerRadius = self.frame.width / 2
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.cornerRadius = self.frame.width / 2
    }
    
}

class CreateEventViewController: UIViewController {

    @IBOutlet weak var createEventButton: CreateEventButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: "tap:")
        createEventButton.addGestureRecognizer(tap)
        createEventButtons()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        for button in eventButtons {
            button.center = createEventButton.center
        }
    }
    
    func tap(tap: UITapGestureRecognizer) {
        if tap.state == UIGestureRecognizerState.Ended {
            if !shows {
                self.showEventsMenu()
            } else {
                self.hideEventsMenu()
            }
        }
    }
    
    func eventTapped(tap: UITapGestureRecognizer) {
        if tap.state == UIGestureRecognizerState.Ended {
            performSegueWithIdentifier("CreateEventSegue", sender: self)
            hideEventsMenu()
        }
    }
    
    var eventButtons = [EventMenuItem]()
    var shows: Bool = false
    
    func showEventsMenu() {
        shows = true
        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: UIViewAnimationOptions.BeginFromCurrentState, animations: { () -> Void in
            for index in 0..<self.eventButtons.count {
                self.eventButtons[index].center = self.showCenterForType(index)
            }
            }) { completed in
                
        }
    }
    
    func hideEventsMenu() {
        shows = false
        UIView.animateWithDuration(0.2, animations: { () -> Void in
            for button in self.eventButtons {
                button.center = self.createEventButton.center
            }
            }) { completed in
                
        }
    }
    
    func showCenterForType(index: Int) -> CGPoint {
        let center = createEventButton.center
        let delta = view.frame.width / 6
        let x = view.frame.width / 12 + delta * CGFloat(index)
        let newCenter = CGPointMake(x, center.y - 100)
        return newCenter
    }
    
    func createEventButtons() {
        let types: [EventType] = [.Food, .Social, .Culture, .Leisure, .Transport, .Work]
        let frame = CGRectMake(0, 0, 40, 40)
        for type in types {
            let view = EventMenuItem(frame: frame)
            view.center = createEventButton.center
            view.type = type
            eventButtons.append(view)
            self.view.addSubview(view)
            view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "eventTapped:"))
        }
        view.bringSubviewToFront(createEventButton)
    }
}
