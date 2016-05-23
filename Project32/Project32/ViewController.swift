//
//  ViewController.swift
//  Project32
//
//  Created by 西邮帅哥 on 16/5/18.
//  Copyright © 2016年 xiyoushuaige. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var rockman: UIImageView!
    @IBOutlet weak var bullet: UIImageView!
    @IBOutlet weak var rockmanTobullet: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        rockman.image = UIImage(named: "rockman1")
        bullet.image = UIImage(named: "bullet")
        bullet.hidden = true
        rockman.animationImages = [UIImage(named: "rockman1")!, UIImage(named: "rockman2")!]
        rockman.animationDuration = 0.3
        rockman.animationRepeatCount = 1
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func shootPressed(sender: UIButton) {
        self.rockman.startAnimating()
        UIView.animateWithDuration(1, animations: { () -> Void in
            self.bullet.hidden = false
            self.rockmanTobullet.constant = 300
            self.view.layoutIfNeeded()
            }) { (finished: Bool) -> Void in
                self.bullet.hidden = true
                self.rockmanTobullet.constant = 8
        }
    }

}

