//
//  UIView+YSExtension.m
//  YSCustomAlertView
//
//  Created by eason yi on 2018/12/25.
//  Copyright © 2018年 eason. All rights reserved.
//

#import "UIView+YSShadow.h"

@implementation UIView (YSShadow)


/**
 
 描述：为View或者View的子类增加阴影.
 
 //    使用实例
 //    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
 //    view.backgroundColor = [UIColor blueColor];
 //    view.layer.shadowColor = [UIColor redColor].CGColor;
 //    view.layer.shadowOpacity = 0.8f;
 //    view.layer.shadowOffset = CGSizeMake(3, 3);
 //    view.layer.shadowRadius = 5.f;
 //    [view setShadowByBezierPathWithRoundedRect:view.bounds cornerRadius:0];
 
 @param rect 需要设置阴影的View的Rect
 @param cornerRadius 阴影圆角
 */
- (void) setShadowByBezierPathWithRoundedRect:(CGRect)rect cornerRadius:(CGFloat)cornerRadius {
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:cornerRadius];
    self.layer.shadowPath = path.CGPath;
}

@end
