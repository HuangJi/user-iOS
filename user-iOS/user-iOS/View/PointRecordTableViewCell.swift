//
//  PointRecordTableViewCell.swift
//  user-iOS
//
//  Created by Jeremy Yang on 2016/4/25.
//  Copyright © 2016年 Jeremy Yang. All rights reserved.
//

import UIKit

class PointRecordTableViewCell: UITableViewCell {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var pointLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
