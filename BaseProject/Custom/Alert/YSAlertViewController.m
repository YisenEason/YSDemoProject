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

@property (nonatomic, strong) UIView *contentView;

@end

@implementation YSAlertViewController

#pragma mark - 构造方法
+ (instancetype) alertShow {
    YSAlertViewController *alertController = [[YSAlertViewController alloc] init];
    alertController.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    alertController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    return alertController;
}

#pragma mark - 搭建UI
- (void)setupUI {
    self.view.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.7];
    [self.view addSubview:self.closeBtn];
    [self.closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).with.offset(YS_AdapterSize(16));
        make.top.equalTo(self.view).with.offset(YS_AdapterSize(5)+YS_StatusBarHeight);
        make.size.mas_equalTo(CGSizeMake(40, 40));
    }];
    
    [self.view addSubview:self.contentView];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(YS_AdapterSize(311)));
        make.height.equalTo(@(294));
        make.centerX.mas_equalTo(self.view);
        // 默认放在self.view下面
        make.centerY.mas_equalTo(self.view).with.offset(YS_ScreenHeight);
    }];
    //动画效果，向上移动
    [self performSelector:@selector(test) withObject:nil afterDelay:0.1f];
    
}

#pragma mark - 懒加载
- (UIButton *)closeBtn {
    if (_closeBtn == nil) {
        _closeBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        // 产生一张不会进行自动渲染的图片
        UIImage *tempImage = [UIImage imageNamed:@"ic_remove_wh"];
        UIImage *closeImage = [tempImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [_closeBtn setImage:closeImage forState:UIControlStateNormal];
        [_closeBtn addTarget:self action:@selector(closeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _closeBtn;
}

- (UIView *)contentView {
    if (_contentView == nil) {
        _contentView = [UIView new];
        _contentView.backgroundColor = [UIColor whiteColor];
    }
    return _contentView;
}

- (void)test {
    [self.contentView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.view).with.offset(YS_AdapterSize(50));
    }];
    [UIView animateWithDuration:0.5 animations:^{
        [self.view layoutIfNeeded];
    }];
}

#pragma mark - 事件
- (void)closeBtnClick:(id)sender {
    [self close];
}
- (void)close {
    [self dismissViewControllerAnimated:NO completion:nil];
}

#pragma mark - 系统
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 构建UI
    [self setupUI];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)dealloc {
    NSLog(@"弹窗销毁");
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
