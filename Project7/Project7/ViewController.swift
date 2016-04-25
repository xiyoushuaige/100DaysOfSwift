//
//  ViewController.swift
//  Project7
//
//  Created by 西邮帅哥 on 16/4/12.
//  Copyright © 2016年 xiyoushuaige. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        title = "First View"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var textField: UITextField!
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let vc2 = segue.destinationViewController as! ViewController2
        vc2.memory = textField.text
    }


}

