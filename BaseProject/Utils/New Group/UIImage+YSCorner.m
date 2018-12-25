//
//  UIImage+YSCorner.m
//  YSCustomAlertView
//
//  Created by eason yi on 2018/12/25.
//  Copyright © 2018年 eason. All rights reserved.
//

#import "UIImage+YSCorner.h"

@implementation UIImage (YSCorner)

/**
 描述：使用UIBezierPath绘制图片圆角，对内存的消耗少，渲染快

 @param rect 设置image图片的ImageView的Rect
 @param cornerRadius 圆角弧度
 @return 返回圆角图片
 */
- (UIImage *)drawCornerInRect:(CGRect)rect cornerRadius:(CGFloat)cornerRadius
{
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:cornerRadius];
    UIGraphicsBeginImageContextWithOptions(rect.size, false, [UIScreen mainScreen].scale);
    CGContextAddPath(UIGraphicsGetCurrentContext(), bezierPath.CGPath);
    CGContextClip(UIGraphicsGetCurrentContext());
    [self drawInRect:rect];
    
    CGContextDrawPath(UIGraphicsGetCurrentContext(), kCGPathFillStroke);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
