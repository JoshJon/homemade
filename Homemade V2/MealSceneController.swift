//
//  MealSceneController.swift
//  Homemade V2
//
//  Created by Jackson Lloyd on 22/8/17.
//  Copyright © 2017 JoshuaJon. All rights reserved.
//

import Foundation
import UIKit

class MealSceneController: UIViewController{
    @IBOutlet weak var Placeholder: UIView!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var mealImage: UIImageView!
    
    var recip:Recipe!
    var swiped = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        mealImage.loadImageUsingUrlString(urlString: recip.image!)

        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction(swipe:)))
        swipeUp.direction = UISwipeGestureRecognizerDirection.up
        
        self.view.addGestureRecognizer(swipeUp)
        self.navigationItem.hidesBackButton = true
        let backButton = UIBarButtonItem(image: UIImage(named: "backButton"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(MealSceneController.back(sender:)))
        self.navigationItem.leftBarButtonItem = backButton
        self.automaticallyAdjustsScrollViewInsets = true
    }
    override func prepare(for segue:UIStoryboardSegue, sender: Any?){
        if let destination = segue.destination as? RecipeViewController {
            destination.recip = recip
        }
    }
    
    func back(sender: UIBarButtonItem){
        self.navigationController?.popViewController(animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension UIViewController
{
    func swipeAction(swipe:UISwipeGestureRecognizer)
    {
        if let swipeGesture = swipe as? UISwipeGestureRecognizer {
            switch swipeGesture.direction
            {
            case UISwipeGestureRecognizerDirection.up:
                performSegue(withIdentifier: "swipeUp", sender: self)
            default:
                break
            }
        }
    }
}
