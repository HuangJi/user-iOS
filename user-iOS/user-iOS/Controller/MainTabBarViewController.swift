//
//  MainTabBarViewController.swift
//  user-iOS
//
//  Created by Jeremy Yang on 2016/4/7.
//  Copyright © 2016年 Jeremy Yang. All rights reserved.
//

import UIKit

let centerButton = UIButton(type: .Custom);

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.removeTabbarItemText()
        self.addCenterTabBarButton()
        self.drawTabBarFrame()
        UITabBar.appearance().tintColor = UIColor.appTintBlueColor()
        // Do any additional setup after loading the view.
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
        let treeMapImage = UIImage(named: "treemap")
        centerButton.frame = CGRectMake(0.0, 0.0, (treeMapImage?.size.width)!, (treeMapImage?.size.height)!)
        centerButton.setBackgroundImage(treeMapImage, forState: .Normal)
        centerButton.adjustsImageWhenHighlighted = false
        centerButton.addTarget(self, action: "buttonClicked:", forControlEvents: .TouchUpInside)
        let heightDifference = treeMapImage!.size.height - self.tabBar.frame.size.height
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
        }
    }

    func drawTabBarFrame() {
        let circlePath = UIBezierPath(arcCenter: centerButton.center, radius: CGFloat(35), startAngle: CGFloat(0), endAngle:CGFloat(M_PI * 2), clockwise: true)
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
        lineLayer.lineWidth = 3.0

        view.layer.insertSublayer(shapeLayer, below: self.tabBar.layer)
        view.layer.insertSublayer(lineLayer, below: shapeLayer)
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
