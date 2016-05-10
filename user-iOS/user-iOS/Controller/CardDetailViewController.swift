//
//  CardDetailViewController.swift
//  user-iOS
//
//  Created by Jeremy Yang on 2016/5/10.
//  Copyright © 2016年 Jeremy Yang. All rights reserved.
//

import UIKit

class CardDetailViewController: UIViewController {

    @IBOutlet weak var cardInfoContainerView: UIView!
    @IBOutlet weak var storeInfoContainerView: UIView!
    var cardInfo: NSDictionary!

    override func viewDidLoad() {
        super.viewDidLoad()
        storeInfoContainerView.hidden = true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Segmented Control
    @IBAction func indexChanged(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            cardInfoContainerView.hidden = false
            storeInfoContainerView.hidden = true
        case 1:
            cardInfoContainerView.hidden = true
            storeInfoContainerView.hidden = false
        default:
            break
        }
    }

    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "CardInfoEmbedSegue" {
            let cardInfoVC = segue.destinationViewController as! CardInfoViewController
            cardInfoVC.storeName = cardInfo.objectForKey("storeName") as? String
            cardInfoVC.currentPoints = cardInfo.objectForKey("currentPoints") as? Int
            cardInfoVC.deadLine = cardInfo.objectForKey("deadLine") as? String
            cardInfoVC.detailMessage = cardInfo.objectForKey("detailMessage") as? String
        }
    }

}
