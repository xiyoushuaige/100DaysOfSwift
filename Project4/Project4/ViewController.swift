//
//  ViewController.swift
//  Project4
//
//  Created by 西邮帅哥 on 16/4/8.
//  Copyright © 2016年 xiyoushuaige. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var tipRateLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    var currentValue = 15 {
        didSet {
            tipLabel.text = "$\(costValue * Double(currentValue) / 100)"
            tipValue = Double(costValue * Double(currentValue) / 100)
            totalLabel.text = "$\(costValue + tipValue)"
        }
    }
    var costValue:Double = 0
    var tipValue:Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        addDoneButton(inputTextField)
        slider.enabled = false
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sliderChanged(sender: UISlider) {
        currentValue = lroundf(sender.value)
        tipRateLabel.text = "Tip(\(currentValue)%)"
        
    }
    
    func addDoneButton(textField: UITextField) {
        let flexBarButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        let doneBarButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Done, target: self, action: "doneButtonPressed:")
        let keyboardToolbar = UIToolbar()
        keyboardToolbar.sizeToFit()
        keyboardToolbar.items = [flexBarButton, doneBarButton]
        textField.inputAccessoryView = keyboardToolbar
    }
    
    @IBAction func doneButtonPressed(sender: UITextField) {
        costValue = Double(inputTextField.text!)!
        inputTextField.resignFirstResponder()
        inputTextField.text = "$\(costValue)"
        tipLabel.text = "$\(costValue * Double(currentValue) / 100)"
        tipValue = Double(costValue * Double(currentValue) / 100)
        totalLabel.text = "$\(costValue + tipValue)"
        slider.enabled = true
    }
    

    
}

