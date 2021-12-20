//
//  ZZDetailTableViewCell.swift
//  test
//
//  Created by Max on 2021/12/19.
//  Copyright © 2021 Max. All rights reserved.
//

import UIKit

class ZZDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLab: UILabel!
    @IBOutlet weak var detailLab: UILabel!
    @IBOutlet weak var divider: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLab.font = DetailFont
        titleLab.textColor = textColorNormal
        
        detailLab.font = DetailFont
        detailLab.textColor = mainColor
        divider.backgroundColor = cellDivideColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        
    }
    
}
