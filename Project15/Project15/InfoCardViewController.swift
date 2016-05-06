//
//  InfoCardViewController.swift
//  Project15
//
//  Created by 西邮帅哥 on 16/4/21.
//  Copyright © 2016年 xiyoushuaige. All rights reserved.
//

import UIKit

class InfoCardViewController: UIViewController {
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var notesLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var mobileLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    var person: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Info Card"
        showInfo()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showInfo() {
        photoImageView.image = UIImage(named: person.photo)
        nameLabel.text = person.name
        emailLabel.text = person.email
        mobileLabel.text = person.mobile
        notesLabel.text = person.notes
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
