//
//  MyCollectionViewFlowLayout.swift
//  Project24
//
//  Created by 西邮帅哥 on 16/4/29.
//  Copyright © 2016年 xiyoushuaige. All rights reserved.
//

import UIKit

class MyCollectionViewFlowLayout: UICollectionViewFlowLayout {
    
    let cellWidth = UIScreen.mainScreen().bounds.size.width / 3
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.minimumInteritemSpacing = 0
        self.minimumLineSpacing = 0
        self.itemSize = CGSizeMake(cellWidth, cellWidth)
    }
}
