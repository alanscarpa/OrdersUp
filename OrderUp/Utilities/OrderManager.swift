//
//  OrderManager.swift
//  OrderUp
//
//  Created by Alan Scarpa on 8/21/16.
//  Copyright © 2016 ARC. All rights reserved.
//

import Foundation

class OrderManager {
    static let sharedManager = OrderManager()
    var orders = [Order]()
}