//
//  Food.swift
//  Filter_TableView-iOS
//
//  Created by Med Salmen Saadi on 6/9/18.
//  Copyright © 2018 Med Salmen Saadi. All rights reserved.
//

import Foundation

enum FoodType: String {
    case Fruit = "Fruit"
    case Vegetable = "Vegetable"
}

class Food {
    
    var Name:String?
    var Calories:Int?
    var Image:String?
    var TypeF:FoodType?
    
    init(Name:String, Calories:Int, Image:String, Type:FoodType) {
        self.Name=Name
        self.Calories=Calories
        self.Image=Image
        self.TypeF=Type
    }
    
}
