//
//  Dao.swift
//  eggplant-brownie
//
//  Created by Rodrigo Luiz Duarte on 21/02/2018.
//  Copyright © 2018 Rodrigo Luiz Duarte. All rights reserved.
//

import Foundation

class Dao {
    
    func getUserDirectory() -> String {
        let userDirs = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory,
                                                           FileManager.SearchPathDomainMask.userDomainMask, true)
        let dir = userDirs[0]
        
        return dir
    }
    
    func getFileName(for resource:String) -> String {
        
        let dir = self.getUserDirectory()
        let file = "\(dir)/eggplant-brownie-\(resource).dados"
        
        return file
    }
    
    func saveData(data: NSCoding, file:String) {
        NSKeyedArchiver.archiveRootObject(data, toFile: file)
    }
    
    func loadData(file:String) -> Any? {
        return NSKeyedUnarchiver.unarchiveObject(withFile: file)
    }
    
    func save(_ meals: Array<Meal>) {
        saveData(data: meals as NSCoding, file: getFileName(for: "meals"))
    }
    
    func load() -> Array<Meal> {
        
        if let loaded = loadData(file: getFileName(for: "meals")) {
            let mealsLoaded:Array<Meal> = loaded as! Array<Meal>
            return mealsLoaded
        }
        
        return Array<Meal>()
    }
    
    func save(_ items:Array<Item>) {
        saveData(data: items as NSCoding, file: getFileName(for: "items"))
    }
    
    func load() -> Array<Item> {
        
        if let loaded = loadData(file: getFileName(for: "items")) {
            let itemsLoaded:Array<Item> = loaded as! Array<Item>
            return itemsLoaded
        }
        
        return Array<Item>()
    }
}
