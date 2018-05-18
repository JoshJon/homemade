//
//  Review.swift
//  Homemade V2
//
//  Created by Joshua Jon on 5/10/17.
//  Copyright © 2017 JoshuaJon. All rights reserved.
//

import UIKit
import Foundation

class Rating{
    var image:UIImage?
    var rating:Double?
    
    init(image:UIImage?, rating:Double?) {
        self.image = image
        self.rating = rating
    }
    
    init?(image:UIImage, rating:Double, description:String?){
        self.image = image
        self.rating = rating
    }
}
