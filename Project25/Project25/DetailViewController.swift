//
//  DetailViewController.swift
//  Project25
//
//  Created by 西邮帅哥 on 16/4/29.
//  Copyright © 2016年 xiyoushuaige. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var descriptionTextView: UITextView!
    var image2: String?
    var title2: String?
    @IBOutlet weak var textViewHeight: NSLayoutConstraint!
    @IBOutlet weak var viewHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photoImageView.image = UIImage(named: image2!)
        title = title2
        descriptionTextView.text = "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        textViewHeight.constant = descriptionTextView.contentSize.height
        viewHeight.constant = textViewHeight.constant + photoImageView.bounds.height
    }
    
    @IBAction func actionButtonPressed(sender: UIBarButtonItem) {
        showActionSheet()
    }
    
    func showActionSheet() {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .ActionSheet)
        let report = UIAlertAction(title: "Report", style: .Destructive){
            (action: UIAlertAction) -> Void in
            self.test(1)
        }
        alertController.addAction(report)
        let share = UIAlertAction(title: "Share", style: .Default){
            (action: UIAlertAction) -> Void in
            self.test(2)
        }
        alertController.addAction(share)
        let saveImage = UIAlertAction(title: "Save Image", style: .Default, handler: {(action: UIAlertAction) -> Void in self.test(0)})
        alertController.addAction(saveImage)
        let copyLink = UIAlertAction(title: "Copy Link", style: .Default, handler: {(action: UIAlertAction) -> Void in self.test(0)})
        alertController.addAction(copyLink)
        let cancel = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        alertController.addAction(cancel)
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    func test(action: Int) {
        switch action {
            case 1:
                let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("report")
                presentViewController(vc, animated: true, completion: nil)
            case 2:
//                let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("share")
                let vc = storyboard?.instantiateViewControllerWithIdentifier("share") as! ShareViewController
                vc.title3 = title2
                navigationController?.pushViewController(vc, animated: true)
        default: print("test")
        }
        
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
