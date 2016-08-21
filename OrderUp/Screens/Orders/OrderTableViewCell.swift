//
//  OrderTableViewCell.swift
//  OrderUp
//
//  Created by Alan Scarpa on 8/21/16.
//  Copyright © 2016 ARC. All rights reserved.
//

import UIKit
import Alamofire

class OrderTableViewCell: UITableViewCell {
    
    // 7323202909
    @IBAction func doneButtonTapped() {
        let user = kTwilioUserKey
        let password = kTwilioPassword
        let bodyText = "Your order is now ready for pick-up.  Come and get it!"
        let parameters = ["To" : "7323202909", "From": "+12012317077", "Body" : bodyText]
        
        Alamofire.request(.POST, "https://api.twilio.com/2010-04-01/Accounts/ACaface08c72cda73db90ab8969197b66a/Messages.json", parameters: parameters)
            .authenticate(user: user, password: password)
            .responseJSON { response in
                if let error = response.result.error {
                    // error sending text
                } else {
                    // success
                }
                debugPrint(response)
        }
    }
}
