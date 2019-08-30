//
//  FoodTableViewController.swift
//  MealTracker
//
//  Created by doris on 29/08/2019.
//  Copyright © 2019 grace. All rights reserved.
//

import UIKit

class FoodTableViewController: UITableViewController {
    private let cellId = "foodCell"
    
    var meals: [Meal] = [
        Meal(name: "breacfast", food: [Food(name: "Kimchi Soup", description: "")]),
        Meal(name: "lunch", food: [Food(name: "Kimchi Soup", description: "")]),
        Meal(name: "dinner", food: [Food(name: "Kimchi Soup", description: "")])
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return meals.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if section == 0 {
//            return meals.count
//        } else {
//            return 0
//        }
        return meals[section].food.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        // Reusable: 재 사용할 수 있는
        let meal = meals[indexPath.section]
        cell.textLabel?.text = meal.name
        cell.detailTextLabel?.text = meal.food.description
        cell.showsReorderControl = true
        
        return cell
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return meals[section].name
    }

    

}
