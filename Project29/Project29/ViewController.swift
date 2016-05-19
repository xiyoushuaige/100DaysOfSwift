//
//  ViewController.swift
//  Project29
//
//  Created by 西邮帅哥 on 16/5/9.
//  Copyright © 2016年 xiyoushuaige. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDataSource {
    @IBOutlet weak var upCollectionViewHeight: NSLayoutConstraint!
    @IBOutlet weak var downCollectionViewHeight: NSLayoutConstraint!
    @IBOutlet weak var viewHeight: NSLayoutConstraint!
    @IBOutlet weak var upCollectionView: UICollectionView!
    @IBOutlet weak var downCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        upCollectionView.dataSource = self
        downCollectionView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        upCollectionViewHeight.constant = UIScreen.mainScreen().bounds.size.height / 3
        downCollectionViewHeight.constant = UIScreen.mainScreen().bounds.size.width * 2
        viewHeight.constant = upCollectionViewHeight.constant + downCollectionViewHeight.constant
        print(upCollectionViewHeight.constant)
        print(downCollectionViewHeight.constant)
        print(viewHeight.constant)
        
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        if collectionView == upCollectionView {
            return 1
        } else {
            return 2
        }
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == upCollectionView {
            return 5
        } else {
            return 9
        }
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        if collectionView == upCollectionView {
            let cell = upCollectionView.dequeueReusableCellWithReuseIdentifier("upcell", forIndexPath: indexPath) as! UpCollectionViewCell
            cell.imageView.image = UIImage(named: "\(indexPath.item)")
            return cell
        } else {
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("downcell", forIndexPath: indexPath) as! DownCollectionViewCell
            cell.imageView.image = UIImage(named: "\(indexPath.item)")
            return cell
        }
    }


}

