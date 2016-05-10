//
//  TimeLineTableViewController.swift
//  Project20
//
//  Created by 西邮帅哥 on 16/4/25.
//  Copyright © 2016年 xiyoushuaige. All rights reserved.
//

import UIKit
import CoreData

class TimeLineTableViewController: UITableViewController, NewEntryViewControllerDelegate {
    @IBOutlet weak var dateLabel: UILabel!
    var dataArray = [TimeLine]()

    
    func fetchData() {
        let moc = AppDelegate().managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "TimeLine")
        do {
            dataArray = try moc.executeFetchRequest(fetchRequest) as! [TimeLine]
            dataArray.sortInPlace{$0.date > $1.date}
        } catch {
            fatalError("Failed to fetch: \(error)")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        dateLabel.text = NSDateFormatter.localizedStringFromDate(NSDate(), dateStyle: .LongStyle, timeStyle: .NoStyle)
        fetchData()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataArray.count
    }
    
    func addTimeLine(timeline: TimeLine) {
        let indexPath = NSIndexPath(forRow: 0, inSection: 0)
        dataArray.insert(timeline, atIndex: 0)
        tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as! ContentTableViewCell

        // Configure the cell...
        if !dataArray.isEmpty {
            let data = dataArray[indexPath.row]
            cell.dateLabel.text = data.date
            cell.photoImageView.image = UIImage(data: data.image!)
            cell.entryTextView.text = data.text
            cell.addressLabel.text = data.address
        }

        return cell
    }
    

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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let nevc = segue.destinationViewController as! NewEntryViewController
        nevc.delegate = self
    }
    

}
