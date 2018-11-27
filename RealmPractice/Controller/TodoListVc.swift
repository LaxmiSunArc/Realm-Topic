//
//  TodoListVc.swift
//  RealmPractice
//
//  Created by Anand Suthar on 26/11/18.
//  Copyright © 2018 Anand Suthar. All rights reserved.
//

import UIKit
import RealmSwift

class TodoListVc: UIViewController {
 
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var tableView: UITableView!
    
    var todoItems: Results<Item>?
    var selectedCategory : Category? {
       didSet{
             loadItems()
       }
    }
    
     override func viewDidLoad() {
        super.viewDidLoad()
    tableView.separatorStyle = .none
    
    }
    override func viewWillAppear(_ animated: Bool) {
        
        title = selectedCategory?.name
        
    }

    
    @IBAction func btnAddTapped(_ sender: Any) {
  
      
        var textField = UITextField()
        let alert = UIAlertController(title: "Add New Category", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
            
            if let currentCategory = self.selectedCategory {
                do {
                    try DB.shared.realm.write {
                        let newItem = Item()
                        newItem.title = textField.text!
                        newItem.dateCreated = Date()
                        currentCategory.items.append(newItem)
                    }
                } catch {
                    print("Error saving new items, \(error)")
                }
            }
          self.tableView.reloadData()
        }
        alert.addAction(action)
        alert.addTextField { (field) in
            textField = field
            textField.placeholder = "Add a new Category"
        }
        present(alert, animated: true, completion: nil)
        
    }
    
    
    
    
    func loadItems() {
        
        todoItems = selectedCategory?.items.sorted(byKeyPath: "title", ascending: true)
        
      tableView.reloadData()
        
    }
    
    func updateModel(at indexPath: IndexPath) {
        if let item = todoItems?[indexPath.row] {
            do {
                 DB.shared.realm.delete(item)
            } catch {
                print("Error deleting Item, \(error)")
            }
        }
    }
    
        
}



extension TodoListVc: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoItems?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellToDo", for: indexPath)
        if let item = todoItems?[indexPath.row] {
            
        cell.textLabel?.text = item.title
         
        cell.accessoryType = item.done ? .checkmark : .none
        }else
        {
            cell.textLabel?.text = "No Items Added"
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let item = todoItems?[indexPath.row] {
            do {
                try DB.shared.realm.write {
                    item.done = !item.done
                }
                
            } catch {
                print("Error saving done status, \(error)")
            }
        }
        
        tableView.reloadData()
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    
    
    
    
}
extension TodoListVc: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        todoItems = todoItems?.filter("title CONTAINS[cd] %@", searchBar.text!).sorted(byKeyPath: "dateCreated", ascending: true)
        
        tableView.reloadData()
        
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text?.count == 0 {
            loadItems()
            
            DispatchQueue.main.async {
                searchBar.resignFirstResponder()
            }
            
        }
    }
}
