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
        self.pointRecordButton.layer.masksToBounds = true
        self.pointRecordButton.layer.cornerRadius = 4.0

        self.accountSettingButton.layer.masksToBounds = true
        self.accountSettingButton.layer.cornerRadius = 4.0

        self.accountSettingContainerView.hidden = true

        self.profilePictureImage.image = UIImage(named: "KJC")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.addProfilePictureCircleMask()
    }

    func addProfilePictureCircleMask() {
        let circlePath = UIBezierPath(roundedRect: CGRectMake(0, 0, self.profilePictureImage.frame.size.width, self.profilePictureImage.frame.size.height), cornerRadius: self.profilePictureImage.frame.size.height)

        let circleLayer = CAShapeLayer()
        circleLayer.path = circlePath.CGPath
        circleLayer.fillColor = UIColor.blackColor().CGColor
        circleLayer.strokeColor = UIColor.blackColor().CGColor
        circleLayer.lineWidth = 0

        self.profilePictureImage.layer.mask = circleLayer
    }

    @IBAction func pointRecordButtonClicked(sender: UIButton) {
        if self.pointRecordContainerView.hidden {
            self.pointRecordButton.backgroundColor = UIColor.profileButtonEnableBackgroundColor()
            self.pointRecordButton.setTitleColor(UIColor.profileButtonEnableTitleColor(), forState: .Normal)

            self.accountSettingButton.backgroundColor = UIColor.profileButtonDisableBackgroundColor()
            self.accountSettingButton.setTitleColor(UIColor.profileButtonDisableTitleColor(), forState: .Normal)

            self.pointRecordContainerView.hidden = false
            self.accountSettingContainerView.hidden = true
        }

        else {
            //Go to Top
        }
    }

    @IBAction func accountSettingButtonClicked(sender: UIButton) {
        if self.accountSettingContainerView.hidden {
            self.accountSettingButton.backgroundColor = UIColor.profileButtonEnableBackgroundColor()
            self.accountSettingButton.setTitleColor(UIColor.profileButtonEnableTitleColor(), forState: .Normal)

            self.pointRecordButton.backgroundColor = UIColor.profileButtonDisableBackgroundColor()
            self.pointRecordButton.setTitleColor(UIColor.profileButtonDisableTitleColor(), forState: .Normal)

            self.accountSettingContainerView.hidden = false
            self.pointRecordContainerView.hidden = true
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
