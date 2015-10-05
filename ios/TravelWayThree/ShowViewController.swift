//
//  ShowViewController.swift
//  TravelWayThree
//
//  Created by Fredrik Nannestad on 03/10/2015.
//  Copyright © 2015 Gustaf Nilklint. All rights reserved.
//

import UIKit

class ShowViewController: UIViewController {
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}
