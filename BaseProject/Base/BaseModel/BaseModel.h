//
//  BaseModel.h
//  BaseProject
//
//  Created by eason yi on 2018/7/3.
//  Copyright © 2018年 eason. All rights reserved.
//

#import <JSONModel.h>

@interface BaseModel : JSONModel

/* 添加每个地方都要用到的属性 比如id,等等属性, 直接以正常属性书写方式写在这里即可 */

@property (nonatomic,strong) NSString *dID;

- (instancetype)initWithDictionary:(NSDictionary *)dict;

- (NSString *)description;

@end
