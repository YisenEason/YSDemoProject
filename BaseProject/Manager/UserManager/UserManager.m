//
//  UserManager.m
//  BaseProject
//
//  Created by eason yi on 2018/7/3.
//  Copyright © 2018年 eason. All rights reserved.
//

#import "UserManager.h"

@implementation UserManager

+(BOOL)isLogin {
    BOOL loginStatus;
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSData *data = [userDefault objectForKey:USER_LOGIN_STATUS];
    if (data.length>0) {
        loginStatus = YES;
    }else {
        loginStatus = NO;
    }
    return loginStatus;
}

+(void)saveUserObject:(UserInfo *)userinfo {
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:userinfo];
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    [userDefault setObject:data forKey:USER_INFO_DATA];
    [userDefault setObject:@"1" forKey:USER_LOGIN_STATUS];
    [userDefault synchronize];
}

+(UserInfo *)getUserInfo {
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSData *data = [userDefault objectForKey:USER_INFO_DATA];
    return [NSKeyedUnarchiver unarchiveObjectWithData:data];
}

+(void)logOut {
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:USER_LOGIN_STATUS];
}

@end
