//
//  RecipeTableViewCell.swift
//  Homemade V2
//
//  Created by Joshua Jon on 23/8/17.
//  Copyright © 2017 JoshuaJon. All rights reserved.
//

import UIKit

class RecipeTableViewCell: UITableViewCell {
    @IBOutlet weak var ingredientLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
