//
//  ViewController.swift
//  Project28
//
//  Created by 西邮帅哥 on 16/5/6.
//  Copyright © 2016年 xiyoushuaige. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UICollectionViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    let movieArray = ["The Angry Birds Movie", "Black Mass", "Steve Jobs", "Inside Out", "Insidious: Chapter 3", "Trainwreck", "Jurassic World", "Slow Learners", "Minions", "Iron Man 3"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = self
        collectionView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("tvcell")
        cell?.textLabel?.text = movieArray[indexPath.row]
        return cell!
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieArray.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cvcell", forIndexPath: indexPath) as! CollectionViewCell
        cell.photoImageView.image = UIImage(named: "\(indexPath.item)")
        return cell
    }
    
    
    
}

