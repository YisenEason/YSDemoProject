//
//  UIImage+YSExtend.m
//  BaseProject
//
//  Created by eason yi on 2018/10/16.
//  Copyright © 2018年 eason. All rights reserved.
//

#import "UIImage+YSExtend.h"

@implementation UIImage (YSExtend)

- (UIImage *)drawRectWithRoundedCorner:(CGRect)rect Radius:(float)radius {
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:radius];
    UIGraphicsBeginImageContextWithOptions(rect.size, false, [UIScreen mainScreen].scale);
    CGContextAddPath(UIGraphicsGetCurrentContext(), bezierPath.CGPath);
    CGContextClip(UIGraphicsGetCurrentContext());
    [self drawInRect:rect];
    
    CGContextDrawPath(UIGraphicsGetCurrentContext(), kCGPathFillStroke);
    UIImage *output = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return output;
}

@end
