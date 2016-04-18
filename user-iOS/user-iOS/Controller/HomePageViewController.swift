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
    @IBOutlet weak var sendPointButton: UIButton!
    @IBOutlet weak var qrcodeButton: UIButton!
    @IBOutlet weak var currentPointView: UIView!
    @IBOutlet weak var currentEXP: UIView!
    @IBOutlet weak var treeImage: UIImageView!
    var treeCount:NSInteger = 9

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.tintColor = UIColor.whiteColor()
        self.searchBar.setBackgroundImage(UIImage(), forBarPosition: .Any, barMetrics: .Default)
        self.searchBar.backgroundColor = UIColor.appTintBlueColor()
        self.sendPointButton.layer.masksToBounds = true
        self.sendPointButton.layer.cornerRadius = 4.0

        self.qrcodeButton.layer.masksToBounds = true
        self.qrcodeButton.layer.cornerRadius = 4.0

        self.currentPointView.layer.borderWidth = 1.1
        self.currentPointView.layer.borderColor = UIColor.whiteColor().CGColor

        self.currentEXP.layer.borderWidth = 1.1
        self.currentEXP.layer.borderColor = UIColor.whiteColor().CGColor
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

    @IBAction func treeImageButtonClicked(sender: UIButton) {
        self.treeCount = (self.treeCount + 1) % 10
        self.treeImage.image = UIImage(named: "tree\(treeCount)")
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
