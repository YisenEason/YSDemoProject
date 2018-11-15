//
//  CollectViewVC.m
//  BaseProject
//
//  Created by eason yi on 2018/10/10.
//  Copyright © 2018年 eason. All rights reserved.
//

#import "CollectViewVC.h"
#import "InterestCollectView.h"
#import "InterestModel.h"
#import "ViewControllerUtil.h"

@interface CollectViewVC ()

@end

@implementation CollectViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
//    if (@available(iOS 11.0, *)){
//        [[UIScrollView appearance] setContentInsetAdjustmentBehavior:UIScrollViewContentInsetAdjustmentNever];
//    }else{
//        self.automaticallyAdjustsScrollViewInsets = NO;
//    }
    NSLog(@"%f",YS_TopBarHeight);
    InterestCollectView *intestCollectView = [[InterestCollectView alloc]initWithFrame:CGRectMake(0, 100, YS_ScreenWidth, 300) Data:@""];
    [self.view addSubview:intestCollectView];
    
    NSMutableArray *datas = [[NSMutableArray alloc] init];
    for (int i=0; i<25; i++) {
        InterestModel *model = [[InterestModel alloc] init];
        model.name = [NSString stringWithFormat:@"%d", i];
        model.image = @"https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2094452097,1612784200&fm=27&gp=0.jpg";
        model.isSelect = (i/2==0)?YES:NO;
        [datas addObject:model];
    }
    intestCollectView.datas = datas;
    intestCollectView.isAllowSelect = YES;
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
