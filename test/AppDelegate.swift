//
//  AppDelegate.swift
//  test
//
//  Created by Max on 2021/12/19.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        _ = ZZAppConfiguration.zz_sharedInstance()
        window = UIWindow.init(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.rootViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateInitialViewController()
        window?.makeKeyAndVisible()
        return true
    }



}

