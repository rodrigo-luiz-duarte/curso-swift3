//
//  DetailMealController.swift
//  eggplant-brownie
//
//  Created by Rodrigo Luiz Duarte on 21/02/2018.
//  Copyright © 2018 Rodrigo Luiz Duarte. All rights reserved.
//

import Foundation
import UIKit

class DetailMealController {
    
    var controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func showDetails(meal: Meal, removeHandler: @escaping (UIAlertAction) -> Void) {
        
        let details = UIAlertController(title: meal.name,
                                        message: meal.details(),
                                        preferredStyle: UIAlertControllerStyle.alert)
        
        let cancel = UIAlertAction(title: "Cancel",
                                   style: UIAlertActionStyle.cancel,
                                   handler: nil)
        details.addAction(cancel)
        
        let remove = UIAlertAction(title: "Remove",
                                   style: UIAlertActionStyle.destructive,
                                   handler: removeHandler)
        details.addAction(remove)
        
        controller.present(details, animated: true, completion: nil)
    }
}
