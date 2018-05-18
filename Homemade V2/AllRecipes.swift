//
//  AllRecipes.swift
//  Homemade V2
//
//  Created by Jackson Lloyd on 21/8/17.
//  Copyright © 2017 JoshuaJon. All rights reserved.
//

import Foundation

struct AllRecipes{
    // Stored properties
    var recipes:[Recipe]
    var shortTime:[Recipe] = []
    var mediumTime:[Recipe] = []
    var longTime:[Recipe] = []
    
    
    
    init()
    {
        //dummy data
        let item1 = Recipe(id:"m01", name:"PearsonDelight",
                                image:"PearsonDelight",
                                ingredients:["10g flour", "2 eggs", "250ml milk", "1 cup of water", "500g of bacon (preferably rindless bacon)", "2 eggs", "250ml milk", "1 cup of water", "500g of bacon (preferably rindless bacon)"],
                                timeTotal:10,
                                rating:2,
                                sourceURL:"http://iowagirleats.com/2016/04/25/bacon-and-goat-cheese-stuffed-sweet-pepper-poppers/")
        let item2 = Recipe(id:"m02", name:"AppleCrunch",
                                image:"AppleCrunch",
                                ingredients:["1 tablespoon of sriracha", "2 limes, zested and juices", "2 bunches of broccolini, ends trimmed", "4 salmon fillets"],
                                timeTotal:55,
                                rating:4,
                                sourceURL:"https://www.thepaleomom.com/shrimp-pad-thai/")
        let item3 = Recipe(id:"m03", name:"GloryBights",
                                image:"GloryBights",
                                ingredients:["200g dried rice noodles", "1 tablespoon of peanut oil", "500g of turkey mince"],
                                timeTotal:90,
                                rating:5,
                                sourceURL:"http://www.joyfulhealthyeats.com/bbq-chicken-zucchini-boats/")
        let item4 = Recipe(id:"m04", name:"LoydSpecial",
                                image:"LoydSpecial",
                                ingredients:["10g flour", "2 eggs", "250ml milk", "1 cup of water", "500g of bacon (preferably rindless bacon)", "2 eggs", "250ml milk", "1 cup of water", "500g of bacon (preferably rindless bacon)"],
                                timeTotal:10,
                                rating:2,
                                sourceURL:"http://iowagirleats.com/2016/04/25/bacon-and-goat-cheese-stuffed-sweet-pepper-poppers/")
        let item5 = Recipe(id:"m05", name:"ScatmanChicken",
                                image:"ScatmanChicken",
                                ingredients:["1 tablespoon of sriracha", "2 limes, zested and juices", "2 bunches of broccolini, ends trimmed", "4 salmon fillets"],
                                timeTotal:55,
                                rating:4,
                                sourceURL:"https://www.thepaleomom.com/shrimp-pad-thai/")
        let item6 = Recipe(id:"m06", name:"FestiveNuts",
                                image:"FestiveNuts",
                                ingredients:["200g dried rice noodles", "1 tablespoon of peanut oil", "500g of turkey mince"],
                                timeTotal:90,
                                rating:5,
                                sourceURL:"http://www.joyfulhealthyeats.com/bbq-chicken-zucchini-boats/")
        let item7 = Recipe(id:"m07", name:"SweetLemonde",
                                image:"SweetLemonde",
                                ingredients:["10g flour", "2 eggs", "250ml milk", "1 cup of water", "500g of bacon (preferably rindless bacon)", "2 eggs", "250ml milk", "1 cup of water", "500g of bacon (preferably rindless bacon)"],
                                timeTotal:200,
                                rating:2,
                                sourceURL:"http://iowagirleats.com/2016/04/25/bacon-and-goat-cheese-stuffed-sweet-pepper-poppers/")
        func recipePop() -> [Recipe] {
            return [item1!, item2!, item3!, item4!, item5!, item6!, item7!]
        }
        //
        
        // Create an array populate with one of each recipe
        recipes = recipePop()
        shortTime = shortTiming()
        mediumTime = medTiming()
        longTime = longTiming()
    }
    
    
    mutating func getRecipes() -> [Recipe]
    {
        //recipes = recipePop()
        return recipes
    }
    mutating func shortTiming() -> [Recipe]
    {
        for item in recipes {
            if item.timeTotal! <= 45 {
                shortTime.append(item)
            }
        }
        return shortTime
    }
    mutating func medTiming() -> [Recipe]
    {
        for item in recipes {
            if item.timeTotal! > 45 && item.timeTotal! <= 90 {
                mediumTime.append(item)
            }
        }
        return mediumTime
    }
    mutating func longTiming() -> [Recipe]
    {
        for item in recipes {
            if item.timeTotal! > 90 {
                longTime.append(item)
            }
        }
        return longTime
    }
}
