//
//  Item.swift
//  eggplant-brownie
//
//  Created by Rodrigo Luiz Duarte on 20/02/2018.
//  Copyright © 2018 Rodrigo Luiz Duarte. All rights reserved.
//

import Foundation

class Item: NSObject, NSCoding {
    
    var name:String
    var calories:Double
    
    init(name:String, calories:Double) {
        self.name = name
        self.calories = calories
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.name, forKey: "name")
        aCoder.encode(self.calories, forKey: "calories")
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.name = aDecoder.decodeObject(forKey: "name") as! String
        self.calories = aDecoder.decodeDouble(forKey: "calories")
    }
}

func ==(first:Item, second:Item) -> Bool {
    return first.name == second.name && first.calories == second.calories
}
