//
//  HomeViewController.swift
//  OrderUp
//
//  Created by Alan Scarpa on 8/21/16.
//  Copyright © 2016 ARC. All rights reserved.
//

import UIKit

class OrdersViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
    }
    
    private func setUpTableView() {
        tableView.registerNib(UINib(nibName: "OrderTableViewCell", bundle: nil), forCellReuseIdentifier: "OrderTableViewCell")
    }
    
    // MARK: UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("OrderTableViewCell", forIndexPath: indexPath)
        return cell
    }

}
