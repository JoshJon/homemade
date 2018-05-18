//
//  AllShoppingList.swift
//  Homemade V2
//
//  Created by Jackson Lloyd on 23/8/17.
//  Copyright © 2017 JoshuaJon. All rights reserved.
//

import Foundation


struct AllShoppingList{
    // Stored properties
    var shopList:[ShoppingList]?
    
    //dummy data
	let item1 = ShoppingList(recipeID: "r01", name:"Greek Pasta", ingredients:["flour","eggs","milk"])
    
    let item2 = ShoppingList(recipeID: "r02", name:"Ultimate Bacon Burger", ingredients:["cheese","lettuce","almonds", "30g butter"])
    
    let item3 = ShoppingList(recipeID: "r03", name:"Sweet Cake", ingredients:["potato","chicken","rice", "loaf of bread"])
    
    let item4 = ShoppingList(recipeID: "r04", name:"Custard Donut", ingredients:["flour","eggs","milk", "5 tablespoons canola oil"])
    
    let item5 = ShoppingList(recipeID: "r05", name:"Italian Meatballs", ingredients:["cheese","1/4 cup rice wine or white wine", "lettuce","almonds"])
    
    let item6 = ShoppingList(recipeID: "r06", name:"Gyros Platter", ingredients:["1 red onion, peeled and thinly sliced (about 2 cups)", "potato","chicken","rice"])
    
    init()
    {
        // Create an array populate with one of each recipe
        shopList = getList()
    }
    
    mutating func getShoppingList() ->[ShoppingList]?
    {
        return shopList
    }
    mutating func getList() ->[ShoppingList]?
    {
        return [item1!, item2!, item3!, item4!, item5!, item6!]
    }
    
    //doing loops by name will result in bugs, think about using recipe id?
    mutating func addToShoppingList(newItem:ShoppingList) -> Bool
    {
        for (_, item) in shopList!.enumerated()
        {
            if item.name == newItem.name{
                return false
            }
        }
        
        shopList?.append(newItem)
        return true
    }
    mutating func deleteFromShoppingList(removedItem:ShoppingList) -> Bool
    {
        for (index, item) in shopList!.enumerated()
        {
            if item.name == removedItem.name{
                shopList?.remove(at: index)
                return true
            }
        }
        return false
    }
}
