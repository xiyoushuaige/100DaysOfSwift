//
//  ViewController.swift
//  Project3
//
//  Created by 西邮帅哥 on 16/4/8.
//  Copyright © 2016年 xiyoushuaige. All rights reserved.
//

import UIKit
import iAd

class ViewController: UIViewController, ADBannerViewDelegate {

    @IBOutlet weak var adBanner: ADBannerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        adBanner.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func bannerView(banner: ADBannerView!, didFailToReceiveAdWithError error: NSError!) {
        print("fail")
    }
    
    func bannerViewWillLoadAd(banner: ADBannerView!) {
        print("willload")
    }
    
    func bannerViewDidLoadAd(banner: ADBannerView!) {
        print("hasload")
    }
    
    func bannerViewActionDidFinish(banner: ADBannerView!) {
        print("actionfinish")
    }
    
    func bannerViewActionShouldBegin(banner: ADBannerView!, willLeaveApplication willLeave: Bool) -> Bool {
        print("actionbegin")
        return true
    }


}

