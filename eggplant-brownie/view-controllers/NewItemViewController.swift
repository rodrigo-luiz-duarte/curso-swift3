//
//  NewItemViewController.swift
//  eggplant-brownie
//
//  Created by Rodrigo Luiz Duarte on 20/02/2018.
//  Copyright © 2018 Rodrigo Luiz Duarte. All rights reserved.
//

import UIKit

class NewItemViewController: UIViewController {
    
    @IBOutlet var nameField: UITextField?
    @IBOutlet var calorieField: UITextField?
    var itemManagerDelegate:ItemManagerDelegate?
    
    init(delegate:ItemManagerDelegate) {
        super.init(nibName: "NewItemViewController", bundle: nil)
        self.itemManagerDelegate = delegate
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addNewItem() {
        
        let name = nameField!.text
        let calories = Double((calorieField!.text)!)
        if(name == nil || calories == nil) {
            return
        }
        
        let item = Item(name: name!, calories: calories!)
        itemManagerDelegate?.addItem(item)
        
        if let navigation = navigationController {
            navigation.popViewController(animated: true)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
