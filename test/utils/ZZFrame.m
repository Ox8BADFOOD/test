//
//  ZZFrame.m
//  ShareBeauty
//
//  Created by Max on 2021/1/11.
//

#import "ZZFrame.h"

CGFloat SCREEN_H(){
    return [UIScreen mainScreen].bounds.size.height;
}

CGFloat SCREEN_W(){
    return [UIScreen mainScreen].bounds.size.width;
};

bool is_X_like(void){
    BOOL isBangsScreen = NO;
    if (@available(iOS 11.0, *)) {
    UIWindow *window = [[UIApplication sharedApplication].windows firstObject];
    isBangsScreen = window.safeAreaInsets.bottom > 0;
    }
    return isBangsScreen;
}


CGFloat NAV_BAR_H(void){
    return 44;
};

CGFloat STATUS_BAR_H(void){
    CGFloat height;
    if (@available(iOS 13.0, *)) {
        height = [UIApplication sharedApplication].delegate.window.windowScene.statusBarManager.statusBarFrame.size.height;
    }else{
        height = [UIApplication sharedApplication].statusBarFrame.size.height;
//        return is_X_like() ? 44 : 20;
    }
    return height;
    
};

CGFloat NAV_STATUS_BAR_H(void){
    return NAV_BAR_H() + STATUS_BAR_H();
}

CGFloat TABBER_BAR_H(void){
    return is_X_like() ? 83 : 49;
};

CGFloat BOTTOM_PADDING(void){
    return is_X_like() ? 34 : 0;
}
