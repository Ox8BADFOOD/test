//
//  ZZAppConfiguration.swift
//  ShareBeauty
//
//  Created by Max on 2019/12/16.
//

import UIKit
import Aspects

/// app的默认配置
public protocol ZZAppConfig : AnyObject {
    // nav
    var navBarBackImg: UIImage? { get }
    var navBarBackgrondColor: UIColor {get}
    var navBarBottomLineHidden: Bool {get}
    var navBarTitleColor: UIColor {get}
    var navBarTitleFont: UIFont {get}
    var navBarTranslucent: Bool {get}
//    var hiddeBottomBarWhenPush: Bool {get}
//
    //  @objc   // vc
    var controllerBGColor: UIColor {get}
//
//    // table
    var resetSectionHeaderTopPadding : Bool {get}
    var emptyTableFootView: Bool {get}
    var tableViewSeparatorColor: UIColor {get}
    var tableViewSeparatorInset: UIEdgeInsets {get}
    //@objc 
//    // lable
    var mainFont: UIFont{get}
    var mainColor: UIColor{get}
}

extension ZZAppConfig{
    var tableViewSeparatorColor: UIColor{
        get{
            .groupTableViewBackground
        }
    }
    
    var tableViewSeparatorInset: UIEdgeInsets{
        get {
            .zero
        }
    }
    
    var navBarBackgrondColor: UIColor {
        get{
            .red
        }
    }
    var navBarBottomLineHidden: Bool {
        get{
            true
        }
    }
    var navBarTitleColor: UIColor {
        get{
            .black
        }
    }
    var navBarTitleFont: UIFont {
        get{
            .systemFont(ofSize: 18)
        }
    }
    var navBarTranslucent: Bool {
        get{
            false
        }
    }
    
    var controllerBGColor: UIColor{
        get{
            .green
        }
    }
    var resetSectionHeaderTopPadding : Bool {
        get{
            true
        }
    }
    var emptyTableFootView : Bool {
        get{
            true
        }
    }
    
    var mainFont: UIFont{
        get{
            .systemFont(ofSize: 15)
        }
    }
    var mainColor: UIColor{
        get{
            zz_RGBHex(0x999999)
        }
    }
}

internal class ZZAppConfiguration: NSObject, ZZSingleton{
    private override init() {
       super.init()
       // ...
       configUI()
   }
    
    static func zz_createSingleton() -> Any {
        return ZZAppConfiguration()
    }
}

/// UI配置
extension ZZAppConfiguration{
    func configUI(){
        // viewDidLoad
        let controllerObject = aspectsBlockWrapper { (value:AnyObject) in
             if value is UINavigationController{
                 self.customNavigationBar(nav: value as! UINavigationController)
            }else if value is UIViewController{
                
                self.customViewController(vc: value as! UIViewController)
//                if let nav = (value as! UIViewController).navigationController {
//                    self.customNavigationBar(nav: nav)
//                }
                
            }
            
            
        }
        do {
            try UIViewController.aspect_hook(#selector(UIViewController.viewDidLoad), with: AspectOptions.init(rawValue: 0), usingBlock: controllerObject)

        } catch {
            print(error)
        }
        
        // UIView.init(frame:) UIView.init(coder:) UIView.awakeFromNib
        let viewObject = aspectsBlockWrapper { (value:AnyObject) in
            if value is UITableView {
                self.customTableView(view: value as! UITableView)
            }else if value is UILabel {
                self.customLabel(label: value as! UILabel)
            }
        }
        do {
            try UIView.aspect_hook(#selector(UIView.init(frame:)), with: AspectOptions.init(rawValue: 0), usingBlock: viewObject)
            try UIView.aspect_hook(#selector(UIView.init(coder:)), with: AspectOptions.init(rawValue: 0), usingBlock: viewObject)
            try UIView.aspect_hook(#selector(UIView.awakeFromNib), with: AspectOptions.init(rawValue: 0), usingBlock: viewObject)

        } catch {
            print(error)
        }
        
    }
    
    func customNavigationBar(nav: UINavigationController){
        //背景颜色
        if #available(iOS 13.0, *) {
            let navBarAppearance = UINavigationBarAppearance()
            // 背景色
            navBarAppearance.backgroundColor = self.navBarBackgrondColor
            // 去掉半透明效果
            if !self.navBarTranslucent {
                navBarAppearance.backgroundEffect = nil
            }
            
            // 字体颜色
            navBarAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: self.navBarTitleColor, NSAttributedString.Key.font: self.navBarTitleFont]
            
            // 去除导航栏阴影（如果不设置clear，导航栏底下会有一条阴影线）
            if self.navBarBottomLineHidden {
                navBarAppearance.shadowColor = UIColor.clear
            }
            nav.navigationBar.scrollEdgeAppearance = navBarAppearance
            nav.navigationBar.standardAppearance = navBarAppearance
        }else {
            ////title 字体大小
            nav.navigationBar.titleTextAttributes = [
                .foregroundColor: self.navBarTitleColor,
                .font: self.navBarTitleFont
            ]
            if !self.navBarTranslucent {
                nav.navigationBar.isTranslucent = false
            }
            // 去除导航栏阴影（如果不设置clear，导航栏底下会有一条阴影线）
            if self.navBarBottomLineHidden {
                nav.navigationBar.shadowImage = UIImage()
            }
            nav.navigationBar.barTintColor = self.navBarBackgrondColor
            // 去除导航栏阴影（如果不设置clear，导航栏底下会有一条阴影线）
        }
    }
    
    func customLabel(label:UILabel) {
        label.textColor = mainColor
        label.font = mainFont
    }
    
    func customTableView(view:UITableView){
        if #available(iOS 15.0, *){
            if self.resetSectionHeaderTopPadding {
                view.sectionHeaderTopPadding = 0
            }
            
            if self.emptyTableFootView {
                view.tableFooterView = UIView()
            }
            view.separatorColor = self.tableViewSeparatorColor
            view.separatorInset = self.tableViewSeparatorInset
            
        }
    }
    
    func customViewController(vc: UIViewController){
        vc.view.backgroundColor = self.controllerBGColor
        if vc.navigationController?.viewControllers.count ?? 0 > 1{
            if let backImg = self.navBarBackImg{
                vc.navigationItem.leftBarButtonItem =  UIBarButtonItem.init(image: backImg, style: .plain, target: displayViewController().navigationController, action: #selector(UINavigationController.popViewController(animated:)))
            }
            
        }
        
    }
}
