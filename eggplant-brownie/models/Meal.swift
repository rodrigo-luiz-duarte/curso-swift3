//
//  Meal.swift
//  eggplant-brownie
//
//  Created by Rodrigo Luiz Duarte on 20/02/2018.
//  Copyright © 2018 Rodrigo Luiz Duarte. All rights reserved.
//

import Foundation

class Meal {
    
    let name:String
    let happiness:Int
    let items:Array<Item>
    
    init(name:String, happiness:Int, items:Array<Item> = []) {
        self.name = name
        self.happiness = happiness
        self.items = items
    }
    
    func totalCalories() -> Double {
        var total:Double = 0
        
        for item in items {
            total += item.calories
        }
        
        return total
    }
    
    func details() -> String {
        var message = "Happiness: \(self.happiness)"
        for item in self.items {
            message += "\n\(item.name) - Calories: \(item.calories)"
        }
        
        return message
    }
}
