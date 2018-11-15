//
//  RSSManager.m
//  BaseProject
//
//  Created by eason yi on 2018/11/14.
//  Copyright © 2018年 eason. All rights reserved.
//

#import "RSSManager.h"

@implementation RSSManager

static RSSManager *_instance;


+ (instancetype)shareRSSManager {
    //调用dispatch_once保证在多线程中也只被实例化一次
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[RSSManager alloc] init];
    });
    return _instance;
}

- (id)init {
    self = [super init];
    if (self) {}
    return self;
}


- (void)parserItemWithUrl:(NSString *)url callback:(void (^)(id result))callback {
    // 异步操作，避免解析过程阻塞UI线程导致卡顿
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        // 解析
        NSArray* items = [IDNFeedParser feedItemsWithUrl:url];
        if (!items) {
            NSLog(@"获取RSS列表失败");
            callback(nil);
            return;
        }
        NSLog(@"获取RSS列表成功");
        // 解析完成后在主线程执行回调
        dispatch_async(dispatch_get_main_queue(), ^{
            // 回调
            if (callback) {
                callback(items);
            }
        });
    });
}

- (void)parserSourceInfoWithUrl:(NSString *)url callback:(void (^)(id result))callback {
    // 异步操作，避免解析过程阻塞UI线程导致卡顿
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        // 解析
        IDNFeedInfo* info = [IDNFeedParser feedInfoWithUrl:url];
        if (!info) {
            NSLog(@"读取RSS源信息失败");
            callback(nil);
            return;
        }
        NSLog(@"读取RSS源信息成功");
        // 解析完成后在主线程执行回调
        dispatch_async(dispatch_get_main_queue(), ^{
            // 回调
            if (callback) {
                callback(info);
            }
        });
    });
}

@end
