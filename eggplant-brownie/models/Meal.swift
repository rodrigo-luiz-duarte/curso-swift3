//
//  Meal.swift
//  eggplant-brownie
//
//  Created by Rodrigo Luiz Duarte on 20/02/2018.
//  Copyright © 2018 Rodrigo Luiz Duarte. All rights reserved.
//

import Foundation

class Meal {
    
    var name:String
    var happiness:Int
    var items = Array<Item>()
    
    init(name:String, happiness:Int) {
        self.name = name
        self.happiness = happiness
    }
    
    func totalCalories() -> Double {
        var total:Double = 0
        
        for item in items {
            total += item.calories
        }
        
        return total
    }
}
