//
//  ZZMagicalDoor.m
//  ShareBeauty
//
//  Created by Max on 2019/12/16.
//

#import "ZZMagicalDoor.h"

UIViewController * displayViewController(){
    UIWindow *window = [UIApplication sharedApplication].windows.firstObject;
    //是否为当前显示的window
    if (window.windowLevel != UIWindowLevelNormal) {
        NSArray *windows = [UIApplication sharedApplication].windows;
        for (UIWindow *wd in windows) {
            if (wd.windowLevel == UIWindowLevelNormal) {
                window = wd;
                break;
            }
        }
    }
    UIViewController* vc = window.rootViewController;
    while (1) {
        if (vc.presentedViewController) {
            vc = vc.presentedViewController;
        }
        if ([vc isKindOfClass:[UITabBarController class]]) {
            vc = ((UITabBarController*)vc).selectedViewController;
        }
        if ([vc isKindOfClass:[UINavigationController class]]) {
            vc = ((UINavigationController*)vc).visibleViewController;
        }
        else{
            break;
        }
    }
    return vc;
}
