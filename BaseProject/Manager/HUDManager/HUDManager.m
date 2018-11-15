//
//  HUDManager.m
//  BaseProject
//
//  Created by eason yi on 2018/11/15.
//  Copyright © 2018年 eason. All rights reserved.
//

#import "HUDManager.h"

@implementation HUDManager

static HUDManager *_instance;

+ (instancetype)shareHUDManager {
    //调用dispatch_once保证在多线程中也只被实例化一次
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[HUDManager alloc] init];
    });
    return _instance;
}

- (void)showMessage:(NSString *)text view: (UIView *)view {
    if (view == nil) {
        view = [[UIApplication sharedApplication] windows].firstObject;
    }
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.label.text = text;
    hud.label.numberOfLines = 0;
    [hud hideAnimated:YES afterDelay:3.f];
}

- (void)showLoadingInView:(UIView *)view {
    if (view == nil) {
        view = [[UIApplication sharedApplication] windows].firstObject;
    }
    [MBProgressHUD showHUDAddedTo:view animated:YES];
//    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
//    hud.backgroundView.style = MBProgressHUDBackgroundStyleSolidColor;
//    hud.backgroundView.color = [UIColor colorWithWhite:0.f alpha:0.1f];
}

- (void)hideLoadingInView:(UIView *)view {
    if (view == nil) {
        view = [[UIApplication sharedApplication] windows].firstObject;
    }
    dispatch_async(dispatch_get_main_queue(), ^{
        [MBProgressHUD hideHUDForView:view animated:YES];
    });
}

@end
