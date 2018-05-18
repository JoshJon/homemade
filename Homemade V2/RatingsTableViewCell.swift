//
//  RatingsTableViewCell.swift
//  Homemade V2
//
//  Created by Joshua Jon on 5/10/17.
//  Copyright © 2017 JoshuaJon. All rights reserved.
//

import UIKit

class RatingsTableViewCell: UITableViewCell {
   
    @IBOutlet var ratingImage: UIImageView!
    @IBOutlet var floatRatingView: FloatRatingView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
