//
//  AppMacros.h
//  宏定义
//
//  Created by eason yi on 2018/7/4.
//  Copyright © 2018年 eason. All rights reserved.
//

//用户登录状态标识定义
#define USER_LOGIN_STATUS @"user_login_status"
//用户数据存放标识定义
#define USER_INFO_DATA @"user_info_data"

#ifdef DEBUG    // 调试状态, 打开LOG功能
#define NSLog(...) NSLog(__VA_ARGS__)
#else           // 发布状态, 关闭LOG功能
#define NSLog(...) {}
#endif

#define WeakSelf(weakSelf)      __weak __typeof(&*self)    weakSelf  = self;
#define StrongSelf(strongSelf)  __strong __typeof(&*self) strongSelf = weakSelf;

// iPhoneX/iPhoneXS
#define isIphoneX_XS        (YS_ScreenWidth == 375.f && YS_ScreenHeight == 812.f ? YES : NO)
//iPhoneXR/iPhoneXSMax
#define isIphoneXR_XSMax    (YS_ScreenWidth == 414.f && YS_ScreenHeight == 896.f ? YES : NO)
//异性全面屏
#define isFullScreen        (isIphoneX_XS || isIphoneXR_XSMax)

//屏幕相关参数定义
#define YS_ScreenRect       [UIScreen mainScreen].bounds
#define YS_ScreenWidth      [UIScreen mainScreen].bounds.size.width
#define YS_ScreenHeight     [UIScreen mainScreen].bounds.size.height

#define YS_StatusBarHeight      [[UIApplication sharedApplication] statusBarFrame].size.height
#define YS_NavBarHeight         44.0
#define YS_TopBarHeight         (YS_StatusBarHeight + YS_NavBarHeight)
#define YS_BottomHomeBarHeight  (isFullScreen ? 34.0 : 0)
#define YS_ContentHeight        (YS_ScreenHeight - YS_TopBarHeight - YS_BottomHomeBarHeight)

//比例适配,375为UI效果图宽度
#define YS_scale            (YS_ScreenWidth/375.0)
#define YS_AdapterSize(x)   (x*YS_scale)

//延迟0秒
#define DISPATCH_AFTERZERO_BLOCK(afterBlock) dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.f * NSEC_PER_SEC)), dispatch_get_main_queue(), afterBlock)

//GCD - 一次性执行
#define YS_DISPATCH_ONCE_BLOCK(onceBlock) static dispatch_once_t onceToken; dispatch_once(&onceToken, onceBlock);
//GCD - 在Main线程上运行
#define YS_DISPATCH_MAIN_THREAD(mainQueueBlock) dispatch_async(dispatch_get_main_queue(), mainQueueBlock);
//GCD - 开启异步线程
#define YS_DISPATCH_GLOBAL_QUEUE_DEFAULT(globalQueueBlock) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), globalQueueBlocl);



