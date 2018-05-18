//
//  TimeTableController.swift
//  Homemade V2
//
//  Created by Jackson Lloyd on 3/9/17.
//  Copyright © 2017 JoshuaJon. All rights reserved.
//

import Foundation
import UIKit

class TimeTableController: UIViewController, UITableViewDataSource, UITableViewDelegate {
	// Property referencing the label in the view
	@IBOutlet weak var tableView: UITableView!
	@IBOutlet weak var lblAnswers: UILabel!
	@IBOutlet weak var imgCard: UIImageView!
	@IBOutlet weak var placeHolder: UIView!
	var tblIndex = 0
	var time = 0
	var reps:[Recipe]! = []
	
	
	public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
		reps = timing(time: time)
		
		return reps?.count ?? 0
	}
	
	// returns cell in tableView of recipes
	public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
		
		let cell = tableView.dequeueReusableCell(withIdentifier: "timeCell", for: indexPath) as! TimeCell
		
		//assign label and image
		cell.mealLabel.text = reps[indexPath.row].name
		
		let url = reps?[indexPath.row].image!
		cell.mealImage.loadImageUsingUrlString(urlString: url!)
		
		//puts image to the back
		cell.mealImage.layer.zPosition = -5;
		
		return(cell)
	}
	
	// segue to MealSceneController for table row
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tblIndex = indexPath.row
		performSegue(withIdentifier: "timeToMealSegue", sender: self)
	}
	override func prepare(for segue:UIStoryboardSegue, sender: Any?){
		if let destination = segue.destination as? MealSceneController {
			destination.recip = reps[tblIndex]
		}
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		self.navigationItem.hidesBackButton = true
		let backButton = UIBarButtonItem(image: UIImage(named: "backButton"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(TimeTableController.back(sender:)))
		self.navigationItem.leftBarButtonItem = backButton
		self.automaticallyAdjustsScrollViewInsets = true
	}
	func back(sender: UIBarButtonItem){
		self.navigationController?.popViewController(animated: true)
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	func timing(time:Int) -> [Recipe]!
	{
		var tempRecipeArray:[Recipe]? = []
		
		for item in recipes! {
			if item.timeTotal! <= 2700 && time == 1 {
				tempRecipeArray!.append(item)
			}
			else if item.timeTotal! > 2700 && item.timeTotal! <= 5400 && time == 2 {
				tempRecipeArray!.append(item)
			}
			else if item.timeTotal! > 5400 && time == 3 {
				tempRecipeArray!.append(item)
			}
		}
		return tempRecipeArray!
	}
}

