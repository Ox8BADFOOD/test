//
//  ZZCarInfoVIew.swift
//  test
//
//  Created by Max on 2021/12/19.
//  Copyright © 2021 Max. All rights reserved.
//

import UIKit
import YogaKit



class ZZCarInfoItem: UIView{
    enum ZZCarInfoItemType {
        case km
        case usage
    }

    lazy var valueLabel: UILabel = {
        let l = UILabel()
        l.font = Title0Font
        l.text = "0"
        l.textColor = mainColor
        l.ZZYogaLayout(block: nil)
        return l
    }()
    lazy var divide: UIView = {
        let d = UIView()
        d.ZZYogaLayout {
            $0.width = YGValue(5)
        }
        return d
    }()
    lazy var unitLabel: UILabel = {
        let l = UILabel()
        l.font = DetailFont
        l.textColor = mainColor
        l.ZZYogaLayout {
            $0.marginBottom = YGValue(4)
        }
        return l
    }()
    lazy var headWrapper: UIView = {
        let v = UIView()
        v.ZZYogaLayout {
            $0.flexDirection = .row
            $0.alignItems = .flexEnd
            $0.marginBottom = YGValue(8)
        }
        return v
    }()
    lazy var describeLabel: UILabel = {
        let l = UILabel()
        l.font = Title3Font
        l.textColor = textColorNormal
        l.ZZYogaLayout(block: nil)
        return l
    }()
    var type: ZZCarInfoItemType!
    init(type: ZZCarInfoItemType) {
        super.init(frame: .zero)
        self.type = type
        if type == .km {
            headWrapper.addSubview(valueLabel)
            headWrapper.addSubview(divide)
            headWrapper.addSubview(unitLabel)
            unitLabel.text = "km"
            describeLabel.text = "Driven this month"
        }else {
            headWrapper.addSubview(unitLabel)
            headWrapper.addSubview(divide)
            headWrapper.addSubview(valueLabel)
            unitLabel.text = "$"
            describeLabel.text = "Usage due this month"
        }


        root.ZZYogaLayout {
            $0.alignItems = .center
        }
        root.addSubview(headWrapper)
        root.addSubview(describeLabel)
        root.yoga.applyLayout(preservingOrigin: true)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class ZZCarInfoView: UIView {

    lazy var kmView: ZZCarInfoItem = {
       let k = ZZCarInfoItem.init(type: .km)
        k.ZZYogaLayout {
            $0.flex = 1
            $0.alignSelf = .stretch
        }
        return k
    }()
    
    lazy var divide: UIView = {
        let d = UIView()
        d.backgroundColor = cellDivideColor
        d.ZZYogaLayout {
            $0.width = YGValue(0.8)
            $0.alignSelf = .stretch
        }
        return d
    }()
    
    lazy var usageView:ZZCarInfoItem = {
        let k = ZZCarInfoItem.init(type: .usage)
         k.ZZYogaLayout {
             $0.flex = 1
             $0.alignSelf = .stretch
         }
         return k
    }()
    
    lazy var wrapper: UIView = {
        let w = UIView()
        w.ZZYogaLayout {
            $0.flexDirection = .row
            $0.alignSelf = .stretch
        }
        return w
    }()
    
    lazy var lastUpdateLabel: UILabel = {
        let l = UILabel()
        l.font = DetailFont
        l.textColor = textColorLight
        l.textAlignment = .center
        l.ZZYogaLayout {
            $0.marginTop = YGValue(15)
            $0.marginBottom = YGValue(20)
            $0.alignSelf = .stretch
        }
        l.text = " "
        return l
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        root.ZZYogaLayout {
            $0.alignItems = .center
        }
        wrapper.addSubview(kmView)
        wrapper.addSubview(divide)
        wrapper.addSubview(usageView)
        root.addSubview(wrapper)
        
        root.addSubview(lastUpdateLabel)
        root.yoga.applyLayout(preservingOrigin: true)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
