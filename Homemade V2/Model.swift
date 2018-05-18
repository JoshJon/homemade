//
//  Model.swift
//  Homemade V2
//
//  Created by Jackson Lloyd on 21/8/17.
//  Copyright © 2017 JoshuaJon. All rights reserved.
//

import Foundation
import UIKit

class Model
{
    var allRecipes:AllRecipes
    var allShoppingList:AllShoppingList
    var allFavourites:Favourites
    var uuid:String
	
    var databasePath = NSString()
	
	// Create the database
	let filemgr = FileManager.default
	let dirPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
	
	
    /*instance of itself*/
    private struct Static
    {
        static var instance: Model?
    }
    
    /* This is a class variable allowing me to access it without first instantiating the model Now we can retrieve the model without instantiating it directly var model = Model.sharedInstance */
    class var sharedInstance: Model
    {
        if !(Static.instance != nil)
        {
            Static.instance = Model()
        }
        return Static.instance!
    }
    
    // Populate the model with a set of Recipes
    private init()
    {
        allRecipes = AllRecipes()
        allShoppingList = AllShoppingList()
        allFavourites = Favourites()!
        uuid = UUID().uuidString
		print(uuid)
    }
	
	func databaseSetup () {
		let docsDir = dirPaths[0]
		databasePath = (docsDir as NSString).appendingPathComponent("recipesdb.db") as NSString
		print(databasePath)
		
		if !filemgr.fileExists(atPath: databasePath as String)
		{
			// Get a reference to the database
			let recipesDB = FMDatabase(path: databasePath as String)
			
			if recipesDB == nil {
				print("Error: \(recipesDB?.lastErrorMessage())")
			}
			
			// Open the database
			if (recipesDB?.open())!
			{
				// Prepare a statement for operating on the database
				let review_create = "CREATE TABLE IF NOT EXISTS `reviews` (`reviewID` INTEGER PRIMARY KEY AUTOINCREMENT, `uuid` TEXT, `rating` NUMERIC, `comment` TEXT, `image` TEXT, `Timestamp` DATETIME DEFAULT CURRENT_TIMESTAMP )"
				
				let shoppingList_create = "CREATE TABLE IF NOT EXISTS `shoppingList` ( `uuid` TEXT, `recipeID` TEXT, `name` TEXT )"
				
				let shopIngredients_create = "CREATE TABLE IF NOT EXISTS `shopIngredients` ( `recipeID` TEXT, `ingredient` TEXT, `complete` INTEGER)"
				
				let favourites_create = "CREATE TABLE IF NOT EXISTS `favourites` ( `uuid` TEXT, `recipeID` TEXT, `name` TEXT, `image` TEXT, `timeTotal` INTEGER, `rating` NUMERIC, `sourceURL` TEXT, PRIMARY KEY(`uuid`) )"
				
				let faveIngredients_create = "CREATE TABLE IF NOT EXISTS `faveIngredients` ( `recipeID` TEXT, `ingredient` TEXT )"
				
				
				// Execute the statement
				if !(recipesDB?.executeStatements(review_create))! {
					print("Error: \(recipesDB?.lastErrorMessage())")
				}
				if !(recipesDB?.executeStatements(shoppingList_create))! {
					print("Error: \(recipesDB?.lastErrorMessage())")
				}
				if !(recipesDB?.executeStatements(shopIngredients_create))! {
					print("Error: \(recipesDB?.lastErrorMessage())")
				}
				if !(recipesDB?.executeStatements(favourites_create))! {
					print("Error: \(recipesDB?.lastErrorMessage())")
				}
				if !(recipesDB?.executeStatements(faveIngredients_create))! {
					print("Error: \(recipesDB?.lastErrorMessage())")
				}
				
				// Close the database
				recipesDB?.close()
			} else {
				print("Error: \(recipesDB?.lastErrorMessage())")
			}
		}
	}
	
	
	func removeFavourite(favourite: Recipe) {
		let docsDir = dirPaths[0]
		databasePath = (docsDir as NSString).appendingPathComponent("recipesdb.db") as NSString
		// Get a reference to the database
		let recipesDB = FMDatabase(path: databasePath as String)
		
		if (recipesDB?.open())!
		{
			let faveDelSQL = "DELETE FROM favourites WHERE recipeID = '\(favourite.id)'"
			if !(recipesDB?.executeStatements(faveDelSQL))! {
				print("Error: \(recipesDB?.lastErrorMessage())")
			}
			
			let faveIngDelSQL = "DELETE FROM faveIngredients WHERE recipeID = '\(favourite.id)'"
			if !(recipesDB?.executeStatements(faveIngDelSQL))! {
				print("Error: \(recipesDB?.lastErrorMessage())")
			}
			
			recipesDB?.close()
		} else {
			print("Error: \(recipesDB?.lastErrorMessage())")
		}
	}
	
	
	func saveFavourites(favourite: Recipe) {
		let docsDir = dirPaths[0]
		databasePath = (docsDir as NSString).appendingPathComponent("recipesdb.db") as NSString
		
		let recipesDB = FMDatabase(path: databasePath as String)
		
		if (recipesDB?.open())!
		{
			// Prepare a statement for operating on the database
			let insertSQL = "INSERT INTO favourites (uuid, recipeID, name, image, timeTotal, rating, sourceURL) VALUES ('\(uuid)', '\(favourite.id)', '\(favourite.name)', '\(favourite.image!)', '\(favourite.timeTotal!)', '\(favourite.rating!)', '\(favourite.sourceURL!)')"
			
			if favourite.ingredients != nil {
				for item in favourite.ingredients! {
					let insertIng = "INSERT INTO faveIngredients (recipeID, ingredient) VALUES ('\(favourite.id)', '\(item)')"
					let resultIng = recipesDB?.executeUpdate(insertIng, withArgumentsIn: nil)
					
					if !resultIng! {
						print("Insert error: \(recipesDB?.lastErrorMessage())")
					}
				}
			}
			
			// Execute the update statement
			let result = recipesDB?.executeUpdate(insertSQL, withArgumentsIn: nil)
			
			
			if !result! {
				print("Insert error: \(recipesDB?.lastErrorMessage())")
			}
		} else {
			print("Error: \(recipesDB?.lastErrorMessage())")
		}
		recipesDB?.close()
	}
	
