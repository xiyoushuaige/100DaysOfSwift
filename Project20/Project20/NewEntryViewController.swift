//
//  NewEntryViewController.swift
//  Project20
//
//  Created by 西邮帅哥 on 16/4/25.
//  Copyright © 2016年 xiyoushuaige. All rights reserved.
//

import UIKit
import CoreLocation
import CoreData

protocol NewEntryViewControllerDelegate {
    func addTimeLine(timeline: TimeLine)
}

class NewEntryViewController: UIViewController, InputAccessoryViewDelegate,UIImagePickerControllerDelegate, UINavigationControllerDelegate, CLLocationManagerDelegate {
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var entryTextView: UITextView!
    var iav: InputAccessoryView?
    var locationManager = CLLocationManager()
    var delegate: NewEntryViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateLabel.text = NSDateFormatter.localizedStringFromDate(NSDate(), dateStyle: .LongStyle, timeStyle: .ShortStyle)
        // Do any additional setup after loading the view.
        let inputAccessoryView = NSBundle.mainBundle().loadNibNamed("InputAccessoryView", owner: self, options: nil).first as! InputAccessoryView
        inputAccessoryView.delegate = self
        entryTextView.inputAccessoryView = inputAccessoryView
        iav = inputAccessoryView
        entryTextView.becomeFirstResponder()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func doneButtonPressed(sender: UIBarButtonItem) {
        let moc = AppDelegate().managedObjectContext
        let entity = NSEntityDescription.insertNewObjectForEntityForName("TimeLine", inManagedObjectContext: moc) as! TimeLine
        guard let photoImage = iav?.photoImageView.image else {
            return
        }
        let imageData = UIImagePNGRepresentation(photoImage)
        
        entity.setValue(dateLabel.text, forKey: "date")
        entity.setValue(imageData, forKey: "image")
        entity.setValue(entryTextView.text, forKey: "text")
        entity.setValue(iav?.addressLabel.text, forKey: "address")
        
        do {
            try moc.save()
            delegate?.addTimeLine(entity)
            navigationController?.popViewControllerAnimated(true)
        } catch {
            fatalError("Failure to save context: \(error)")
        }
    }
    
    func addPhoto() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        presentViewController(imagePickerController, animated: true, completion: nil)
    }
    
    func getLocation() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        picker.dismissViewControllerAnimated(true, completion: nil)
        iav?.photoImageView.image = image
        entryTextView.becomeFirstResponder()
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location!, completionHandler: { placemarks, error in
            if placemarks != nil {
                let placemark = placemarks!.last!
                self.iav?.addressLabel.text = "\(placemark.locality!) \(placemark.administrativeArea!) \(placemark.country!)"
            }
        })
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("didFailWithError\(error)")
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
