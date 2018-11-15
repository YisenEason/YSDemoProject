//
//  InterestCollectionViewCell.m
//  BaseProject
//
//  Created by eason yi on 2018/10/10.
//  Copyright © 2018年 eason. All rights reserved.
//

#import "InterestCollectionViewCell.h"

@implementation InterestCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.imageView];
        [self addSubview:self.selectView];
        [self addSubview:self.name];
        [self.name mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.mas_equalTo(self);
        }];
        [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.mas_equalTo(self);
            make.size.mas_equalTo(self);
        }];
        [self.selectView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(self.imageView);
        }];
    }
    return self;
}

- (UILabel *)name {
    if (_name == nil) {
        _name = [UILabel new];
        _name.textColor = [UIColor grayColor];
    }
    return _name;
}

- (UIImageView *)imageView {
    if (_imageView == nil) {
        _imageView = [UIImageView new];
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
        _imageView.layer.cornerRadius = 5.0f;
        _imageView.layer.masksToBounds = YES;
    }
    return _imageView;
}

- (UIView *)selectView {
    if (_selectView == nil) {
        _selectView = [UIView new];
        _selectView.layer.cornerRadius = 5.0f;
        _selectView.backgroundColor = [UIColor blueColor];
    }
    return _selectView;
}

- (void)setSelectStatus:(BOOL)isSelect {
    if (isSelect) {
        self.selectView.hidden = NO;
    }else {
        self.selectView.hidden = YES;
    }
}

@end
