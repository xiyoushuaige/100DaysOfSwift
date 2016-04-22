//
//  ViewController.swift
//  Project6
//
//  Created by 西邮帅哥 on 16/4/12.
//  Copyright © 2016年 xiyoushuaige. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//    var dateTime = "" {
//        didSet {
//            dateTimeDisplay.text = "\(dateTime)"
//        }
//    }
    
    
    
    func getCurrentTimeDate() {
//        let dateFormattter = NSDateFormatter()
//        dateFormattter.dateStyle = .MediumStyle
//        dateFormattter.timeStyle = .MediumStyle
//        dateTimeDisplay.text = dateFormattter.stringFromDate(NSDate())
        dateTimeDisplay.text = NSDateFormatter.localizedStringFromDate(NSDate(), dateStyle: .MediumStyle, timeStyle: .MediumStyle)

    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        getCurrentTimeDate()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var dateTimeDisplay: UILabel!

    @IBAction func refreshButtonPressed(sender: UIButton) {
        getCurrentTimeDate()

    }
}

