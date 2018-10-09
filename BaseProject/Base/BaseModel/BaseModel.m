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

/* 所有属性都可以为空  */
+(BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}

+(JSONKeyMapper*)keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"dID":@"id"}];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    NSError *error = nil;
    self = [super initWithDictionary:dict error:&error];
    if (self) {
        self = [self initWithDictionary:dict error:&error];
    }
    return self;
}

/* 输出类的详情内容 */
- (NSString *)description {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    uint count;
    objc_property_t *properties = class_copyPropertyList([self class], &count);
    for (int i = 0; i < count; i++)
    {
        objc_property_t property = properties[i];
        NSString *name = @(property_getName(property));
        id value = [self valueForKey:name]?:@"nil";
        [dictionary setObject:value forKey:name];
    }
    
    free(properties);
    return [NSString stringWithFormat:@"<%@:%p> -- %@", [self class], self, dictionary];
}







@end
