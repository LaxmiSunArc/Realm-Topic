//
//  ViewController.swift
//  CoreDataa
//
//  Created by SunARcTech2 on 28/11/18.
//  Copyright © 2018 SunARcTech2. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let file = Bundle.main.path(forResource: "mealss", ofType: ".json")
        let data = try! Data(contentsOf: URL(fileURLWithPath: file!))
        let json = try! JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments)
        
        if let dict = json as? [String: Any] {
            let canteen = Canteen()
            canteen.initWithJSON(json: dict)
            canteen.save()
        }
        
        
        self.filter()
        
    }
    
    
    
    @IBAction func filter() {
        // first according to searching
        let searchString = "chicken2"
        let linesss = DB.shared.realm.objects(Line.self).first
        print(linesss)
        let r = linesss?.meals.filter("name = %@", searchString)
        
        print(r?.description)
        
        // get from lines Array
        
        let results = DB.shared.realm.objects(Line.self).filter("ANY meals.name contains 'chicken2'").toArray(ofType: Line.self)
        print(results)
        for result in results {
            for r in result.meals.filter("vegan = false") {
                print(r.description)
            }
        }
        print(results.description)
        
        
        
        
        
       // let meals = DB.shared.realm.objects(Meal.self).filter("vegan = true AND ANY lines.canteens.name = %@").toArray(ofType: Meal.self)
        //let lines = DB.shared.realm.objects(Line.self).filter("name = %@ AND ANY meals.vegan = false",searchString)
       //  let lines = DB.shared.realm.objects(Line.self).sorted(byKeyPath: li, ascending: <#T##Bool#>)
     //   print(lines)
//      let selectedCanteenType = "canteen1"
//        let canteens = DB.shared.realm.objects(Canteen.self).filter("name = %@ AND ANY lines.meals.vegan = true",selectedCanteenType)
//        print(canteens.description)
//        for canteen in canteens {
//            for line in canteen.lines.filter("ANY meals.vegan = true") {
//                print(line.description)
//                for meal in line.meals.filter("vegan = true") {
//                    print(meal.description)
//                }
//            }
//        }
//
        
        
 
      //  let liness = DB.shared.realm.objects(Line.self).filter("ANY meals.name contains 'chicken2'").sorted(byKeyPath: "vegan", ascending: true)
      
       // print(lines.description)
        
     
   //    let lineonlyfalse = linesss.filter("ANY meals.vegan contains 'false'")
      //   print(lineonlyfalse.description)
        
     
      //  let currencyArray = results.sorted(byKeyPath: "name==chiken2").toArray(ofType: Line.self)
//print(currencyArray)/
        
           let resultss = DB.shared.realm.objects(Line.self).filter("ANY meals.name contains 'chicken2' AND ANY meals.vegan contains 'false'").toArray(ofType: Line.self)
        print(resultss)
        
    }
 
 
        
}

