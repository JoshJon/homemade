//
//  RecipeViewController.swift
//  Homemade V2
//
//  Created by Joshua Jon on 22/8/17.
//  Copyright © 2017 JoshuaJon. All rights reserved.
//

import UIKit
import SafariServices

class RecipeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var recip:Recipe!
	var favourites:[Recipe]? = []
	var isFave:Bool = false
	
    //properties
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var totalTimeLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    // retunrs number of rows to display in table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return (recip.ingredients!.count+1)
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		favourites = model.popuateFavourites()
	}
	
	@IBAction func faveBtn(_ sender: Any) {
		for item in favourites! {
			if recip.id == item.id {
				isFave = true
			}
		}
		
		if isFave {
			model.removeFavourite(favourite: recip)
		} else {
			model.saveFavourites(favourite: recip)
			favourites?.append(recip)
		}
	}
    
    // returns cell in tableView of ingredients to be displayed
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        if (indexPath.item == recip.ingredients!.count) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "shoppingListCell", for: indexPath) as! RecipeShoppingButtonTableViewCell
            return cell

        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ingredientCell", for: indexPath) as! RecipeTableViewCell
            cell.ingredientLabel.text = recip.ingredients?[indexPath.row]
            return cell

        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = recip.name
        totalTimeLabel.text = "Total time: \(recip.timeTotal! / 60) mins"
		recipeImage.loadImageUsingUrlString(urlString: recip.image!)

        tableView.backgroundView = nil;
        // reloads table data
        func viewDidAppear(animated: Bool) {
            super.viewDidAppear(animated)
            tableView.reloadData()
        }
        self.navigationItem.hidesBackButton = true
        let backButton = UIBarButtonItem(image: UIImage(named: "backButton"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(RecipeViewController.back(sender:)))
        self.navigationItem.leftBarButtonItem = backButton
        self.automaticallyAdjustsScrollViewInsets = true
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
    }
    
    func back(sender: UIBarButtonItem){
        self.navigationController?.popViewController(animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Ratings(_ sender: Any) {
        performSegue(withIdentifier: "reviewSegue", sender: self)
    }
    
    override func prepare(for segue:UIStoryboardSegue, sender: Any?){
        if let destination = segue.destination as? RatingViewController {
            destination.recip = recip
        }
    }
    
    // add recipe ingredients to shopping list
    @IBAction func addToShoppingListButton(_ sender: Any) {
		let newItem = ShoppingList(recipeID: recip.id, name: recip.name, ingredients: recip.ingredients)
        shoppingList.addToShoppingList(newItem: newItem)
    }
    
    
    // view directions button (Action) - opens recipe sourceURL in Safari
    @IBAction func directionsButton(_ sender: Any) {
        let svc = SFSafariViewController(url: URL(string: recip.sourceURL!)!)
        self.present(svc, animated: true, completion: nil)
    }
}
