//
//  YSAlertViewController.m
//  BaseProject
//
//  Created by eason yi on 2018/9/30.
//  Copyright © 2018年 eason. All rights reserved.
//

#import "YSAlertViewController.h"

@interface YSAlertViewController ()

@property (nonatomic, strong) UIButton *closeBtn;

@end

@implementation YSAlertViewController

#pragma mark - 构造方法
+ (instancetype) alertShow {
    YSAlertViewController *alertController = [[YSAlertViewController alloc] init];
    alertController.modalPresentationStyle = UIModalPresentationFullScreen;
    return alertController;
}

#pragma mark - 搭建UI
- (void)setupUI {
//    self.view.backgroundColor = [UIColor colorWithWhite:0.2 alpha:0.5];
//    [self.view addSubview:self.closeBtn];
//    [self.closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.view).with.offset(AdapterLength(16));
//        make.top.equalTo(self.view).with.offset(AdapterLength(24));
//        make.size.mas_equalTo(CGSizeMake(40, 40));
//    }];
}

#pragma mark - 懒加载
- (UIButton *)closeBtn {
    if (_closeBtn == nil) {
        _closeBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [_closeBtn setImage:[UIImage imageNamed:@"ic_remove_wh"] forState:UIControlStateNormal];
        [_closeBtn addTarget:self action:@selector(closeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _closeBtn;
}
- (void)closeBtnClick:(id)sender {
    NSLog(@"关闭");
    [self dismissViewControllerAnimated:NO completion:nil];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupUI];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
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
