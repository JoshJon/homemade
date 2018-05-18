//
//  Recipes.swift
//  Homemade V2
//
//  Created by Jackson Lloyd on 21/8/17.
//  Copyright © 2017 JoshuaJon. All rights reserved.
//

import UIKit
import Foundation

class Recipe{
    var id:String
    var name:String
    var image:String?
    var ingredients:[String]?
    var timeTotal:Int?
    var rating:Double?
    var sourceURL:String?
    var userRatings:[Rating] = []
    
    init(id:String, name:String, image:String?, ingredients:[String]?, timeTotal:Int, rating:Double, sourceURL:String){
        self.id = id
        self.name = name
        self.image = image
        self.ingredients = ingredients
        self.timeTotal = timeTotal
        self.rating = rating
        self.sourceURL = sourceURL
    }
    
    init?(id:String, name:String, image:String, ingredients:[String], timeTotal:Int, rating:Double, sourceURL:String){
		if id.isEmpty || name.isEmpty {
            return nil
        }
        
        self.id = id
        self.name = name
        self.image = image
        self.ingredients = ingredients
        self.timeTotal = timeTotal
        self.rating = rating
        self.sourceURL = sourceURL
    }
    
    func getRatings() -> [Rating]? {
        return userRatings
    }
}
