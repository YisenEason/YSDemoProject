//
//  RSSManager.h
//  BaseProject
//
//  Created by eason yi on 2018/11/14.
//  Copyright © 2018年 eason. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IDNFeedParser.h"

@interface RSSManager : NSObject

/**
 单例，返回全局实例
 
 @return 全局实例
 */
+ (RSSManager *)shareRSSManager;

/**
 获取RSS中的文章列表
 
 @param url RSS源地址
 @param callback 代码块
 */
- (void)parserSourceInfoWithUrl:(NSString *)url callback:(void (^)(id result))callback;

/**
 获取RSS源信息
 
 @param url RSS源地址
 @param callback 代码块
 */
- (void)parserItemWithUrl:(NSString *)url callback:(void (^)(id result))callback;

@end
