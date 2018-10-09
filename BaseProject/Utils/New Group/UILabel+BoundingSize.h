//
//  UILabel+BoundingSize.h
//  获取Label尺寸大小
//
//  Created by eason yi on 2018/9/5.
//  Copyright © 2018年 eason. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (BoundingSize)

// 计算Label内容大小
- (CGSize)boundingRectWithSize:(CGSize)size;

@end
