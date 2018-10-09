//
//  XXTableViewCell.h
//  BaseProject
//
//  Created by eason yi on 2018/8/31.
//  Copyright © 2018年 eason. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XXTableViewCell : UITableViewCell

@property (nonatomic,strong) UILabel *name;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

- (CGFloat)getCellHeight;

@end
