//
//  Alert.swift
//  eggplant-brownie
//
//  Created by Rodrigo Luiz Duarte on 21/02/2018.
//  Copyright © 2018 Rodrigo Luiz Duarte. All rights reserved.
//

import Foundation
import UIKit

class Alert {
    
    let controller:UIViewController
    
    init(controller:UIViewController) {
        self.controller = controller
    }
    
    func show(title:String = "Info", message:String, actionTitle: String = "Ok") {
        let alert = UIAlertController(title: title, message: message,
                                      preferredStyle: UIAlertControllerStyle.alert)
        
        let action = UIAlertAction(title: actionTitle, style: UIAlertActionStyle.cancel, handler: nil)
        alert.addAction(action)
        controller.present(alert, animated: true, completion: nil)
    }
    
    func showErrorMessage(title:String = "Error", message:String, actionTitle:String = "Ok") {
        self.show(title: title, message: message, actionTitle: actionTitle)
    }
}
