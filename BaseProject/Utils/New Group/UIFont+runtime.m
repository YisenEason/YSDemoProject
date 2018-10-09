//
//  UIFont+runtime.m
//  纯代码字体适配
//
//  Created by eason yi on 2018/9/26.
//  Copyright © 2018年 eason. All rights reserved.
//

#import "UIFont+runtime.h"
#import <objc/runtime.h>

//UI设计原型图的尺寸宽度
#define UIFontRunTimeSize  375

@implementation UIFont (runtime)

+ (void)load {
    Method newMethodBysystemFontOfSize = class_getClassMethod([self class], @selector(ys_systemFontOfSize:));
    Method methodBysystemFontOfSize = class_getClassMethod([self class], @selector(systemFontOfSize:));
    method_exchangeImplementations(newMethodBysystemFontOfSize, methodBysystemFontOfSize);
    
    Method newMethodByboldSystemFontOfSize = class_getClassMethod([self class], @selector(ys_boldSystemFontOfSize:));
    Method methodByboldSystemFontOfSize = class_getClassMethod([self class], @selector(boldSystemFontOfSize:));
    method_exchangeImplementations(newMethodByboldSystemFontOfSize, methodByboldSystemFontOfSize);
}

+ (UIFont *)ys_systemFontOfSize:(CGFloat)fontSize {
    return [UIFont ys_systemFontOfSize:fontSize * [UIScreen mainScreen].bounds.size.width/UIFontRunTimeSize];
}

+ (UIFont *)ys_boldSystemFontOfSize:(CGFloat)fontSize {
    return [UIFont ys_boldSystemFontOfSize:fontSize * [UIScreen mainScreen].bounds.size.width/UIFontRunTimeSize];
}

@end
