//
//  YSTextField.h
//  BaseProject
//
//  Created by eason yi on 2018/9/27.
//  Copyright © 2018年 eason. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YSTextField : UIView <UITextFieldDelegate>

- (instancetype)initWithFrame:(CGRect)frame placeholder:(NSString *)placeholder keyboardType:(UIKeyboardType)keyboardType;

@property (nonatomic,strong) UITextField *textField;

@end
