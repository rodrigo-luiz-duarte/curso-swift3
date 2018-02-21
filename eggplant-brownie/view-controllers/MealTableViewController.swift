//
//  MealTableViewController.swift
//  eggplant-brownie
//
//  Created by Rodrigo Luiz Duarte on 20/02/2018.
//  Copyright © 2018 Rodrigo Luiz Duarte. All rights reserved.
//

import UIKit

class MealTableViewController: UITableViewController, MealManagerDelegate {
    
    var meals = [Meal(name: "Eggplant Brownie", happiness: 5),
                 Meal(name: "Zucchini Muffin", happiness: 4),
                 Meal(name: "Daniela's Cheese Cake", happiness: 5)]
    
    override func viewDidLoad() {
        meals = Dao().load()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let meal = meals[indexPath.row]
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: nil)
        cell.textLabel!.text = meal.name
        
        let recognizer = UILongPressGestureRecognizer(target: self, action: #selector(showDetails))
        cell.addGestureRecognizer(recognizer)
        
        return cell
    }
    
    /*
        O underline antes do parâmetro meal, indica ao compilador que
        o nome do primeiro parâmetro não é obrigatório.
        Quando não indicado, requer informar o nome do parâmetro
     */
    func addMeal(_ meal:Meal) {
        meals.append(meal)
        Dao().save(meals)
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "addMeal") {
            let addMealView = segue.destination as! ViewController
            addMealView.mealManagerDelegate = self
        }
    }
    
    @objc func showDetails(recognizer: UILongPressGestureRecognizer) {
        
        if(recognizer.state == UIGestureRecognizerState.began) {
            let cell = recognizer.view as! UITableViewCell
            if let indexPath = tableView.indexPath(for: cell) {
                let row = indexPath.row
                let meal = meals[row]
                
                DetailMealController(controller: self).showDetails(meal: meal, removeHandler: { action in
                    self.meals.remove(at: row)
                    Dao().save(self.meals)
                    self.tableView.reloadData()
                })
            }
        }
    }
}
