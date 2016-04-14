//
//  ViewController.swift
//  Project2
//
//  Created by 西邮帅哥 on 16/4/8.
//  Copyright © 2016年 xiyoushuaige. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var numberDisplayLabel: UILabel!
    var number = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        numberDisplayLabel.text = "\(number)"
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func resetButtonPressed(sender: UIBarButtonItem) {
        number = 0
        numberDisplayLabel.text = "\(number)"
    }

    @IBAction func tapButtonPressed(sender: UIButton) {
        number += 1
        numberDisplayLabel.text = "\(number)"
    }
    
    @IBAction func holdButtonPressed(sender: UILongPressGestureRecognizer) {
        number += 1
        numberDisplayLabel.text = "\(number)"
    }
}

