//
//  FavouritesViewController.swift
//  Homemade V2
//
//  Created by Jackson Lloyd on 1/9/17.
//  Copyright © 2017 JoshuaJon. All rights reserved.
//

import Foundation
import UIKit

//let favourites = model.allFavourites.favourites

class FavouritesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    // Property referencing the label in the view
    @IBOutlet weak var lblAnswers: UILabel!
    @IBOutlet weak var imgCard: UIImageView!
    @IBOutlet weak var placeHolder: UIView!
    @IBOutlet weak var tableView: UITableView!
	//variables
    var tblIndex = 0
	var favourites:[Recipe]? = nil
    
    //sets tableView's number of sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return favourites?.count ?? 0
    }
    
    //sets amount of favourite cells, if none save, returns 0
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return favourites?.count ?? 0
    }
	
	//sets tableView's headers
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerCell = tableView.dequeueReusableCell(withIdentifier: "favSectionHeader") as! FavouritesSectionHeaderTableViewCell
        
        if (section == 0) {
            headerCell.favSectionLabel.text = "No adfljdaf"
        }else if (section == 1) {
            headerCell.favSectionLabel.text = "Lunch Ideas"
        } else if (section == 2) {
            headerCell.favSectionLabel.text = "Dessert Insporation"
        } else{
            headerCell.favSectionLabel.text = "Family meals"
        }
        return headerCell
    }


    // returns cell in tableView of recipes
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "favouritesCell", for: indexPath) as! FavouritesCell
		
		//assign label and image
		cell.mealLabel.text = favourites?[indexPath.row].name
		
		//sets cell's image to url and loads the url in Extensions
		let url = favourites?[indexPath.row].image!
		cell.mealImage.loadImageUsingUrlString(urlString: url!)
        
        //puts image to the back
        cell.mealImage.layer.zPosition = -5;
		
        return(cell)
    }
    
    // segue to MealSceneController for table row
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tblIndex = indexPath.row
        performSegue(withIdentifier: "favouriteToMealSegue", sender: self)
    }
	// sets next scene's recipe on user's selection
    override func prepare(for segue:UIStoryboardSegue, sender: Any?){
        if let destination = segue.destination as? MealSceneController {
            destination.recip = favourites?[tblIndex]
        }
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		favourites = model.popuateFavourites()
		tableView.reloadData()
	}
    override func viewDidLoad() {
        super.viewDidLoad()
		
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.tableView.estimatedSectionHeaderHeight = 10
    }
	
	// setting up back button animation
    func back(){
        self.navigationController?.popViewController(animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
