//
//  FeaturedViewController.swift
//  Project30
//
//  Created by 西邮帅哥 on 16/5/11.
//  Copyright © 2016年 xiyoushuaige. All rights reserved.
//

import UIKit

class FeaturedViewController: UIViewController, UICollectionViewDataSource {
    @IBOutlet weak var upCollectionView: UICollectionView!
    @IBOutlet weak var downCollectionView: UICollectionView!
    @IBOutlet weak var viewHeight: NSLayoutConstraint!
    @IBOutlet weak var upHeight: NSLayoutConstraint!
    @IBOutlet weak var downHeight: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        upCollectionView.dataSource = self
        downCollectionView.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        upHeight.constant = UIScreen.mainScreen().bounds.size.height / 3
        downHeight.constant = UIScreen.mainScreen().bounds.size.width * 2
        viewHeight.constant = upHeight.constant + downHeight.constant
        
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
            return bannerData.count
        } else {
            return contentData.count
        }
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        if collectionView == upCollectionView {
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("upcell", forIndexPath: indexPath) as! UpCollectionViewCell
            cell.imageView.image = UIImage(named: bannerData[indexPath.row].image)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("downcell", forIndexPath: indexPath) as! DownCollectionViewCell
            cell.imageView.image = UIImage(named: contentData[indexPath.row].image)
            cell.titleLabel.text = contentData[indexPath.row].title
            return cell
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
