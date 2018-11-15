//
//  InterestCollectView.h
//  BaseProject
//
//  Created by eason yi on 2018/10/10.
//  Copyright © 2018年 eason. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InterestCollectView : UIView <UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong) UICollectionView *collectView;
//数据源
@property (nonatomic,strong) NSMutableArray *datas;
//已选中的collection
@property (nonatomic,strong) NSMutableArray *selectedDatas;
//是否允许选中
@property (nonatomic) BOOL isAllowSelect;

- (instancetype)initWithFrame:(CGRect)frame Data:(NSString *)data;

@end
