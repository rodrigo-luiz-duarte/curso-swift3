//
//  Meal.swift
//  eggplant-brownie
//
//  Created by Rodrigo Luiz Duarte on 20/02/2018.
//  Copyright © 2018 Rodrigo Luiz Duarte. All rights reserved.
//

import Foundation

class Meal: NSObject, NSCoding {
    
    let name:String
    let happiness:Int
    let items:Array<Item>
    
    init(name:String, happiness:Int, items:Array<Item> = []) {
        self.name = name
        self.happiness = happiness
        self.items = items
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.name, forKey: "name")
        aCoder.encode(self.happiness, forKey: "happiness")
        aCoder.encode(self.items, forKey: "items")
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.name = aDecoder.decodeObject(forKey: "name") as! String
        self.happiness = aDecoder.decodeInteger(forKey: "happiness")
        self.items = aDecoder.decodeObject(forKey: "items") as! Array<Item>
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
