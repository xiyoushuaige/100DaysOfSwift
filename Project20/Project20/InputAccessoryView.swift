//
//  InputAccessoryView.swift
//  Project20
//
//  Created by 西邮帅哥 on 16/4/26.
//  Copyright © 2016年 xiyoushuaige. All rights reserved.
//

import UIKit
protocol InputAccessoryViewDelegate {
    func addPhoto()
    func getLocation()
}

class InputAccessoryView: UIView {
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    var delegate: InputAccessoryViewDelegate?

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    @IBAction func photoButtonPressed() {
        delegate?.addPhoto()
    }

    @IBAction func locationButtonPressed() {
        delegate?.getLocation()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
