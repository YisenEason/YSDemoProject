//
//  YSTextField.m
//  BaseProject
//
//  Created by eason yi on 2018/9/27.
//  Copyright © 2018年 eason. All rights reserved.
//

#import "YSTextField.h"

@implementation YSTextField

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame placeholder:(NSString *)placeholder keyboardType:(UIKeyboardType)keyboardType{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.textField];
        self.textField.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
        self.textField.keyboardType = keyboardType;
        self.textField.placeholder = placeholder;
    }
    return self;
}

- (UITextField *)textField {
    if (!_textField) {
        _textField = [UITextField new];
        _textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _textField.borderStyle = UITextBorderStyleNone;
        _textField.backgroundColor = [UIColor whiteColor];
        _textField.returnKeyType = UIReturnKeyDone;
        _textField.textColor = [UIColor blackColor];
        _textField.delegate = self;
        // 左边占位符
        UIView *leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, YS_AdapterSize(20), 0)];
        _textField.leftView = leftView;
        _textField.leftViewMode = UITextFieldViewModeAlways;
    }
    return _textField;
}

@end
