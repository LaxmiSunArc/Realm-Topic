//
//  RealmClasses.swift
//  CoreDataa
//
//  Created by SunARcTech2 on 28/11/18.
//  Copyright © 2018 SunARcTech2. All rights reserved.
//

import Foundation
import RealmSwift




class Canteen: Object {
    @objc dynamic var name: String?
    let lines = List<Line>()
    
    func initWithJSON(json: [String: Any]) {
        self.name = json["name"] as? String
        
        let lines = json["lines"] as! [[String: Any]]
        for lineJSON in lines {
            let line = Line()
            line.initWithJSON(json: lineJSON)
            self.lines.append(line)
        }
        
    }
    
    override static func primaryKey() -> String? {
        return "name"
    }

    
}









class Line: Object {
    @objc dynamic var name: String?
    var meals = List<Meal>()
    let canteens = LinkingObjects(fromType: Canteen.self, property: "lines")
    
    func initWithJSON(json: [String: Any]) {
        self.name = json["name"] as? String
        
        let meals = json["meals"] as! [[String: Any]]
        for mealJSON in meals {
            let meal = Meal()
            meal.initWithJSON(json: mealJSON)
            self.meals.append(meal)
        }
    }
    
    override static func primaryKey() -> String? {
        return "name"
    }

    
}











class Meal: Object {
    @objc dynamic var name: String?
    @objc dynamic var vegan: Bool = false
    let lines = LinkingObjects(fromType: Line.self, property: "meals")
    
    
    func initWithJSON(json: [String: Any]) {
        self.name = json["name"] as? String
        self.vegan = json["isVegan"] as! Bool
    }
    
    override static func primaryKey() -> String? {
        return "name"
    }

    
}
