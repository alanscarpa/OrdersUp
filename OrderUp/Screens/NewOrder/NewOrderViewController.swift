//
//  NewOrderViewController.swift
//  OrderUp
//
//  Created by Alan Scarpa on 8/21/16.
//  Copyright © 2016 ARC. All rights reserved.
//

import UIKit

class NewOrderViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    @IBAction func addOrderButtonTapped() {
        let newOrder = Order(name: nameTextField.text ?? "", phoneNumber: phoneNumberTextField.text ?? "")
        OrderManager.sharedManager.orders.append(newOrder)
        navigationController?.popViewControllerAnimated(true)
    }
    
    
    @IBAction func cancelButtonTapped() {
        navigationController?.popViewControllerAnimated(true)
    }

}
