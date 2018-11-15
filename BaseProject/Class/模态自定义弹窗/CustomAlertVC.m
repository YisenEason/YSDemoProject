//
//  CustomAlertVC.m
//  BaseProject
//
//  Created by eason yi on 2018/9/30.
//  Copyright © 2018年 eason. All rights reserved.
//

#import "CustomAlertVC.h"
#import "YSAlertViewController.h"

@interface CustomAlertVC ()

@end

@implementation CustomAlertVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn setTitle:@"显示弹窗" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(show:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).with.offset(150);
    }];
}

- (void)show:(id)sender {
    NSLog(@"显示弹窗");
    
    YSAlertViewController *alert = [YSAlertViewController alertShow];
//    alert.modalPresentationStyle = UIModalPresentationOverCurrentContext;
//    alert.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self.navigationController presentViewController:alert animated:YES completion:nil];
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
