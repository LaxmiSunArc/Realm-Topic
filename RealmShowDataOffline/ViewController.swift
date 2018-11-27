//
//  ViewController.swift
//  RealmDemo
//
//  Created by Anand Suthar on 19/11/18.
//  Copyright © 2018 Anand Suthar. All rights reserved.
//

import UIKit
import Kingfisher
import RealmSwift

class ViewController: UIViewController {

    let notice = MyNotice()
    var searchHistorie: Results<SearchData>!
    var whichCellShow = false
    var selectedIndex = 0
    var noticeArs = [Notice]()
    var searchArr = [Notice]()
    @IBOutlet weak var searchBox: UISearchBar!
    @IBOutlet weak var tblView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
              
        notice.getNotice(Success: { (noticeArrs) in
            self.noticeArs = noticeArrs
            self.tblView.reloadData()
        }) { (errormessage,arrayFails) in
            self.noticeArs = arrayFails
            self.tblView.reloadData()
            print(errormessage)
        }
      
        self.search(nextPage: true)
       searchBox.resignFirstResponder()
    }
    
    func search(nextPage: Bool) {
        nextPage == true
        let searchTerm = searchBox.text!.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
        SearchRealm.getSearchNotices(searchTerm!, success: { (searchArrs) in
            self.searchArr = searchArrs
        }, failur: { (errorMessage) in
            print(errorMessage)
             self.tblView.reloadData()
        })
    
}
    
}
extension ViewController : UITableViewDataSource,UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if whichCellShow == false {
        return noticeArs.count
         }
        else {
            return searchHistorie.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if whichCellShow == false{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! TableViewCell
            cell.imgNotice.layer.cornerRadius = 5
            cell.keywordLbl.layer.cornerRadius = 5
            cell.noticee = noticeArs[indexPath.row]
            return cell
            
        }else{
            let cellSearch:seachTblCell = tableView.dequeueReusableCell(withIdentifier: "searchCell") as! seachTblCell
            cellSearch.searchLbl.text = searchHistorie[indexPath.row].searchData
            return cellSearch
                
            }
          
          
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        selectedIndex = indexPath.row
      //  searchBox.resignFirstResponder()
        if whichCellShow == true {
           
            SearchRealm.getSearchNotices(searchHistorie[selectedIndex].searchData, success: { (searchArr) in
                self.whichCellShow = false
               self.searchArr = searchArr
                self.tblView.reloadData()
                
            }) { (errorMessage) in
                print(errorMessage)

    }
   }
        
}
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}
extension ViewController:UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        whichCellShow = true
        searchHistorie = DB.shared.realm.objects(SearchData.self).filter("searchData contains[c] '\(searchBox.text!)'")
        if searchHistorie.count > 0 {
            tblView.isHidden = false
        }else{
            tblView.isHidden = true
        }
        tblView.reloadData()
    }
  
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        whichCellShow = true
        print(searchBox.text!)
        self.search(nextPage: true)
        let searchHistory = SearchData()
        searchHistory.searchData = searchBox.text!
        
        searchHistory.save()
        
        searchHistorie = DB.shared.realm.objects(SearchData.self)
        if searchHistorie.count > 0 {
            tblView.isHidden = false
        }else{
            tblView.isHidden = true
        }
        
    }
    
}





class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var keywordLbl: UILabel!
    @IBOutlet weak var productDetail: UILabel!
     @IBOutlet weak var shortLbl: UILabel!
    @IBOutlet weak var imgNotice: UIImageView!
    
      var noticee:Notice?{
        didSet {
            
            if let noticee = noticee {
                self.keywordLbl.text = noticee.merchentName
                self.productDetail.text =  noticee.title
                self.shortLbl.text = noticee.categoryName
                let url = URL(string: noticee.image!)
                imgNotice.kf.setImage(with: url)
            
                
            }
        }
    }
    
}

class seachTblCell:UITableViewCell {
   
    @IBOutlet weak var searchLbl: UILabel!
    
    
    
}
