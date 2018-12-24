//
//  ViewController.swift
//  NestedJSONRealm
//
//  Created by Anand Suthar on 03/12/18.
//  Copyright © 2018 Anand Suthar. All rights reserved.
//

import UIKit
import RealmSwift


class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    var menuData = [Menu]()
      //let objects: Results<Menu>
    @IBOutlet weak var tblView: UITableView!
    
    
    
    
     let menu = Menu()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menu.getMenuItems({ (menu) in
            self.menuData = menu
            self.tblView.reloadData()
        }) { (errorMessage, menu) in
            self.menuData = menu
            self.tblView.reloadData()
            print(errorMessage)
        }
        
        
        
        
        
//        menu.getMenuItems({
//
//            for childrenMenu in self.menu.rawChildrenDatas{
//                if childrenMenu.isActive == true{
//                    self.menuData.append(childrenMenu)
//                   //self.getNearByNoticeFromDB()
//                }
//
//
//            }
//
//
//            self.tblView.reloadData()
//            print("get data")
//        }) { (errormessage) in
//             //self.getNearByNoticeFromDB()
//            for childrenMenu in self.menu.rawChildrenDatas{
//                if childrenMenu.isActive == true{
//                    self.menuData.append(childrenMenu)
//                    //self.getNearByNoticeFromDB()
//                }
//
//
//            }
//
//              self.tblView.reloadData()
//            print(errormessage)
//        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = menuData[indexPath.row].name
        return cell
    }
}

extension ViewController {
    func getNearByNoticeFromDB() {
        let objects: Results<Menu> = DB.shared.realm.objects(Menu.self)
        self.menuData = objects.toArray(ofType: Menu.self)
    }
}
