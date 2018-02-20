//: Playground - noun: a place where people can play

import UIKit

class Meal {
    
    var name:String
    var happiness:Int
    var itens:Array<Item> = []
    
    
    init(name:String, happiness:Int) {
        self.name = name
        self.happiness = happiness
    }
    
    func totalCalories() -> Double {
        
        var total:Double = 0
        for item in itens {
            total += item.calories
        }
        
        return total
    }
}

class Item {
    
    var name:String
    var calories:Double
    
    init(name:String, calories:Double) {
        self.name = name
        self.calories = calories
    }
}

var brownie = Meal(name: "Eggplant Brownie", happiness: 5)
print("Eaten \(brownie.name) with happiness \(brownie.happiness)")

let item1 = Item(name: "Brownie", calories: 115)
let item2 = Item(name: "Vegan Cream", calories: 40)

brownie.itens.append(item1)
brownie.itens.append(item2)

print("Total de calorias: \(brownie.totalCalories())")

