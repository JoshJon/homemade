//
//  ShoppingListViewController.swift
//  Homemade V2
//
//  Created by Joshua Jon on 30/8/17.
//  Copyright © 2017 JoshuaJon. All rights reserved.
//

import UIKit
    var shoppingList = model.allShoppingList


class ShoppingListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidAppear(_ animated: Bool) {
         self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // set the section header height
        self.tableView.estimatedSectionHeaderHeight = 10
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return (shoppingList.getShoppingList()!.count)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sections = shoppingList.getShoppingList()![section].ingredients!.count
        return sections
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerCell = tableView.dequeueReusableCell(withIdentifier: "sectionHeaderCell") as! ShoppingListSectionTableViewCell
        headerCell.sectionLabel.text = shoppingList.getShoppingList()?[section].name
        headerCell.shoppingListDeleteButton.tag = section
        return headerCell
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "shoppingIngredientCell", for: indexPath) as! ShoppingListTableViewCell
        cell.shoppingIngredientLabel.text = shoppingList.getShoppingList()![indexPath.section].ingredients?[indexPath.row]
        return cell
    }
    
    @IBAction func shoppingListDeleteButton(_ sender: UIButton) {
        shoppingList.deleteFromShoppingList(removedItem: shoppingList.getShoppingList()![sender.tag])
        self.tableView.reloadData()
    }
    

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
