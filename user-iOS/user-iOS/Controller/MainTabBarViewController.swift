//
//  MainTabBarViewController.swift
//  user-iOS
//
//  Created by Jeremy Yang on 2016/4/7.
//  Copyright © 2016年 Jeremy Yang. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    let centerButton = UIButton(type: .Custom)
    let treeMapImageGray = UIImage(named: "treemap_gray")
    let treeMapImage = UIImage(named: "treemap")

    override func viewDidLoad() {
        super.viewDidLoad()
        self.removeTabbarItemText()
        UITabBar.appearance().tintColor = UIColor.appTintBlueColor()
        // Do any additional setup after loading the view.
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.addCenterTabBarButton()
        self.drawTabBarFrame()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func removeTabbarItemText() {
        if let items = tabBar.items {
            for item in items {
                item.title = ""
                item.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0)
            }
        }
    }

    func addCenterTabBarButton() {
        centerButton.frame = CGRectMake(0.0, 0.0, (treeMapImage?.size.width)!, (treeMapImage?.size.height)!)
        centerButton.setBackgroundImage(self.treeMapImageGray, forState: .Normal)
        centerButton.adjustsImageWhenHighlighted = false
        centerButton.addTarget(self, action: #selector(MainTabBarViewController.buttonClicked(_:)), forControlEvents: .TouchUpInside)
        let heightDifference = self.treeMapImageGray!.size.height - self.tabBar.frame.size.height
        if (heightDifference < 0) {
            centerButton.center = self.tabBar.center
        }
        else {
            var center = self.tabBar.center;
            center.y = center.y - heightDifference * 2
            centerButton.center = center
        }

        self.view.addSubview(centerButton)
    }

    func buttonClicked(sender: UIButton!) {
        if sender == centerButton {
            self.selectedIndex = 2
            self.centerButton.setBackgroundImage(self.treeMapImage, forState: .Normal)
        }
    }

    func drawTabBarFrame() {
        let circlePath = UIBezierPath(arcCenter: CGPointMake(centerButton.center.x, centerButton.center.y - 4), radius: CGFloat(31), startAngle: CGFloat(0), endAngle:CGFloat(M_PI * 2), clockwise: true)
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.CGPath
        shapeLayer.fillColor = UIColor.whiteColor().CGColor
        shapeLayer.strokeColor = UIColor.appTintBlueColor().CGColor
        shapeLayer.lineWidth = 3.0

        let linePath = UIBezierPath(rect: CGRectMake(0, self.tabBar.frame.origin.y - 1, self.tabBar.frame.size.width, 6))
        let lineLayer = CAShapeLayer()
        lineLayer.path = linePath.CGPath
        lineLayer.fillColor = UIColor.appTintBlueColor().CGColor
        lineLayer.strokeColor = UIColor.appTintBlueColor().CGColor
        lineLayer.lineWidth = 4.0

        view.layer.insertSublayer(shapeLayer, below: self.tabBar.layer)
        view.layer.insertSublayer(lineLayer, below: shapeLayer)
    }

    override func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem) {
        if item.tag == 2 {
            self.centerButton.setBackgroundImage(self.treeMapImage, forState: .Normal)
        }
        else {
            self.centerButton.setBackgroundImage(self.treeMapImageGray, forState: .Normal)
        }
    }
}
