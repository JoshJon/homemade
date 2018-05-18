//
//  ShoppingListTableViewCell.swift
//  Homemade V2
//
//  Created by Joshua Jon on 30/8/17.
//  Copyright © 2017 JoshuaJon. All rights reserved.
//

import UIKit

class ShoppingListTableViewCell: UITableViewCell {
  
    @IBOutlet weak var shoppingIngredientLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
