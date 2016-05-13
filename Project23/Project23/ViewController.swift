//
//  ViewController.swift
//  Project23
//
//  Created by 西邮帅哥 on 16/4/28.
//  Copyright © 2016年 xiyoushuaige. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SetDateAndTimeViewControllerDelegate {

    @IBOutlet weak var dateLabel: UILabel!
    var date1: NSDate?
    var time1: NSDate?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        dateLabel.text = NSDateFormatter.localizedStringFromDate(NSDate(), dateStyle: .LongStyle, timeStyle: .ShortStyle)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showpicker" {
            let nc = segue.destinationViewController as!  UINavigationController
            let vc = nc.topViewController as! SetDateAndTimeViewController
            vc.delegate = self
            vc.date2 = date1
            vc.time2 = time1
            
        }
        
    }
    
    func setDateAndTime(date: NSDate, time: NSDate) {
        let dateS = NSDateFormatter.localizedStringFromDate(date, dateStyle: .LongStyle, timeStyle: .NoStyle)
        let timeS = NSDateFormatter.localizedStringFromDate(time, dateStyle: .NoStyle, timeStyle: .ShortStyle)
        date1 = date
        time1 = time
        dateLabel.text = "\(dateS) at \(timeS)"
    }


}

