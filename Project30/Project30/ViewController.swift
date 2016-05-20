//
//  ViewController.swift
//  Project30
//
//  Created by 西邮帅哥 on 16/5/11.
//  Copyright © 2016年 xiyoushuaige. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UISearchResultsUpdating {
    enum SegmentIndex: Int {
        case Featured = 0
        case Charts = 1
    }
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var contentView: UIView!
    
    var currentViewController: UIViewController?
    lazy var featuredVC: UIViewController? = {
        let featuredVC = self.storyboard?.instantiateViewControllerWithIdentifier("FeaturedVC")
        return featuredVC
    }()
    lazy var chartsVC: UIViewController? = {
        let chartsVC = self.storyboard?.instantiateViewControllerWithIdentifier("ChartsVC")
        return chartsVC
    }()
    
    var searchController: UISearchController!
    


    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barStyle = .Black
        navigationController?.navigationBar.tintColor = UIColor.yellowColor()
        // Do any additional setup after loading the view, typically from a nib.
        segmentedControl.selectedSegmentIndex = SegmentIndex.Featured.rawValue
        displayCurrentSegment(SegmentIndex.Featured.rawValue)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func valueChanged(sender: UISegmentedControl) {
        self.currentViewController?.view.removeFromSuperview()
        self.currentViewController?.removeFromParentViewController()
        displayCurrentSegment(sender.selectedSegmentIndex)
        
    }
    
    func displayCurrentSegment(index: Int) {
        if let vc = viewControllerForSelectedSegmentIndex(index) {
            self.addChildViewController(vc)
            vc.didMoveToParentViewController(self)
            vc.view.frame = self.contentView.bounds
            self.contentView.addSubview(vc.view)
            self.currentViewController = vc
        }
    }
    
    func viewControllerForSelectedSegmentIndex(index: Int) -> UIViewController? {
        var vc: UIViewController?
        switch index {
        case SegmentIndex.Featured.rawValue:
            vc = featuredVC
        case SegmentIndex.Charts.rawValue:
            vc = chartsVC
        default:
            vc = nil
        }
        return vc
    }
    
    func setUpSearchController() {
        let resultsController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("resultsViewController")
        searchController = UISearchController(searchResultsController: resultsController)
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = true
        searchController.searchBar.placeholder = "Search"
        presentViewController(searchController, animated: true, completion: nil)
        
    }
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
    func filterContentForSearchText(searchText: String)
    {
        if let resultsController = searchController.searchResultsController as? ResultsViewController {
            resultsController.filteredMovies = contentData.filter({ (movie: Movie) -> Bool in
                movie.title.containsString(searchText)
            })
            print(resultsController.filteredMovies)
            resultsController.collectionView.reloadData()
        }
        
    }

    @IBAction func searchButtonPressed(sender: UIBarButtonItem) {
        setUpSearchController()
    }
}

