//
//  HomeViewController.swift
//  OrderUp
//
//  Created by Alan Scarpa on 8/21/16.
//  Copyright © 2016 ARC. All rights reserved.
//

import UIKit
import Alamofire

class OrdersViewController: UIViewController, OrderTableViewCellDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    private func setUpTableView() {
        tableView.registerNib(UINib(nibName: "OrderTableViewCell", bundle: nil), forCellReuseIdentifier: "OrderTableViewCell")
    }
    
    // MARK: UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return OrderManager.sharedManager.orders.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("OrderTableViewCell", forIndexPath: indexPath) as! OrderTableViewCell
        cell.delegate = self
        cell.configureWithOrder(OrderManager.sharedManager.orders[indexPath.row])
        return cell
    }

    @IBAction func addOrderButtonTapped() {
        let addOrderVC = NewOrderViewController()
        navigationController?.pushViewController(addOrderVC, animated: true)
    }
    
    // MARK: OrderTableViewCellDelegate
    
    func doneButtonTapped(sender: OrderTableViewCell) {
        guard let indexPath = tableView.indexPathForCell(sender) else { return }
        let order = OrderManager.sharedManager.orders[indexPath.row]
        
        let user = kTwilioUserKey
        let password = kTwilioPassword
        let bodyText = "Hey \(order.name), your order is now ready for pick-up.  Come and get it!"
        let parameters = ["To" : order.phoneNumber, "From": "+12012317077", "Body" : bodyText]
        
        Alamofire.request(.POST, "https://api.twilio.com/2010-04-01/Accounts/ACaface08c72cda73db90ab8969197b66a/Messages.json", parameters: parameters)
            .authenticate(user: user, password: password)
            .responseJSON { response in
                if response.result.isFailure {
                    self.presentViewController(UIAlertController.alertWithTitle("Error Sending Text Message", message: "Unable to notify customer.  Please try again or call to notify."), animated: true, completion: nil)
                } else {
                    self.presentViewController(UIAlertController.alertWithTitle("Text message sent", message: "Customer has been notified."), animated: true, completion: {
                        OrderManager.sharedManager.orders.removeAtIndex(indexPath.row)
                        self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
                    })
                }
        }
    }
}
