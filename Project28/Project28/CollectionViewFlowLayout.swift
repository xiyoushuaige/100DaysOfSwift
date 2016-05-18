//
//  CollectionViewFlowLayout.swift
//  Project28
//
//  Created by 西邮帅哥 on 16/5/6.
//  Copyright © 2016年 xiyoushuaige. All rights reserved.
//

import UIKit

class CollectionViewFlowLayout: UICollectionViewFlowLayout {
    let cellWidth = UIScreen.mainScreen().bounds.size.width
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        minimumInteritemSpacing = 0
        minimumLineSpacing = 0
        itemSize = CGSizeMake(cellWidth, cellWidth)
    }

}
