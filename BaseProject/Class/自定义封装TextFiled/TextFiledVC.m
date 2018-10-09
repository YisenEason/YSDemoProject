//
//  TextFiledVC.m
//  BaseProject
//
//  Created by eason yi on 2018/9/30.
//  Copyright © 2018年 eason. All rights reserved.
//

#import "TextFiledVC.h"
#import "YSTextField.h"

@interface TextFiledVC ()

@end

@implementation TextFiledVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    YSTextField *textFiled = [[YSTextField alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width/2, 40) placeholder:@"placeholder" keyboardType:UIKeyboardTypeDefault];
    textFiled.textField.backgroundColor = [UIColor grayColor];
    [self.view addSubview:textFiled];
    [textFiled mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).with.offset(150);
        make.left.mas_equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(textFiled.frame.size.width, textFiled.frame.size.height));
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
