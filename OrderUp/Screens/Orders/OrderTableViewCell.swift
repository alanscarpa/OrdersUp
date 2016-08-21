//
//  OrderTableViewCell.swift
//  OrderUp
//
//  Created by Alan Scarpa on 8/21/16.
//  Copyright © 2016 ARC. All rights reserved.
//

import UIKit
import Alamofire

protocol OrderTableViewCellDelegate: class {
    func doneButtonTapped(sender: OrderTableViewCell)
}

class OrderTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    weak var delegate: OrderTableViewCellDelegate?
    
    @IBAction func doneButtonTapped() {
        delegate?.doneButtonTapped(self)
    }
    
    func configureWithOrder(order: Order) {
        nameLabel.text = order.name
        phoneNumberLabel.text = order.phoneNumber
    }
}
