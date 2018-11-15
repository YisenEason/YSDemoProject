//
//  InterestCollectionViewCell.h
//  BaseProject
//
//  Created by eason yi on 2018/10/10.
//  Copyright © 2018年 eason. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InterestCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) UIView *selectView;

@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic, strong) UILabel *name;

- (void)setSelectStatus:(BOOL)isSelect;

@end
