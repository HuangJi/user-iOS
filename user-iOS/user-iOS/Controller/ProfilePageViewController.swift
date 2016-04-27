//
//  ProfilePageViewController.swift
//  user-iOS
//
//  Created by Jeremy Yang on 2016/4/22.
//  Copyright © 2016年 Jeremy Yang. All rights reserved.
//

import UIKit

class ProfilePageViewController: UIViewController {

    @IBOutlet weak var pointRecordButton: UIButton!
    @IBOutlet weak var accountSettingButton: UIButton!
    @IBOutlet weak var pointRecordContainerView: UIView!
    @IBOutlet weak var accountSettingContainerView: UIView!
    @IBOutlet weak var profilePictureImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        pointRecordButton.layer.masksToBounds = true
        pointRecordButton.layer.cornerRadius = 4.0

        accountSettingButton.layer.masksToBounds = true
        accountSettingButton.layer.cornerRadius = 4.0

        accountSettingContainerView.hidden = true

        profilePictureImage.image = UIImage(named: "KJC")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        addProfilePictureCircleMask()
    }

    func addProfilePictureCircleMask() {
        let circlePath = UIBezierPath(roundedRect: CGRectMake(0, 0, profilePictureImage.frame.size.width, profilePictureImage.frame.size.height), cornerRadius: profilePictureImage.frame.size.height)

        let circleLayer = CAShapeLayer()
        circleLayer.path = circlePath.CGPath
        circleLayer.fillColor = UIColor.blackColor().CGColor
        circleLayer.strokeColor = UIColor.blackColor().CGColor
        circleLayer.lineWidth = 0

        profilePictureImage.layer.mask = circleLayer
    }

    @IBAction func pointRecordButtonClicked(sender: UIButton) {
        if pointRecordContainerView.hidden {
            pointRecordButton.backgroundColor = UIColor.profileButtonEnableBackgroundColor()
            pointRecordButton.setTitleColor(UIColor.profileButtonEnableTitleColor(), forState: .Normal)

            accountSettingButton.backgroundColor = UIColor.profileButtonDisableBackgroundColor()
            accountSettingButton.setTitleColor(UIColor.profileButtonDisableTitleColor(), forState: .Normal)

            pointRecordContainerView.hidden = false
            accountSettingContainerView.hidden = true
        }

        else {
            //Go to Top
        }
    }

    @IBAction func accountSettingButtonClicked(sender: UIButton) {
        if accountSettingContainerView.hidden {
            accountSettingButton.backgroundColor = UIColor.profileButtonEnableBackgroundColor()
            accountSettingButton.setTitleColor(UIColor.profileButtonEnableTitleColor(), forState: .Normal)

            pointRecordButton.backgroundColor = UIColor.profileButtonDisableBackgroundColor()
            pointRecordButton.setTitleColor(UIColor.profileButtonDisableTitleColor(), forState: .Normal)

            accountSettingContainerView.hidden = false
            pointRecordContainerView.hidden = true
        }

        else {
            //Go to Top
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
