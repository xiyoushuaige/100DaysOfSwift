//
//  SetDateAndTimeViewController.swift
//  Project23
//
//  Created by 西邮帅哥 on 16/4/28.
//  Copyright © 2016年 xiyoushuaige. All rights reserved.
//

import UIKit

protocol SetDateAndTimeViewControllerDelegate {
    func setDateAndTime(date: NSDate, time: NSDate)
}

class SetDateAndTimeViewController: UIViewController {
    @IBOutlet weak var todayLabel: UILabel!
    @IBOutlet weak var dateDatePicker: UIDatePicker!
    @IBOutlet weak var timeDatePicker: UIDatePicker!
    var delegate: SetDateAndTimeViewControllerDelegate?
    var date2: NSDate?
    var time2: NSDate?


    override func viewDidLoad() {
        super.viewDidLoad()
        todayLabel.text = "Today is: \(NSDateFormatter.localizedStringFromDate(NSDate(), dateStyle: .LongStyle, timeStyle: .NoStyle))"
        dateDatePicker.datePickerMode = .Date
        timeDatePicker.datePickerMode = .Time
        dateDatePicker.date = date2 ?? NSDate()
        timeDatePicker.date = time2 ?? NSDate()


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func cancelButtonPressed(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func doneButtonPressed(sender: UIBarButtonItem) {
        delegate?.setDateAndTime(dateDatePicker.date, time: timeDatePicker.date)
        dismissViewControllerAnimated(true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
