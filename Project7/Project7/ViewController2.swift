//
//  ViewController2.swift
//  Project7
//
//  Created by 西邮帅哥 on 16/4/12.
//  Copyright © 2016年 xiyoushuaige. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    var memory: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = memory
        title = "Second View"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var label: UILabel!

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    

}
