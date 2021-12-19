//
//  ZZEnhanceSubscriptionView.swift
//  test
//
//  Created by Max on 2021/12/19.
//  Copyright © 2021 Max. All rights reserved.
//

import UIKit
import YogaKit

class ZZEnhanceSubscriptionView: UIView {

    lazy var titleLabel: UILabel = {
        let l = UILabel()
        l.text = "Enhance your Subscription"
        l.font = Title1Font
        l.textColor = textColorHeavy
        return l
    }()
    
    lazy var detailImgView: UIImageView = {
        let i = UIImageView()
        i.image = UIImage.init(named: "enhanceSubscription")
        return i
    }()
    
    lazy var contentWrappper = UIView()
    
    lazy var contentTitleLabel: UILabel = {
        let l = UILabel()
        l.text = "Concierge Service"
        l.font = Title2Font
        l.textColor = textColorHeavy
        return l
    }()
    
    lazy var contentDetailLabel: UILabel = {
        let l = UILabel()
        l.text = "Take away the hassle of car ownership and enjoy full comfort and convenience with our concierge service."
        l.numberOfLines = 0
        l.lineBreakMode = .byWordWrapping
        l.font = DetailFont
        l.textColor = textColorNormal
        return l
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        root.ZZYogaLayout { $0.alignItems = .center }
        
        titleLabel.ZZYogaLayout { $0.marginBottom = YGValue(20) }
        root.addSubview(titleLabel)
        
        contentWrappper.ZZYogaLayout {
            $0.flexDirection = .row
            $0.alignSelf = .stretch
        }
        root.addSubview(contentWrappper)
        
        detailImgView.ZZYogaLayout {
            $0.width = YGValue(80)
            $0.aspectRatio = 1
        }
        contentWrappper.addSubview(detailImgView)
        
        let contentRightWrapper = UIView()
        contentRightWrapper.ZZYogaLayout {
            $0.marginLeft = YGValue(10)
            $0.flex = 1
            $0.alignItems = .stretch
        }
        contentWrappper.addSubview(contentRightWrapper)
        
        contentTitleLabel.ZZYogaLayout {
            $0.marginBottom = YGValue(5)
        }
        contentDetailLabel.configureLayout { $0.isEnabled = true}
        contentRightWrapper.addSubview(contentTitleLabel)
        contentRightWrapper.addSubview(contentDetailLabel)
        
        root.yoga.applyLayout(preservingOrigin: true)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
