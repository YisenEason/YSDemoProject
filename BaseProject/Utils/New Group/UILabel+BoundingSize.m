//
//  UILabel+BoundingSize.m
//  获取Label尺寸大小
//
//  Created by eason yi on 2018/9/5.
//  Copyright © 2018年 eason. All rights reserved.
//

#import "UILabel+BoundingSize.h"

@implementation UILabel (BoundingSize)

- (CGSize)boundingRectWithSize:(CGSize)size {
    
    NSDictionary *attribute = @{NSFontAttributeName: self.font};
    
    CGSize retSize = [self.text boundingRectWithSize:size
                                             options:\
                      NSStringDrawingTruncatesLastVisibleLine |
                      NSStringDrawingUsesLineFragmentOrigin |
                      NSStringDrawingUsesFontLeading
                                          attributes:attribute
                                             context:nil].size;
    
    return retSize;
}

@end
