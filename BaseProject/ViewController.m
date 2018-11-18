//
//  ViewController.m
//  BaseProject
//
//  Created by eason yi on 2018/7/3.
//  Copyright © 2018年 eason. All rights reserved.
//

#import "ViewController.h"
#import "XXTableViewCell.h"
#import "TextFiledVC.h"
#import "LabelVC.h"
#import "CustomAlertVC.h"
#import "NetWorkViewController.h"
#import "YSAlertViewController.h"
#import "CollectViewVC.h"
#import "RSSManager.h"
#import "HUDManager.h"
#import "WebViewController.h"

@interface ViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
 
    [self.view addSubview:self.tableView];
}

#pragma mark - Lazy load
- (NSMutableArray*)dataArray {
    if (_dataArray == nil) {
        _dataArray = [[NSMutableArray alloc]initWithObjects:@"模态自定义弹窗",@"获取Label高度",@"自定义封装TextFiled",@"网络请求",@"Collection布局(3XN纵排)", nil];
    }
    return _dataArray;
}

- (UITableView*)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame: CGRectMake(0, YS_TopBarHeight, YS_ScreenWidth, YS_ContentHeight)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor grayColor];
    }
    return _tableView;
}

//#pragma mark - UITableViewDataSource , UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    XXTableViewCell *cell = [XXTableViewCell cellWithTableView:tableView];
    cell.name.text = [NSString stringWithFormat:@"%@",self.dataArray[indexPath.row]];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:{
            CustomAlertVC *vc = [[CustomAlertVC alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 1:{
            LabelVC *vc = [[LabelVC alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 2:{
            TextFiledVC *vc = [[TextFiledVC alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 3:{
            NetWorkViewController *vc = [[NetWorkViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 4:{
//            CollectViewVC *vc = [[CollectViewVC alloc] init];
//            [self.navigationController pushViewController:vc animated:YES];
            WebViewController *webView = [[WebViewController alloc] init];
            webView.url = @"https://www.douyu.com";
            [self.navigationController pushViewController:webView animated:YES];
            break;
        }
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
