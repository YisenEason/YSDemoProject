//
//  InterestCollectView.m
//  BaseProject
//
//  Created by eason yi on 2018/10/10.
//  Copyright © 2018年 eason. All rights reserved.
//

#import "InterestCollectView.h"
#import "InterestCollectionViewCell.h"
#import "InterestModel.h"

@implementation InterestCollectView 

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame Data:(NSString *)data{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor redColor];
        [self addSubview:self.collectView];
        self.isAllowSelect = NO;
        [self updateSelectedDatas];
    }
    return self;
}

-(UICollectionView *)collectView {
    if (_collectView == nil) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        //设置item
        flowLayout.itemSize=CGSizeMake(YS_AdapterSize(102), YS_AdapterSize(51));
        //设置内边距
        flowLayout.sectionInset = UIEdgeInsetsMake(YS_AdapterSize(30), YS_AdapterSize(30), YS_AdapterSize(30), YS_AdapterSize(30));
        //设置行间距
        flowLayout.minimumLineSpacing = YS_AdapterSize(30);
        //设置每个item之间的间距
        flowLayout.minimumInteritemSpacing = YS_AdapterSize(4);
        _collectView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) collectionViewLayout:flowLayout];
        _collectView.delegate = self;
        _collectView.dataSource = self;
        _collectView.backgroundColor = [UIColor yellowColor];
        [_collectView registerClass:[InterestCollectionViewCell class] forCellWithReuseIdentifier:@"aa"];
    }
    return _collectView;
}

-(NSMutableArray *)datas {
    if (_datas == nil) {
        _datas = [[NSMutableArray alloc]init];
    }
    return _datas;
}

-(NSMutableArray *)selectedDatas {
    if (_selectedDatas == nil) {
        _selectedDatas = [[NSMutableArray alloc]init];
    }
    return _selectedDatas;
}

//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.datas.count;
}
//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}
//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    InterestCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"aa" forIndexPath:indexPath];
    InterestModel *model = self.datas[indexPath.row];
    cell.name.text = [NSString stringWithFormat:@"%@",model.name];
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:model.image]];
    [cell setSelectStatus:model.isSelect];
    return cell;
}
//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    //判断是否允许选中
    if (!self.isAllowSelect) {
        return;
    }
//    InterestCollectionViewCell * cell = (InterestCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    InterestModel *model = self.datas[indexPath.row];
    model.isSelect = !model.isSelect;
    [collectionView reloadData];
    [self updateSelectedDatas];
}
//返回这个UICollectionView是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void) updateSelectedDatas {
    [self.selectedDatas removeAllObjects];
    for (int i=0; i<self.datas.count; i++) {
        InterestModel *model = self.datas[i];
        if (model.isSelect) {
            [self.selectedDatas addObject:model];
        }
    }
    NSLog(@"selectedDatas size : %lu", (unsigned long)self.selectedDatas.count);
}

@end
