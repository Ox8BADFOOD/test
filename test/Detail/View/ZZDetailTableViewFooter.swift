//
//  ZZDetailTableViewFooter.swift
//  test
//
//  Created by Max on 2021/12/19.
//  Copyright © 2021 Max. All rights reserved.
//

import UIKit
import YogaKit

class ZZDetailTableViewFooter: UIView {
    lazy var mngSubscriptionView = ZZMngSubscriptionView()
    lazy var enhanceSubscription = ZZEnhanceSubscriptionView()
    lazy var customInsuranceBtn: UIButton = {
        let btn = UIButton.init(type: .custom)
        btn.backgroundColor = mainColor
        btn.setTitle("Customize your Insurance", for: .normal)
        btn.layer.cornerRadius = 5
        btn.clipsToBounds = true
        btn.titleLabel?.font = Title3Font
        return btn
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        root.ZZYogaLayout {
            $0.alignItems = .stretch
            $0.paddingTop = YGValue(25)
        }
        
        customInsuranceBtn.ZZYogaLayout {
            $0.width = YGValue(200)
            $0.height = YGValue(35)
            $0.alignSelf = .center
            $0.marginBottom = YGValue(25)
        }
        root.addSubview(customInsuranceBtn)
        root.addSubview(mngSubscriptionView)
        enhanceSubscription.configureLayout {
            $0.marginTop = YGValue(25)
        }
        root.addSubview(enhanceSubscription)
        
        root.yoga.applyLayout(preservingOrigin: true)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        root.yoga.markDirty()
        root.yoga.applyLayout(preservingOrigin: true)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
