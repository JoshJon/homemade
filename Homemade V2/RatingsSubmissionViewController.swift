//
//  ReviewSubmissionViewController.swift
//  Homemade V2
//
//  Created by Joshua Jon on 3/10/17.
//  Copyright © 2017 JoshuaJon. All rights reserved.
//

import UIKit

class RatingSubmissionViewController: UIViewController {

    @IBOutlet var ratingView: FloatRatingView!
    @IBOutlet var submissionImage: UIImageView!
    @IBOutlet var descriptionTextField: UITextView!
    
    var takenPhoto:UIImage?
    var recip:Recipe?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //rating view
        ratingView.delegate = self
        ratingView.backgroundColor = UIColor.clear
        ratingView.contentMode = UIViewContentMode.scaleAspectFit
        ratingView.type = .wholeRatings
        
        // set imageview to takenPhoto
        if takenPhoto != nil {
            submissionImage.image = takenPhoto
        } else {
            submissionImage.image = #imageLiteral(resourceName: "defaultCamera")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func submitReview(_ sender: Any) {
        if takenPhoto == nil {
            takenPhoto = #imageLiteral(resourceName: "defaultCamera")
        }
       let newRating = Rating(image: takenPhoto, rating: ratingView.rating)
        
        recip?.userRatings.append(newRating)
        
        let ratingsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RatingsVC") as! RatingViewController
        
        print(recip?.rating ?? 1)
        
        ratingsVC.recip = recip
        print(ratingsVC.recip?.rating ?? 00)
        
        
        DispatchQueue.main.async {
            self.present(ratingsVC, animated: true, completion: nil)
        }

        
    }
}

extension RatingSubmissionViewController: FloatRatingViewDelegate {
    
    // MARK: FloatRatingViewDelegate
    /*
    func ratingView(_ ratingView: FloatRatingView, isUpdating rating: Double) {
        ratingLabel.text = String(format: "%.2f", self.ratingView.rating)
    }

    func floatRatingView(_ ratingView: FloatRatingView, didUpdate rating: Double) {
        updatedLabel.text = String(format: "%.2f", self.ratingView.rating)
    }
 */
    
}
