//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Rodrigo Luiz Duarte on 19/02/2018.
//  Copyright © 2018 Rodrigo Luiz Duarte. All rights reserved.
//

import UIKit

class ViewController: UIViewController,
                    UITableViewDataSource,
                    UITableViewDelegate,
                    ItemManagerDelegate {
    
    @IBOutlet var nameField : UITextField?
    @IBOutlet var happinessField : UITextField?
    var mealManagerDelegate:MealManagerDelegate?
    var itemsSelected = Array<Item>()
    
    var items = [
        Item(name: "Eggplant", calories: 10),
        Item(name: "Brownie", calories: 10),
        Item(name: "Zucchini", calories: 10),
        Item(name: "Muffin", calories: 10),
        Item(name: "Coconut oil", calories: 500),
        Item(name: "Chocolate frosting", calories: 1000),
        Item(name: "Chocolate chip", calories: 1000)
    ]
    
    @IBOutlet var tableView: UITableView?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newItemButton = UIBarButtonItem(title: "New Item",
                                            style: UIBarButtonItemStyle.plain,
                                            target: self, action: #selector(showNewItem))
        navigationItem.rightBarButtonItem = newItemButton
        
        items = Dao().load()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let row = indexPath.row
        let item = items[row]
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: nil)
        cell.textLabel?.text = item.name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let cell = tableView.cellForRow(at: indexPath) {
            if (cell.accessoryType == UITableViewCellAccessoryType.none) {
                
                cell.accessoryType = UITableViewCellAccessoryType.checkmark
                
                let item = items[indexPath.row]
                itemsSelected.append(item)
                
            } else {
                
                cell.accessoryType = UITableViewCellAccessoryType.none
                
                let item  = items[indexPath.row]
                if let position = itemsSelected.index(of: item) {
                    itemsSelected.remove(at: position)
                    print("Removeu item \(item.name)")
                }
            }
        } else {
            Alert(controller: self).showErrorMessage(message: "Não foi possível recuperar a célula selecionada.")
        }
    }
    
    func convertToInt(_ text: String?) -> Int? {
        
        if let number = text {
            return Int(number)
        }
        return nil
    }
    
    func getMealFromForm() -> Meal? {
        
        if let name = nameField?.text {
            if let happiness = convertToInt(happinessField?.text) {
                return Meal(name: name, happiness: happiness, items: itemsSelected)
            }
        }
        return nil
    }

    @IBAction
    func add() {
        
        if let meal = getMealFromForm() {
            if let delegate = mealManagerDelegate {
                delegate.addMeal(meal)
                if let navigation = navigationController {
                    navigation.popViewController(animated: true)
                } else {
                    Alert(controller: self).show(message: "Não foi possível retornar, mas refeição foi adicionada com sucesso.")
                }
                return
            }
        }
        
        Alert(controller: self).show(message: "Não foi possível adicionar a refeição")
    }
    
    @objc func showNewItem() {
        
        let newItem = NewItemViewController(delegate: self)
        
        if let navigation = navigationController {
            navigation.pushViewController(newItem, animated: true)
        } else {
            Alert(controller: self).showErrorMessage(message: "Não foi possível exibir a tela de adição de itens.")
        }
    }
    
    func addItem(_ item: Item) {
        items.append(item)
        Dao().save(items)
        if let table = tableView {
            table.reloadData()
        } else {
            Alert(controller: self).showErrorMessage(message: "Não foi possível atualizar dados da tabela")
        }
    }
}

