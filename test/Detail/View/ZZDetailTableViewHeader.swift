//
//  ZZDetailTableViewHeader.swift
//  test
//
//  Created by Max on 2021/12/19.
//  Copyright © 2021 Max. All rights reserved.
//

import UIKit
import YogaKit

class ZZDetailTableViewHeader: UIView {

    lazy var describeLab: UILabel = {
        let l = UILabel()
        l.text = "View all information about your subscription and get any help you require"
        l.numberOfLines = 0
        l.font = DetailFont
        l.textColor = textColorHeavy
        l.lineBreakMode = .byWordWrapping
        l.ZZYogaLayout {
            $0.marginTop = YGValue(10)
            $0.alignSelf = .stretch
        }
        return l
    }()
    
    lazy var carImageView: UIImageView = {
        let i = UIImageView(image: UIImage(named: "car"))
        i.ZZYogaLayout {
            $0.marginTop = YGValue(30)
            $0.marginBottom = YGValue(20)
        }
        return i
    }()

    lazy var carNameLabel: UILabel = {
        let l = UILabel()
        l.text = " "
        l.numberOfLines = 0
        l.font = Title2Font
        l.textColor = textColorHeavy
        l.textAlignment = .center
        l.ZZYogaLayout {
            $0.alignSelf = .stretch
            $0.marginBottom = YGValue(5)
        }
        return l
    }()
    
    lazy var carNoLable: UILabel = {
        let l = UILabel()
        l.text = " "
        l.font = Title3Font
        l.textColor = textColorNormal
        l.textAlignment = .center
        l.ZZYogaLayout {
            $0.width = YGValue(value: 100, unit: .percent)
        }
        return l
    }()
    
    lazy var progressWrapper: UIView = {
        let v = UIView()
        v.ZZYogaLayout {
            $0.alignSelf = .stretch
        }
        return v
    }()
    
    lazy var leftDayLabel: UILabel = {
        let l = UILabel()
        l.text = " "
        l.font = DetailFont
        l.textColor = textColorNormal
        l.ZZYogaLayout {
            $0.alignSelf = .flexEnd
            $0.marginBottom = YGValue(10)
        }
        return l
    }()
    
    lazy var progress: UIProgressView = {
        let p = UIProgressView()
        p.setProgress(0, animated: false)
        p.progressTintColor = progressFillColor
        p.trackTintColor = progressTrackColor
        p.ZZYogaLayout {
            $0.alignSelf = .stretch
        }
        return p
    }()
    
    lazy var infoView: ZZCarInfoView = {
        let i = ZZCarInfoView()
        i.ZZYogaLayout {
            $0.marginTop = YGValue(15)
            $0.alignSelf = .stretch
        }
        return i
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        root.ZZYogaLayout {
            $0.alignItems = .center
        }
        addSubview(describeLab)
        addSubview(carImageView)
        addSubview(carNameLabel)
        addSubview(carNoLable)
        
        progressWrapper.addSubview(leftDayLabel)
        progressWrapper.addSubview(progress)
        addSubview(progressWrapper)
        addSubview(infoView)
        
        root.yoga.applyLayout(preservingOrigin: false)
    }
    
    override func layoutSubviews() {
            super.layoutSubviews()
            root.yoga.applyLayout(preservingOrigin: true)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