	func popuateFavourites() -> [Recipe]? {
		let docsDir = dirPaths[0]
		databasePath = (docsDir as NSString).appendingPathComponent("recipesdb.db") as NSString
		
		var tempFavourites:[Recipe]? = []
		// Get a reference to the database
		let recipesDB = FMDatabase(path: databasePath as String)
	
		if (recipesDB?.open())!
		{
			// Prepare a statement for operating on the database
			let querySQL = "SELECT * FROM favourites"// WHERE uuid = '\(uuid)'"
	
			let results:FMResultSet? = recipesDB?.executeQuery(querySQL, withArgumentsIn: nil)
			
			if results == nil {
				return nil
			}
			while (results?.next())! {
				var recipe = Recipe(id:"m01",
				                    name:"PearsonDelight",
				                    image:"PearsonDelight",
				                    ingredients:["10g flour", "2 eggs", "250ml milk", "1 cup of water", "500g of bacon (preferably rindless bacon)", "2 eggs", "250ml milk", "1 cup of water", "500g of bacon (preferably rindless bacon)"],
				                    timeTotal:10,
				                    rating:2,
				                    sourceURL:"http://iowagirleats.com/2016/04/25/bacon-and-goat-cheese-stuffed-sweet-pepper-poppers/")
				
				recipe?.id = (results?.string(forColumn: "recipeID")!)!
				recipe?.name = (results?.string(forColumn: "name")!)!
				recipe?.image = (results?.string(forColumn: "image")!)!
				recipe?.ingredients = popuateFavouriteIngredients(recipeID: (recipe?.id)!)
				recipe?.timeTotal = Int((results?.int(forColumn: "timeTotal"))!)
				recipe?.rating = (results?.double(forColumn: "rating"))!
				recipe?.sourceURL = (results?.string(forColumn: "sourceURL")!)!
				tempFavourites!.append(recipe!)
			}
			recipesDB?.close()
		} else {
			print("Error: \(recipesDB?.lastErrorMessage())")
		}
		
		return tempFavourites!
	}
	
	func popuateFavouriteIngredients(recipeID:String) -> [String]? {
		let docsDir = dirPaths[0]
		databasePath = (docsDir as NSString).appendingPathComponent("recipesdb.db") as NSString
		// Get a reference to the database
		let recipesDB = FMDatabase(path: databasePath as String)
		var tempIngredients:[String]? = []
		var tempIng:String? = ""
		
		if (recipesDB?.open())!
		{
			// Prepare a statement for operating on the database
			let querySQL = "SELECT * FROM faveIngredients WHERE recipeID = '\(recipeID)'"
			
			let results:FMResultSet? = recipesDB?.executeQuery(querySQL, withArgumentsIn: nil)
			
			while (results?.next())! {
				tempIng? = (results?.string(forColumn: "ingredient")!)!
				if tempIng! != "" {
					tempIngredients?.append(tempIng!)
				}
			}
			recipesDB?.close()
		} else {
			print("Error: \(recipesDB?.lastErrorMessage())")
		}
		
		return tempIngredients!
	}
}
