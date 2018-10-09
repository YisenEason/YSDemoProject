//
//  TestModule.m
//  BaseProject
//
//  Created by eason yi on 2018/7/4.
//  Copyright © 2018年 eason. All rights reserved.
//

#import "FRDNetworkingModule.h"

@implementation FRDNetworkingModule

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSLog(@"网络请求配置: http://www.kuaidi100.com/");
    
    [XMCenter setupConfig:^(XMConfig * _Nonnull config) {
        config.generalServer = @"http://v.juhe.cn/";
        config.generalHeaders = @{@"Content-Type":@"application/json"
                                  };
        config.generalUserInfo = nil;
        config.callbackQueue = dispatch_get_main_queue();
        config.engine = [XMEngine sharedEngine];
#ifdef DEBUG
        config.consoleLog = YES;
#endif
    }];
    
    //当请求成功结束时，这个 Block 会在 success block 被执行前调用，如果传入 *error 参数被赋值，则接下来会执行 failure block
    [XMCenter setResponseProcessBlock:^id(XMRequest *request, id responseObject, NSError *__autoreleasing *error) {
        NSInteger status = [responseObject[@"status"] integerValue];
        if (status!=0) {
            *error = [[NSError alloc] initWithDomain:@"api return error" code:status userInfo:nil];
        }
        return nil; // or return a new object to reset value for responseObject
    }];
    
    //可对全局网络请求的错误做统一的过滤处理
    [XMCenter setErrorProcessBlock:^(XMRequest *request, NSError *__autoreleasing * error) {
        // 比如对不同的错误码统一错误提示等
        long int errorCode = [(*error).userInfo[@"com.alamofire.serialization.response.error.response"] statusCode];
        
        switch (errorCode) {
            case 0:{
                dispatch_async(dispatch_get_main_queue(), ^{
                    [SVProgressHUD showInfoWithStatus:@"访问超时，请稍后再试."];
                });
                break;
            }
            case 401:{
                dispatch_async(dispatch_get_main_queue(), ^{
                    [SVProgressHUD showInfoWithStatus:@"没有权限访问，请联系管理员."];
                });
                break;
            }
            case 500:{
                dispatch_async(dispatch_get_main_queue(), ^{
                    [SVProgressHUD showErrorWithStatus:@"服务器响应失败，请联系管理员."];
                });
                break;
            }
            case 502:{
                dispatch_async(dispatch_get_main_queue(), ^{
                    [SVProgressHUD showErrorWithStatus:@"服务器响应失败，请联系管理员."];
                });
                break;
            }
                
            default:
                break;
        }
        
    }];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {}

- (void)applicationDidEnterBackground:(UIApplication *)application {}

- (void)applicationWillEnterForeground:(UIApplication *)application {}

- (void)applicationDidBecomeActive:(UIApplication *)application {}

- (void)applicationWillTerminate:(UIApplication *)application {}

- (void)application:(UIApplication *)application
didReceiveRemoteNotification:(NSDictionary *)userInfo
fetchCompletionHandler:(void (^)(UIBackgroundFetchResult result))completionHandler {}

@end
