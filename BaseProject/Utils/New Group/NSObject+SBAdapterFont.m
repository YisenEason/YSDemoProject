//
//  NSObject+FontCategory.m
//  Xib、Storyboard组件字体适配
//
//  Created by eason yi on 2018/9/26.
//  Copyright © 2018年 eason. All rights reserved.
//

#import "NSObject+SBAdapterFont.h"
#import <objc/runtime.h>

//UI设计原型图的手机尺寸宽度
#define UIFontRunTimeSize  375

@implementation NSObject (SBAdapterFont)

@end

@implementation UIButton (MyFont)

+ (void)load{
    Method imp = class_getInstanceMethod([self class], @selector(initWithCoder:));
    Method myImp = class_getInstanceMethod([self class], @selector(myInitWithCoder:));
    method_exchangeImplementations(imp, myImp);
}

- (id)myInitWithCoder:(NSCoder*)aDecode{
    [self myInitWithCoder:aDecode];
    if (self) {
        //部分不想改变字体的 把tag值设置成333跳过
        if(self.titleLabel.tag != 333){
            CGFloat fontSize = self.titleLabel.font.pointSize;
            //此处注意！不要用 fontWithName:或systemFontOfSize:创建新的字体，会再次调用UIfont的(UIFont+runtime)方法替换！
            self.titleLabel.font = [self.titleLabel.font fontWithSize:fontSize * [UIScreen mainScreen].bounds.size.width/UIFontRunTimeSize];
        }
    }
    return self;
}
@end

@implementation UILabel (MyFont)

+ (void)load{
    Method imp = class_getInstanceMethod([self class], @selector(initWithCoder:));
    Method myImp = class_getInstanceMethod([self class], @selector(myInitWithCoder:));
    method_exchangeImplementations(imp, myImp);
}

- (id)myInitWithCoder:(NSCoder*)aDecode{
    [self myInitWithCoder:aDecode];
    if (self) {
        //部分不想改变字体的 把tag值设置成333跳过
        if(self.tag != 333){
            CGFloat fontSize = self.font.pointSize;
            //此处注意！不要用 fontWithName:或systemFontOfSize:创建新的字体，会再次调用UIfont的(UIFont+runtime)方法替换！
            self.font = [self.font fontWithSize:fontSize * [UIScreen mainScreen].bounds.size.width/UIFontRunTimeSize];
        }
    }
    return self;
}
@end

@implementation UITextField (MyFont)

+ (void)load{
    Method imp = class_getInstanceMethod([self class], @selector(initWithCoder:));
    Method myImp = class_getInstanceMethod([self class], @selector(myInitWithCoder:));
    method_exchangeImplementations(imp, myImp);
}

- (id)myInitWithCoder:(NSCoder*)aDecode{
    [self myInitWithCoder:aDecode];
    if (self) {
        //部分不想改变字体的 把tag值设置成333跳过
        if(self.tag != 333){
            CGFloat fontSize = self.font.pointSize;
            //此处注意不要用 fontWithName:或systemFontOfSize:创建新的字体，会再次调用UIfont的(UIFont+runtime)方法替换！
            self.font = [self.font fontWithSize:fontSize * [UIScreen mainScreen].bounds.size.width/UIFontRunTimeSize];
        }
    }
    return self;
}
@end

@implementation UITextView (MyFont)

+ (void)load{
    Method imp = class_getInstanceMethod([self class], @selector(initWithCoder:));
    Method myImp = class_getInstanceMethod([self class], @selector(myInitWithCoder:));
    method_exchangeImplementations(imp, myImp);
}
- (id)myInitWithCoder:(NSCoder*)aDecode{
    [self myInitWithCoder:aDecode];
    if (self) {
        //部分不想改变字体的 把tag值设置成333跳过
        if(self.tag != 333){
            CGFloat fontSize = self.font.pointSize;
            //此处注意不要用 fontWithName:或systemFontOfSize:创建新的字体，会再次调用UIfont的(UIFont+runtime)方法替换！
            self.font = [self.font fontWithSize:fontSize * [UIScreen mainScreen].bounds.size.width/UIFontRunTimeSize];
        }
    }
    return self;
}
@end
