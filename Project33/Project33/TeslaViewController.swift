//
//  TeslaViewController.swift
//  Project33
//
//  Created by 西邮帅哥 on 16/5/19.
//  Copyright © 2016年 xiyoushuaige. All rights reserved.
//

import UIKit

class TeslaViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    @IBAction func upSwipe(sender: AnyObject) {
        performSegueWithIdentifier("TS", sender: nil)
    }
    
    @IBAction func downSwipe(sender: AnyObject) {
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
