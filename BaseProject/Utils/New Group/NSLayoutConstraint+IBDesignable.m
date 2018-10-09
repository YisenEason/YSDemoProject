//
//  NSLayoutConstraint+IBDesignable.m
//  BaseProject
//
//  Created by eason yi on 2018/10/8.
//  Copyright © 2018年 eason. All rights reserved.
//

#import "NSLayoutConstraint+IBDesignable.h"

@implementation NSLayoutConstraint (IBDesignable)

-(void)setWidthScreen:(BOOL)widthScreen{
    if (widthScreen) {
        self.constant = YS_AdapterSize(self.constant);
    }else{
        self.constant = self.constant;
    }
}

-(BOOL)widthScreen{
    return self.widthScreen;
}

@end
