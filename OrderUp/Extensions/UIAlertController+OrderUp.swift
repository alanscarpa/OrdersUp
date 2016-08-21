//
//  UIAlertController+OrderUp.swift
//  OrderUp
//
//  Created by Alan Scarpa on 8/21/16.
//  Copyright © 2016 ARC. All rights reserved.
//

import UIKit

extension UIAlertController {
    static func alertWithTitle(title: String, message: String) -> UIAlertController {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        let action = UIAlertAction(title: "OK", style: .Cancel, handler: nil)
        alertVC.addAction(action)
        return alertVC
    }
}