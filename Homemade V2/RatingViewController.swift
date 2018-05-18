//
//  ReviewViewController.swift
//  Homemade V2
//
//  Created by Jackson Lloyd on 3/9/17.
//  Copyright © 2017 JoshuaJon. All rights reserved.
//

import Foundation
import UIKit


class RatingViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
	var recip:Recipe!
	
//    @IBOutlet weak var lblAnswers: UILabel!
//    @IBOutlet weak var imgCard: UIImageView!
//    @IBOutlet weak var placeHolder: UIView!
    @IBOutlet var tableView: UITableView!
    @IBOutlet weak var recpLbl: UILabel!
	@IBOutlet weak var recpImg: UIImageView!
	
    override func viewDidAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        tableView.dataSource = self
		
		recpLbl.text = String(self.recip.name)
		//image to url and loads the url in Extensions
		let url = self.recip.image!
		recpImg.loadImageUsingUrlString(urlString: url)
		
		self.navigationItem.hidesBackButton = true
		let backButton = UIBarButtonItem(image: UIImage(named: "backButton"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(RecipeViewController.back(sender:)))
		self.navigationItem.leftBarButtonItem = backButton
		self.automaticallyAdjustsScrollViewInsets = true
		
		self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
		self.navigationController?.navigationBar.shadowImage = UIImage()
		self.navigationController?.navigationBar.isTranslucent = true
        self.tableView.estimatedSectionHeaderHeight = 5
    }

    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return (self.recip.getRatings()?.count)!
    }
    
    /* broken code....
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableCell(withIdentifier: "ratingsHeaderCell") as! RatingsHeaderTableViewCell
        return header
    }
 */
    
    // returns cell in tableView of recipes
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ratingsCell", for: indexPath) as! RatingsTableViewCell
        cell.ratingImage.image = recip.userRatings[indexPath.row].image
        cell.floatRatingView.rating = (recip.userRatings[indexPath.row].rating)!
        cell.floatRatingView.editable = false
        return cell
        
    }
    
    // segue to MealSceneController for table row
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableIndex = indexPath.row
        performSegue(withIdentifier: "detailedReview", sender: self)
    }

    
    
    override func prepare(for segue:UIStoryboardSegue, sender: Any?){
        if let destination = segue.destination as? RatingSubmissionViewController {
            destination.recip = recip
        }
    }
    
    @IBAction func SubmitReviewBtn(_ sender: Any) {
        performSegue(withIdentifier: "submitReview", sender: self)
    }
    
    func back(sender: UIBarButtonItem){
        self.navigationController?.popViewController(animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
