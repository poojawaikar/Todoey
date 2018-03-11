//
//  ViewController.swift
//  Todoey
//
//  Created by Pooja on 3/7/18.
//  Copyright © 2018 PoojaWaikar. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray = [Item]()
    var textField = UITextField()
    
  //  let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
     
        
      /*  if let todoListArray = defaults.array(forKey: "TodoListArray") as? [Item] {
            itemArray = todoListArray
        }*/
        
        let item1 = Item()
        item1.title = "Find Mike"
        itemArray.append(item1)
        
        let item2 = Item()
        item2.title = "Buy Eggos"
        itemArray.append(item2)
        
    }
    
    //MARK - TableView Data Source methods
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        let item = itemArray[indexPath.row]
        cell.textLabel?.text = item.title
        
        cell.accessoryType = item.checked  ? .checkmark : .none
        
        return cell
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    //MARK - TableView Delegate methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(itemArray[indexPath.row].title)
        tableView.deselectRow(at: indexPath, animated: true)
        
        itemArray[indexPath.row].checked = !itemArray[indexPath.row].checked
        
        tableView.reloadData()
    }
    
    //MARK - Add new items
    
    @IBAction func addItemButtonPressed(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add new Todoey item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            // What happens on clicking add button
           
            let addedItem = Item()
            addedItem.title = self.textField.text!
            self.itemArray.append(addedItem)
          
          //  self.defaults.set(self.itemArray, forKey: "TodoListArray")
            self.tableView.reloadData()
        }
        alert.addTextField { (alertTextField) in
            self.textField = alertTextField
            
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    
}

