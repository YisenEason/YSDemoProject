//
//  HUDManager.h
//  BaseProject
//
//  Created by eason yi on 2018/11/15.
//  Copyright © 2018年 eason. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MBProgressHUD.h>

@interface HUDManager : NSObject

/**
 单例，返回全局实例
 
 @return 全局实例
 */
+ (instancetype)shareHUDManager;

/**
 显示文本消息
 
 @param text 文本
 @param view 界面
 */
- (void)showMessage:(NSString *)text view: (UIView *)view;

/**
 显示加载框
 
 @param view 界面
 */
- (void)showLoadingInView:(UIView *)view;

/**
 隐藏加载框
 
 @param view 界面
 */
- (void)hideLoadingInView:(UIView *)view;

@end
