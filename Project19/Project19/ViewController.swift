//
//  ViewController.swift
//  Project19
//
//  Created by 西邮帅哥 on 16/4/22.
//  Copyright © 2016年 xiyoushuaige. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var contentTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        dateLabel.text = NSDateFormatter.localizedStringFromDate(NSDate(), dateStyle: .LongStyle, timeStyle: .NoStyle)
        addKeyboardToolBar()
//        contentTextView.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addKeyboardToolBar() {
        let cameraBarButton = UIBarButtonItem(image: UIImage(named: "camera"), style: .Plain, target: self, action: nil)
        let locationBarButton = UIBarButtonItem(image: UIImage(named: "location"), style: .Plain, target: self, action: nil)
        let keyboardToolBar = UIToolbar()
        keyboardToolBar.sizeToFit()
        keyboardToolBar.items = [cameraBarButton, locationBarButton]
        keyboardToolBar.setBackgroundImage(UIImage(), forToolbarPosition: .Any, barMetrics: .Default)
        keyboardToolBar.setShadowImage(UIImage(), forToolbarPosition: .Any)
        contentTextView.inputAccessoryView = keyboardToolBar
    }


}

