//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Rodrigo Luiz Duarte on 19/02/2018.
//  Copyright © 2018 Rodrigo Luiz Duarte. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet
    var nameField : UITextField?
    
    @IBOutlet
    var happinessField : UITextField?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction
    func add() {
        
        if nameField == nil || happinessField == nil {
            return
        }
        let name = nameField!.text!
        if let happiness = Int(happinessField!.text!) {
            let meal = Meal(name: name, happiness: happiness)
            print("Eaten \(meal.name) with happiness \(meal.happiness)")
        }
    }
}

