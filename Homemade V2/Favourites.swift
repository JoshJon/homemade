//
//  Favourites.swift
//  Homemade V2
//
//  Created by Jackson Lloyd on 21/8/17.
//  Copyright © 2017 JoshuaJon. All rights reserved.
//

import Foundation

class Favourites {
    var favourites:[Recipe]?
    
    init?() {
        favourites = getFavourites()
    }
    
    func getFavourites() -> [Recipe]?
    {
        return favourites
    }
    
    /* adds new item to favourites,
        returns false if new recipe is already in favourites
        returns true if recipe is added into favourites correctly
     */
    func addFavourite(recipe:Recipe) -> Bool
    {
        //needs check for already added
        for (_, item) in favourites!.enumerated()
        {
            if item.id == recipe.id{
                return false
            }
        }
        
        favourites?.append(recipe)
        return true
    }
    
    /* removes item from favourites,
        returns false if favourite could not be removed
        returns true if favourite is removed from favourites correctly
     */
    func removeFavourite(recipe:Recipe) -> Bool
    {
        for (index, item) in favourites!.enumerated()
        {
            if item.id == recipe.id{
                favourites?.remove(at: index)
                return true
            }
        }
        return false
    }
}
