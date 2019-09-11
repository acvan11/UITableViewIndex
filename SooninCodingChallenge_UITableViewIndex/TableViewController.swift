//
//  TableViewController.swift
//  SooninCodingChallenge_UITableViewIndex
//
//  Created by Sky on 9/10/19.
//  Copyright © 2019 Sky. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var carDictionary = [String: [String]]()
    var carSectionTitles = [String]()
    var cars: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        cars = ["Audi", "Aston Martin", "BMW", "Bugatti", "Bentley", "Chevrolet",
            "Cadillac", "Dodge", "Ferrari", "Ford", "Honda", "Jaguar", "Lamborghini",
            "Mercedes", "Mazda", "Nissan", "Porsche", "Toyota", "Volkswagen"]
        
        for car in cars {
            let carKey = String(car.prefix(1))
            if var carValues = carDictionary[carKey] {
                carValues.append(car)
                carDictionary[carKey] = carValues
            } else {
                carDictionary[carKey] = [car]
            }
        }
        print(carSectionTitles)
        print("================")
        print(carDictionary)
        carSectionTitles = [String](carDictionary.keys)
        carSectionTitles = carSectionTitles.sorted(by: {$0 < $1})
        print("===================")
        print(carSectionTitles)
        print("================")
        print(carDictionary)
        
    }

    // MARK: - Table view data source

    // return all sections. Otherwise it only returns the first section
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return carSectionTitles.count
    }

    // return number of element in each section
    // return all elements in each section. Otherwise, it return no elements
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let carKey = carSectionTitles[section]
        if let carValues = carDictionary[carKey] {
            return carValues.count
        }
        return 0
    }

        // it is a must because we explain how the cell displays text
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let carKey = carSectionTitles[indexPath.section]
        if let carValues = carDictionary[carKey] {
            cell.textLabel?.text = carValues[indexPath.row]
        }
        return cell
    }
    
    // display section title
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return carSectionTitles[section]
    }
    
    // display the sextion index titles in the right side
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return carSectionTitles
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
