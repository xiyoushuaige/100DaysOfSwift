//
//  CustomTableCell.swift
//  Project15
//
//  Created by 西邮帅哥 on 16/4/19.
//  Copyright © 2016年 xiyoushuaige. All rights reserved.
//

import UIKit

class CustomTableCell: UITableViewCell {

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        photoImageView.layer.cornerRadius = (60-(150-133))/2
        photoImageView.clipsToBounds = true
        separatorInset = UIEdgeInsets(top: 0, left: 59, bottom: 0, right: 0)

    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}
