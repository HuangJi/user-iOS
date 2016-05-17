//
//  CardsViewController.swift
//  user-iOS
//
//  Created by Wilson H. on 4/19/16.
//  Copyright © 2016 Jeremy Yang. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController, UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var cardsTableView: UITableView!
    weak var delegate:PointTreeHttpProtocol?

    let storeNameArray: NSArray = ["City Milk 城市首選 大安店", "五十嵐 復興店", "兔子兔子茶飲專賣店 內湖店"]
    let pointsArray: NSArray = [9, 22, 2]
    let deadLineArray: NSArray = ["2016.01.01- 2016.10.20", "2016.02.01- 2016.10.20", "2016.04.01- 2016.10.20"]
    let detailMessageArray: NSArray = ["集滿十點可兌換35元飲料。", "集滿十點可兌換35元飲料。", "集滿十點可兌換35元飲料。"]
    let imageNameArray: NSArray = ["citymilk2", "50lan", "rabbit"]
    let badgeArray: NSArray = [1, 0, 1]
    let sectionTitleArray: NSArray = ["常 用 集 點 卡", "集 點 卡"]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        view.tintColor = UIColor.whiteColor()
        searchBar.setBackgroundImage(UIImage(), forBarPosition: .Any, barMetrics: .Default)
        searchBar.backgroundColor = UIColor.appTintBlueColor()
        let ptc = PointTreeClient()
        ptc.getPointList(self)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Configure Search Bar Outlet
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
    }

    // MARK: - Search Bar Delegate
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(false, animated: true)
        searchBar.text = ""
        searchBar.endEditing(true)
    }

    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(false, animated: true)
        searchBar.endEditing(true)
    }

    // MARK: - Table View Delegate and Data Source
    func tableView(tableView: UITableView, numberOfRowsInSection section:Int) -> Int {
        return storeNameArray.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CardTableViewCell", forIndexPath: indexPath) as! CardTableViewCell
        cell.storeNameLabel!.text = "\(storeNameArray.objectAtIndex(indexPath.row))"
        cell.pointsLabel!.text = "目前點數：\(pointsArray.objectAtIndex(indexPath.row)) 點"
        cell.deadlineLabel!.text = "兌換期限：\(deadLineArray.objectAtIndex(indexPath.row))"
        cell.storeImageView!.image = UIImage(named: imageNameArray.objectAtIndex(indexPath.row) as! String)

        if Int(badgeArray.objectAtIndex(indexPath.row) as! NSNumber) > 0 {
            cell.badgeLabel!.text = "\(badgeArray.objectAtIndex(indexPath.row))"
            cell.badgeImageView.image = UIImage(named: "resDot")
        }
        else {
            cell.badgeLabel!.text = ""
            cell.badgeImageView.image = nil
        }

        return cell
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100.0
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return sectionTitleArray.count
    }

    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let returnedView = UIView(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, 14.0)) //set these values as necessary
        returnedView.backgroundColor = UIColor.init(red: 252/255.0, green: 222/255.0, blue: 156/255.0, alpha: 1)
        let label = UILabel(frame: CGRectMake(22, 11, UIScreen.mainScreen().bounds.width, 10))
        label.font = UIFont(name: "Avenir-Heavy", size: 16.0)
        label.text = sectionTitleArray.objectAtIndex(section) as? String
        returnedView.addSubview(label)
        
        return returnedView
    }

    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30.0
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let storeName = storeNameArray.objectAtIndex(indexPath.row)
        let currentPoints = pointsArray.objectAtIndex(indexPath.row) as! Int
        let deadLine = deadLineArray.objectAtIndex(indexPath.row)
        let detailMessage = detailMessageArray.objectAtIndex(indexPath.row)
        let cardInfo = NSDictionary.init(objects: [storeName,currentPoints,deadLine, detailMessage], forKeys: ["storeName", "currentPoints", "deadLine", "detailMessage"])
        performSegueWithIdentifier("ShowCardDetailSegue", sender: cardInfo)
    }

    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowCardDetailSegue" {
            let cardDetailVC = segue.destinationViewController as! CardDetailViewController
            cardDetailVC.cardInfo = sender as! NSDictionary
        }
    }

}

extension CardsViewController: PointTreeHttpProtocol {
    func appDidGetPointList(data: AnyObject) {
        print("Success: ", data)
    }

    func appGetPointListDidFail(data: AnyObject) {
        print("Fail: ", data)
    }
}
