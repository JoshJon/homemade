//
//  Reviews.swift
//  Homemade V2
//
//  Created by Joshua Jon on 5/10/17.
//  Copyright © 2017 JoshuaJon. All rights reserved.
//

import Foundation

struct AllRatings {
    var ratings:[Rating] = []
    
    init() {
        ratings = getRatings()!
    }
    
    func getRatings() -> [Rating]? {
        return ratings
    }
    
    // adds new item to reviews
    mutating func addRating(rating:Rating) {

        ratings.append(rating)
    }
}
