//
//  CategoryVc.swift
//  RealmPractice
//
//  Created by Anand Suthar on 26/11/18.
//  Copyright © 2018 Anand Suthar. All rights reserved.
//

import UIKit
import RealmSwift


class CategoryVc: UIViewController {

    var categories:Results<Category>?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         self.loadCategoryFromDB()
        
    }
    

    
    func loadCategoryFromDB(){
        
        categories = DB.shared.realm.objects(Category.self)
        tableView.reloadData()
        
    }
    
   
    
    @IBAction func btnAddCategoris(_ sender: Any) {
   
        var textField = UITextField()
        let alert = UIAlertController(title: "Add New Category", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
            let newCategory = Category()
            newCategory.name = textField.text!
            newCategory.save()
            self.tableView.reloadData()
        }
        alert.addAction(action)
        alert.addTextField { (field) in
            textField = field
            textField.placeholder = "Add a new Category"
        }
       present(alert, animated: true, completion: nil)
    
    }
    
   
}

extension CategoryVc: UITableViewDelegate,UITableViewDataSource{
    
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories?.count ?? 1
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        if let category = categories?[indexPath.row] {
            cell.textLabel?.text = category.name
            
        }
       
        
        return cell
    }
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: self)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete{
            if let category = categories?[indexPath.row] {
                try! DB.shared.realm.write {
                    DB.shared.realm.delete(category)
                    self.tableView.reloadData()
                }
                tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
            }
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TodoListVc
        
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = categories?[indexPath.row]
        }
    }
    
    
   
  
    
}
