//
//  HomePageViewController.swift
//  user-iOS
//
//  Created by Jeremy Yang on 2016/4/14.
//  Copyright © 2016年 Jeremy Yang. All rights reserved.
//

import UIKit

class HomePageViewController: UIViewController, UISearchBarDelegate {

    @IBOutlet weak var searchBar: UISearchBar!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.tintColor = UIColor.whiteColor()
        self.searchBar.setBackgroundImage(UIImage(), forBarPosition: .Any, barMetrics: .Default)
        self.searchBar.backgroundColor = UIColor.appTintBlueColor()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        self.searchBar.showsCancelButton = true
    }

    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        self.searchBar.setShowsCancelButton(false, animated: true)
        self.searchBar.text = ""
        self.searchBar.endEditing(true)
    }

    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        self.searchBar.setShowsCancelButton(false, animated: true)
        self.searchBar.endEditing(true)
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
