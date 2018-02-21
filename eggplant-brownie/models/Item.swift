//
//  Item.swift
//  eggplant-brownie
//
//  Created by Rodrigo Luiz Duarte on 20/02/2018.
//  Copyright © 2018 Rodrigo Luiz Duarte. All rights reserved.
//

import Foundation

class Item: Equatable {
    
    var name:String
    var calories:Double
    
    init(name:String, calories:Double) {
        self.name = name
        self.calories = calories
    }
}

func ==(first:Item, second:Item) -> Bool {
    return first.name == second.name && first.calories == second.calories
}
