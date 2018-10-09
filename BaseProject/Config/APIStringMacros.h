//
//  InterfaceURL.h
//  服务器接口相关URL
//
//  Created by eason yi on 2018/7/3.
//  Copyright © 2018年 eason. All rights reserved.
//

//接口名称相关,TODO:根据target自动匹配使用
#ifdef DEBUG
//Debug状态下的测试API
static NSString * const base_api = @"";

#else
//Release状态下的线上API
static NSString * const base_Api = @"";

#endif



// 项目中的接口URL路径常量

static NSString * const api_info = @"/api/info";
