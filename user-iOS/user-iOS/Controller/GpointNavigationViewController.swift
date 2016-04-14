//
//  GpointNavigationViewController.swift
//  user-iOS
//
//  Created by Jeremy Yang on 2016/4/14.
//  Copyright © 2016年 Jeremy Yang. All rights reserved.
//

import UIKit

class GpointNavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var nav = self.navigationBar
        nav.barStyle = UIBarStyle.Black
        nav.barTintColor = UIColor.appTintBlueColor()
        nav.translucent = false
        nav.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        nav.setBackgroundImage(UIImage(), forBarMetrics: .Default)
        nav.shadowImage = UIImage()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
