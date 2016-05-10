//
//  CardInfoViewController.swift
//  user-iOS
//
//  Created by Jeremy Yang on 2016/5/10.
//  Copyright © 2016年 Jeremy Yang. All rights reserved.
//

import UIKit

class CardInfoViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var stampScrollView: UIScrollView!
    @IBOutlet weak var cardInfoScrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var storeNameLabel: UILabel!
    @IBOutlet weak var claimButton: UIButton!
    @IBOutlet weak var giftButton: UIButton!

    var storeName: String?
    var currentPoints: Int?
    var deadLine: String?
    var detailMessage: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        storeNameLabel.text = storeName
        configureStampScrollView()
        configurePageControl()
        configureCardInfoScrollView()
        configureButtons()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Configure Stamp Scroll View
    func configureStampScrollView() {
        stampScrollView.pagingEnabled = true
        stampScrollView.showsHorizontalScrollIndicator = false
        stampScrollView.showsVerticalScrollIndicator = false
        stampScrollView.scrollsToTop = false

        let totalPages = currentPoints! / 10 + 1
        stampScrollView.contentSize = CGSizeMake(stampScrollView.frame.size.width * CGFloat(totalPages), stampScrollView.frame.size.height)

        stampScrollView.delegate = self

        for i in 0..<totalPages {
            let stampView = NSBundle.mainBundle().loadNibNamed("stampsView", owner: self, options: nil)[0] as! UIView

            stampView.frame = CGRectMake(CGFloat(i) * stampScrollView.frame.size.width, 0, stampScrollView.frame.size.width, stampScrollView.frame.size.height)

            for j in 1..<11 {
                let stampColor = stampView.viewWithTag(j) as! UIImageView
                if currentPoints >= 10 * i + j {
                    stampColor.image = UIImage(named: "stampRed")
                }
                else {
                    stampColor.image = UIImage(named: "stampGray")
                }
            }
            stampScrollView.addSubview(stampView)
        }
    }

    // MARK: - Stamp Scroll View Delegate
    func scrollViewDidScroll(scrollView: UIScrollView) {
        if scrollView.tag == 1 {
            let currentPage = floor(stampScrollView.contentOffset.x / UIScreen.mainScreen().bounds.size.width)
            pageControl.currentPage = Int(currentPage)
        }
    }

    // MARK: - Configure Stamp Page Control
    func configurePageControl() {
        let totalPages = currentPoints! / 10 + 1
        pageControl.numberOfPages = totalPages
        pageControl.currentPage = 0
    }

    @IBAction func changePage(sender: UIPageControl) {
        var newFrame = stampScrollView.frame
        newFrame.origin.x = newFrame.size.width * CGFloat(pageControl.currentPage)
        stampScrollView.scrollRectToVisible(newFrame, animated: true)
    }

    // MARK: - Configure Card Info Scroll View
    func configureCardInfoScrollView() {
        let cardInfoView = NSBundle.mainBundle().loadNibNamed("CardInfoView", owner: self, options: nil)[0] as! UIView
        let deadLineLabel = cardInfoView.viewWithTag(1) as! UILabel
        let detailMessageLabel = cardInfoView.viewWithTag(2) as! UILabel
        deadLineLabel.text = deadLine
        detailMessageLabel.text = detailMessage

        let visibleHeight = cardInfoScrollView.frame.size.height - detailMessageLabel.frame.origin.y - 80
        let detailMessageLabelWidth = detailMessageLabel.frame.size.width
        let labelNeededSize = detailMessageLabel.sizeThatFits(CGSizeMake(detailMessageLabelWidth, CGFloat.max))

        let neededHeight: CGFloat!
        if labelNeededSize.height > visibleHeight  {
            neededHeight = labelNeededSize.height + 130
        }
        else {
            neededHeight = labelNeededSize.height
        }

        cardInfoScrollView.showsHorizontalScrollIndicator = false
        cardInfoScrollView.showsVerticalScrollIndicator = true
        cardInfoScrollView.contentSize = CGSizeMake(cardInfoScrollView.frame.size.width, neededHeight)

        cardInfoView.frame = CGRectMake(0, 0, cardInfoScrollView.frame.size.width, neededHeight)

        cardInfoScrollView.addSubview(cardInfoView)
    }

    // MARK: - Configure Buttons
    func configureButtons() {
        addShadowForButton(claimButton)
        addShadowForButton(giftButton)
    }

    func addShadowForButton(Button: UIButton) {
        Button.layer.shadowColor = UIColor.blackColor().CGColor
        Button.layer.shadowOffset = CGSizeMake(0.0, 2.0)
        Button.layer.shadowOpacity = 0.7
        Button.layer.shadowRadius = 2.7
        Button.layer.masksToBounds = false
        Button.layer.cornerRadius = 25.4
    }

    // MARK: - Button Touched
    @IBAction func buttonTouchDown(sender: UIButton) {
        let shadowAnim = CABasicAnimation()
        shadowAnim.keyPath = "shadowRadius"
        shadowAnim.fromValue = 2.7
        shadowAnim.toValue = 1.2
        shadowAnim.duration = 0.1

        sender.layer.addAnimation(shadowAnim, forKey: "shadowRadius")
        sender.layer.shadowRadius = 1.2
    }

    @IBAction func buttonTouchUp(sender: UIButton) {
        sender.layer.shadowRadius = 2.7
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
