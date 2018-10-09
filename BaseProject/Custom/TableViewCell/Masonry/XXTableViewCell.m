//
//  XXTableViewCell.m
//  BaseProject
//
//  Created by eason yi on 2018/8/31.
//  Copyright © 2018年 eason. All rights reserved.
//

#import "XXTableViewCell.h"
#import "UILabel+BoundingSize.h"
#import <Masonry.h>

@implementation XXTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *ID = @"cellID";
    XXTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[XXTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initWithView];
    }
    return self;
}

// 在这个方法里面添加各种控件,但是不要在这个方法里面设置控件的尺寸大小
- (void)initWithView {
    self.name = [[UILabel alloc] init];
    [self.contentView addSubview:self.name];
}

// 在这个方法里面设置尺寸大小
- (void)layoutSubviews {
    [super layoutSubviews];
    [self.name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).with.offset(20);
        make.right.top.bottom.mas_equalTo(self.contentView);
    }];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
