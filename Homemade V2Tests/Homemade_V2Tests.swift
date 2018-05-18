//
//  Homemade_V2Tests.swift
//  Homemade V2Tests
//
//  Created by Joshua Jon on 14/8/17.
//  Copyright © 2017 JoshuaJon. All rights reserved.
//

import XCTest
@testable import Homemade_V2

class Homemade_V2Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
	
	func testRecipe()
	{
		let recipe = Recipe(id:"01", name:"Cheese Burger", image:"", ingredients:[], timeTotal:0, rating:Double(0), sourceURL:"")
		
		//Test Initalisers of Recipe
		func testIdInitialiser(recipe: Recipe) {
			XCTAssertEqual(recipe.id, "01")
		}
		func testNameInitialiser(recipe: Recipe) {
			XCTAssertEqual(recipe.name, "Cheese Burger")
		}
		
		func imageNil(recipe: Recipe) {
			//check image is nil
			XCTAssertNotNil(recipe.image)
			
			//check image is nil
			recipe.image = nil
			XCTAssertNil(recipe.image)
		}
		
		func ingredients(recipe: Recipe) {
			recipe.ingredients = nil
			XCTAssertNil(recipe.ingredients)
			
			let ingredient:String = "1/2 a cup of flour"
			recipe.ingredients!.append(ingredient)
			XCTAssertEqual(recipe.ingredients!, ["1/2 a cup of flour"])
			let ingredient2:String = "egg white"
			recipe.ingredients!.append(ingredient2)
			XCTAssertEqual(recipe.ingredients!, ["1/2 a cup of flour", "egg white"])
			
			recipe.ingredients!.removeAll()
			XCTAssertNil(recipe.ingredients)
		}
	}
	
	func testFavourites()
	{
		var favourites:[Recipe]? = []
		let recipe = Recipe(id:"m01",
		                    name:"PearsonDelight",
		                    image:"PearsonDelight",
		                    ingredients:["10g flour", "2 eggs", "250ml milk", "1 cup of water", "500g of bacon (preferably rindless bacon)", "2 eggs", "250ml milk", "1 cup of water", "500g of bacon (preferably rindless bacon)"],
		                    timeTotal:10,
		                    rating:2,
		                    sourceURL:"http://iowagirleats.com/2016/04/25/bacon-and-goat-cheese-stuffed-sweet-pepper-poppers/")
		let recipe2 = Recipe(id:"m02",
		                    name:"Caketastic",
		                    image:"LloydSpecial",
		                    ingredients:["2 eggs", "250ml milk", "1 cup of water", "3 cups of flour"],
		                    timeTotal:600,
		                    rating:4,
		                    sourceURL:"http://www.google.com")
		
		favourites?.append(recipe!)
		XCTAssertNotNil(favourites!)
		XCTAssertEqual((favourites?[0].id)!, "m01")
		favourites?.append(recipe2!)
		XCTAssertEqual((favourites?[1].id)!, "m02")
	}
	
	func testRating()
	{
		var rating: Rating? = nil
		let image = UIImage(named:"ImageName")
		
		XCTAssertNil(rating)
		XCTAssertNil(rating?.image)
		
		rating = Rating(image: image, rating: 1.1)
		XCTAssertNotNil(rating)
		XCTAssertNotNil(rating?.rating)
		XCTAssertEqual(rating?.image, image)
	}
	
	func testShoppingList()
	{
		let recipe = Recipe(id:"m01",
		                    name:"PearsonDelight",
		                    image:"PearsonDelight",
		                    ingredients:["10g flour", "2 eggs", "250ml milk", "1 cup of water", "500g of bacon (preferably rindless bacon)", "2 eggs", "250ml milk", "1 cup of water", "500g of bacon (preferably rindless bacon)"],
		                    timeTotal:10,
		                    rating:2,
		                    sourceURL:"http://iowagirleats.com/2016/04/25/bacon-and-goat-cheese-stuffed-sweet-pepper-poppers/")
		var shopList: ShoppingList? = nil
		XCTAssertNil(shopList)
		
		shopList = ShoppingList(recipeID: (recipe?.id)!, name: (recipe?.name)!, ingredients: recipe?.ingredients)
		XCTAssertNotNil(shopList)
		
		XCTAssertEqual(shopList?.recipeID, recipe?.id)
		XCTAssertEqual(shopList?.name, recipe?.name)
		XCTAssertEqual((shopList?.ingredients)!, (recipe?.ingredients)!)
	}
	
	func testExtensions()
	{
		let testStr = "Hello World, I'm just a string!"
		var resultingStr = testStr.replaceSpaceWithPlus(input: testStr)
		XCTAssertEqual(resultingStr, "Hello+World,+I'm+just+a+string!")
		
		var image:UIImageView!
		XCTAssertNil(image)
		
		let url = "https://lh3.googleusercontent.com/lw5KIRDeeqKm_AfnzvwWkYrlsb0p_cGMzt32UrMvZvqSd8pkZG_3HeHrFeN5Usnr4cw4fJCRfgv9E5WhSt6n4U0=s360"
		image.loadImageUsingUrlString(urlString: url)
		XCTAssertNotNil(image)
		XCTAssertNotNil(image.image)
	}
}
