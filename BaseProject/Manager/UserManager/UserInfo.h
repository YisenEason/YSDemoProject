//
//  UserInfo.h
//  BaseProject
//
//  Created by eason yi on 2018/7/3.
//  Copyright © 2018年 eason. All rights reserved.
//

#import "BaseModel.h"

@interface UserInfo : BaseModel

//账号
@property(nonatomic,strong) NSString *account;
//昵称
@property(nonatomic,strong) NSString *name;
//头像
@property(nonatomic,strong) NSString *avatar;
@property(nonatomic,strong) NSData *avatarData;
//服务器登录判断标识
@property(nonatomic,strong) NSString *token;

@end
