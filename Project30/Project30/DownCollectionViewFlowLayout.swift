//
//  DownCollectionViewFlowLayout.swift
//  Project30
//
//  Created by 西邮帅哥 on 16/5/12.
//  Copyright © 2016年 xiyoushuaige. All rights reserved.
//

import UIKit

class DownCollectionViewFlowLayout: UICollectionViewFlowLayout {
    let cellWidth = UIScreen.mainScreen().bounds.size.width / 3
    let cellHeight = UIScreen.mainScreen().bounds.size.width / 3
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        minimumInteritemSpacing = 0
        minimumLineSpacing = 0
        itemSize = CGSizeMake(cellWidth, cellHeight)
    }
}
