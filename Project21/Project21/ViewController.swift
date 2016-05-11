//
//  ViewController.swift
//  Project21
//
//  Created by 西邮帅哥 on 16/4/28.
//  Copyright © 2016年 xiyoushuaige. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet weak var locationLabel: UILabel!
    
    var locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func getLocation() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.first
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location!, completionHandler: {
        placemarks, error in
            let placemark = placemarks?.first
            self.locationLabel.text = "\(placemark!.locality!),\(placemark!.administrativeArea!),\(placemark!.country!)"
        })
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("didFailWithError\(error)")
    }

}

