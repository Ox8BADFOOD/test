//
//  ZZMngSubscriptionView.swift
//  test
//
//  Created by Max on 2021/12/19.
//  Copyright © 2021 Max. All rights reserved.
//

import UIKit
import YogaKit

class ZZMngSubscriptionItemView:UIView{
    lazy var imgView: UIImageView = {
        let v = UIImageView()
        return v
    }()
    
    lazy var textLable: UILabel = {
        let l = UILabel()
        l.textColor = .white
        l.font = DetailFont
        return l
    }()
    
    init(img: UIImage, text: String, color:UIColor) {
        super.init(frame: .zero)
        backgroundColor = color
        layer.cornerRadius = 12
        clipsToBounds = true
        imgView.image = img
        textLable.text = text
        
        root.configureLayout {
            $0.isEnabled = true
            $0.justifyContent = .center
            $0.alignItems = .center
            $0.aspectRatio = 100.0/85.0
            $0.width = 80
        }
        
        imgView.configureLayout {
            $0.isEnabled = true
            $0.width = YGValue(30)
            $0.height = YGValue(30)
            $0.marginBottom = YGValue(5)
        }
        root.addSubview(imgView)
        textLable.configureLayout {
            $0.isEnabled = true
        }
        root.addSubview(textLable)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

public class ZZMngSubscriptionView: UIView {
    var items = [
        ("phone","Get Help",mainColor!),
        ("docs","View Docs",zz_RGBHex(0x517EC6)!),
        ("pay","Payments",zz_RGBHex(0x517EC6)!),
        ("cancel","Cancel Sub",zz_RGBHex(0xEB6060)!),
    ]
    var itemArr: [ZZMngSubscriptionItemView] = []
    lazy var itemsWrapperView = UIView()
    lazy var titleLabel: UILabel = {
        let l = UILabel()
        l.text = "Manage your subscription"
        l.textColor = textColorHeavy
        l.font = Title1Font
        return l
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
//        backgroundColor = .red
        root.ZZYogaLayout {
            $0.alignItems = .center
//            $0.height = YGValue(85)
//            $0.width = YGValue(SCREEN_W())
        }
        titleLabel.ZZYogaLayout {
            $0.maxWidth = YGValue(value: 90, unit: .percent)
            $0.marginBottom = YGValue(15)
        }
        titleLabel.sizeToFit()
        root.addSubview(titleLabel)
        
        itemsWrapperView.ZZYogaLayout {
            $0.flexDirection = .row
            $0.alignSelf = .stretch
            $0.justifyContent = .center
            $0.alignItems = .center
        }
        
        var index:Int = 0

        itemArr = items.compactMap { (imgName, text, bgcHex) -> ZZMngSubscriptionItemView? in
            guard let img = UIImage(named: imgName) else {return nil}
            let h = ZZMngSubscriptionItemView(img:img , text: text, color: bgcHex)
            if index != (items.count - 1){
                h.configureLayout {
                    $0.marginRight = YGValue(10)
                }
            }
            itemsWrapperView.addSubview(h)
            index = index + 1
            return h
        }
        
        root.addSubview(itemsWrapperView)
        root.yoga.applyLayout(preservingOrigin: true)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
