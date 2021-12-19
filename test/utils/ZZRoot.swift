//
//  Root.swift
//  ShareBeauty
//  UI根节点
//  Created by Max on 2019/12/16.
//

import Foundation
import UIKit


extension UIView{
    
    var root: UIView {
        get{
            self
        }
    }
}

extension UIViewController{
    var root:UIView{
        get{
            self.view
        }
    }
}

extension UINavigationController{
    @objc var topRoot: UIView?{
        get{
            topViewController?.view
        }
    }
}

