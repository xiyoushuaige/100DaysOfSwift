//
//  AddItemViewController.swift
//  Project12
//
//  Created by 西邮帅哥 on 16/4/14.
//  Copyright © 2016年 xiyoushuaige. All rights reserved.
//

import UIKit

protocol AddItemViewControllerDelegate: class {
    func addItemViewController(item: String)
}
class AddItemViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    weak var delegate: AddItemViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "New Movie"
        textField.becomeFirstResponder()
        textField.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        delegate?.addItemViewController(textField.text!)
        navigationController?.popViewControllerAnimated(true)
        return true
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
