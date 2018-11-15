//
//  NetWorkViewController.m
//  BaseProject
//
//  Created by eason yi on 2018/10/10.
//  Copyright © 2018年 eason. All rights reserved.
//

#import "NetWorkViewController.h"
#import "ResultModel.h"

@interface NetWorkViewController ()

@property (nonatomic,strong) UILabel *requestLabel;

@end

@implementation NetWorkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

    
    UIButton *getBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [getBtn setTitle:@"GET" forState:UIControlStateNormal];
    [getBtn addTarget:self action:@selector(GetBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:getBtn];
    [getBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(50+YS_TopBarHeight));
        make.left.equalTo(@(50));
    }];
    
    [self.view addSubview:self.requestLabel];
    [_requestLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        [self.view layoutIfNeeded];
        make.top.mas_equalTo(getBtn.mas_bottom).with.offset(30);
        make.left.mas_equalTo(self.view);
        make.right.mas_equalTo(self.view);
    }];
}

- (void)GetBtnAction:(id)sender {
    [[HUDManager shareHUDManager] showLoadingInView:self.view];
    WeakSelf(weakSelf)
    [[NetworkManager shareNetworkManager] GetWithUrl:@"http://api.apiopen.top/singlePoetry" parameters:nil modelClass:[ResultModel class] success:^(id result) {
        NSLog(@"%@", result);
        weakSelf.requestLabel.text = [result toJSONString];
        [[HUDManager shareHUDManager] hideLoadingInView:weakSelf.view];
    } failure:^(NSError *error, id result) {
        NSLog(@"%@", error);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UILabel *)requestLabel{
    if (_requestLabel == nil) {
        _requestLabel = [[UILabel alloc]init];
        _requestLabel.text = @"content";
        _requestLabel.numberOfLines = 0;
    }
    return _requestLabel;
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
