//
//  PointReocrdTableViewController.swift
//  user-iOS
//
//  Created by Jeremy Yang on 2016/4/25.
//  Copyright © 2016年 Jeremy Yang. All rights reserved.
//

import UIKit

class PointRecordTableViewController: UITableViewController {

    let date = ["2015.03.23", "2015.03.18"]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerNib(UINib(nibName:"PointRecordTableViewCell", bundle: nil), forCellReuseIdentifier: "RecordCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return date.count
    }

    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return date[section]
    }

    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30.0
    }

    override func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 2
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("RecordCell", forIndexPath: indexPath) as! PointRecordTableViewCell
        // Configure the cell...
        let redAttributes = [NSForegroundColorAttributeName: UIColor.pointRecordRedColor(), NSFontAttributeName: UIFont.boldSystemFontOfSize(16)]
        let greenAttributes = [NSForegroundColorAttributeName: UIColor.pointRecordGreenColor(), NSFontAttributeName: UIFont.boldSystemFontOfSize(16)]
        let blueAttributes = [NSForegroundColorAttributeName: UIColor.pointRecordBlueColor(), NSFontAttributeName: UIFont.boldSystemFontOfSize(16)]
        let blackAttributes = [NSForegroundColorAttributeName: UIColor.blackColor(), NSFontAttributeName: UIFont.boldSystemFontOfSize(16)]
        var myString: NSString
        var attributedString: NSMutableAttributedString

        if indexPath.section == 0 {
            if indexPath.row == 0 {
                cell.timeLabel?.text = "12:32"
                cell.pointLabel?.text = "+2點"
                cell.detailLabel?.text = "兔子兔子茶飲專賣店-內湖店"
            }

            else {
                cell.timeLabel.text = "12:30"
                cell.pointLabel.text = "-10點"
                cell.pointLabel.textColor = UIColor.pointRecordRedColor()
                myString = "兌換兔子兔子茶飲專賣店-內湖店"
                attributedString = NSMutableAttributedString(string: myString as String)
                attributedString.addAttributes(blackAttributes, range: myString.rangeOfString("兌換"))
                attributedString.addAttributes(redAttributes, range: myString.rangeOfString("兔子兔子茶飲專賣店-內湖店"))
                cell.detailLabel.attributedText = attributedString
            }
        }

        else {
            if indexPath.row == 0 {
                cell.timeLabel.text = "14:30"
                cell.pointLabel.text = "+2點"
                myString = "收到 小邦 送來 兔子兔子茶飲專賣店-內湖店 的點數"
                attributedString = NSMutableAttributedString(string: myString as String)
                attributedString.addAttributes(blackAttributes, range: myString.rangeOfString("收到"))
                attributedString.addAttributes(blueAttributes, range: myString.rangeOfString("小邦"))
                attributedString.addAttributes(blackAttributes, range: myString.rangeOfString("送來"))
                attributedString.addAttributes(greenAttributes, range: myString.rangeOfString("兔子兔子茶飲專賣店-內湖店"))
                attributedString.addAttributes(blackAttributes, range: myString.rangeOfString("的點數"))
                cell.detailLabel.attributedText = attributedString

            }

            else {
                cell.timeLabel.text = "12:30"
                cell.pointLabel.text = "-5點"
                cell.pointLabel.textColor = UIColor.pointRecordRedColor()
                myString = "送 布萊恩紅茶-新北中和店 點數給 土豪"
                attributedString = NSMutableAttributedString(string: myString as String)
                attributedString.addAttributes(blackAttributes, range: myString.rangeOfString("送"))
                attributedString.addAttributes(redAttributes, range: myString.rangeOfString("布萊恩紅茶-新北中和店"))
                attributedString.addAttributes(blackAttributes, range: myString.rangeOfString("點數給"))
                attributedString.addAttributes(blueAttributes, range: myString.rangeOfString("土豪"))
                cell.detailLabel.attributedText = attributedString
            }
        }

        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
