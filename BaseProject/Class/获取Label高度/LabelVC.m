//
//  LabelVC.m
//  BaseProject
//
//  Created by eason yi on 2018/9/30.
//  Copyright © 2018年 eason. All rights reserved.
//

#import "LabelVC.h"
#import "UILabel+BoundingSize.h"

@interface LabelVC ()

@end

@implementation LabelVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 字符串
    NSString *str = @"北国风光，千里冰封，万里雪飘。望长城内外，惟余莽莽；大河上下，顿失滔滔。山舞银蛇，原驰蜡象，欲与天公试比高。须晴日，看红装素裹，分外妖娆。wfd dfsdf sdf sdfsdf dsf ds sdf ";
    // 初始化label
    UILabel *label = [UILabel new];
    label.backgroundColor = [UIColor redColor];
    label.text = str;
    label.font = [UIFont systemFontOfSize:18.0f];
    CGSize size = [label boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width, 0)];
    label.numberOfLines = 0;
    label.frame = CGRectMake(0.0f, 50.0f, size.width, size.height);
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).with.offset(150);
        make.left.mas_equalTo(self.view);
        make.right.mas_equalTo(self.view);
        make.height.equalTo(@(size.height+1));
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
