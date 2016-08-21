//
//  Order.swift
//  OrderUp
//
//  Created by Alan Scarpa on 8/21/16.
//  Copyright © 2016 ARC. All rights reserved.
//

import Foundation

class Order {
    var name = ""
    var phoneNumber = ""
    
    init(name: String, phoneNumber: String) {
        self.name = name
        self.phoneNumber = phoneNumber
    }
}