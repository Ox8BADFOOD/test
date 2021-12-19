//
//  ZZYoga.swift
//  ShareBeauty
//
//  Created by Max on 2021/12/15.
//

import UIKit
import YogaKit

public extension UIView {

    func ZZYogaLayout(block: ((YGLayout) -> ())?) {
        let customLayout:((YGLayout) -> ()) = { (layout) in
            layout.isEnabled = true
            block?(layout)
        }
        self.configureLayout(block: customLayout)
    }

}
