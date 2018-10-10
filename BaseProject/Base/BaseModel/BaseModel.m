//
//  BaseModel.m
//  BaseProject
//
//  Created by eason yi on 2018/7/3.
//  Copyright © 2018年 eason. All rights reserved.
//

#import "BaseModel.h"
#import <objc/runtime.h>

@implementation BaseModel

+(JSONKeyMapper*)keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"id":@"_id",@"description":@"_description"}];
}

/* 所有属性都可以为空  */
+(BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    NSError *error = nil;
    self = [super initWithDictionary:dict error:&error];
    if (self) {
        self = [self initWithDictionary:dict error:&error];
    }
    return self;
}

@end
