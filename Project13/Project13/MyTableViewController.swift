//
//  MyTableViewController.swift
//  Project13
//
//  Created by 西邮帅哥 on 16/4/14.
//  Copyright © 2016年 xiyoushuaige. All rights reserved.
//

import UIKit

class MyTableViewController: UITableViewController {
    
    let dicData: NSDictionary = ["A": ["Amy", "Angela", "Alice", "Alex", "Anne"], "B": ["Betty", "Brian", "Barbara", "Bonnie", "Bob"], "C": ["Crystal", "Charles", "Candy", "Chris", "Cindy"], "D": ["David", "Daniel", "Diego", "Danny", "Diana"], "E": ["Elizabeth", "Emily", "Eva", "Eric", "Edward"], "F": ["Frank", "Fiona", "Fernando", "Francis", "Francisco"], "G": ["George", "Grace", "Gary", "Gina", "Gloria"]]
    
    var sectionNameArray = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Names"
        sectionNameArray = dicData.allKeys as! [String]
        sectionNameArray = sectionNameArray.sort(<)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getSectionDataArray(section: Int) -> [String] {
        let selectedSection = sectionNameArray[section]
        let sectionDataArray = dicData[selectedSection] as! [String]
        return sectionDataArray
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return sectionNameArray.count
        
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
//        let selectedSection = sectionNameArray[section]
//        let sectionDataArray = dicData[selectedSection] as! [String]
//        return sectionDataArray.count
        return getSectionDataArray(section).count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...
//        let selectedSection = sectionNameArray[indexPath.section]
//        let sectionDataArray = dicData[selectedSection] as! [String]
        cell.textLabel!.text = getSectionDataArray(indexPath.section)[indexPath.row]

        return cell
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionNameArray[section]
        
    }
    
//    override func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
//        return sectionNameArray
//    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
