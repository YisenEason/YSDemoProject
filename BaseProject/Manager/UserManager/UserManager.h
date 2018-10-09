//
//  UserManager.h
//  用户管理类
//
//  Created by eason yi on 2018/7/3.
//  Copyright © 2018年 eason. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserInfo.h"

@interface UserManager : NSObject

@property(nonatomic,strong) UserInfo *userInfo;

//判断是否登录状态
+(BOOL)isLogin;

//保存用户数据
+(void)saveUserObject:(UserInfo *)userinfo;

//取出用户数据
+(UserInfo *)getUserInfo;

//用户退出登录
+(void)logOut;

@end
