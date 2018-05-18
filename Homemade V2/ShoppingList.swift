//
//  ShoppingList.swift
//  Homemade V2
//
//  Created by Jackson Lloyd on 21/8/17.
//  Copyright © 2017 JoshuaJon. All rights reserved.
//

import Foundation

class ShoppingList{
    var recipeID:String
    var name:String
    var ingredients:[String]?
    
    init(recipeID:String, name:String, ingredients:[String]?){
		self.recipeID = recipeID
        self.name = name
        self.ingredients = ingredients
    }
    
    init?(recipeID:String, name:String, ingredients:[String]){
		if name.isEmpty || recipeID.isEmpty{
            return nil
        }
		
		self.recipeID = recipeID
        self.name = name
        self.ingredients = ingredients
    }
}
