//
//  COResultListView.m
//  CoMoBicycle
//
//  Created by 金玉衡 on 16/11/9.
//  Copyright © 2016年 AutoMo. All rights reserved.
//

#import "COResultListView.h"
#import "COCollectionViewCell.h"

@interface COResultListView() <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
{
    NSString *strReuser;
    NSArray *resultArray;
}


@property (nonatomic, strong) UILabel *titleLable;
@property (nonatomic, strong) UICollectionView *collectionView;


@end

COResultListView *resultListView =nil;


@implementation COResultListView


- (instancetype)initWithArrayData:(NSArray *)resultData
{
    self = [super init];
    if(self)
    {
        self.backgroundColor = backGroundColor;
        resultArray = [resultData mutableCopy];
        
        [self addSubview:self.titleLable];
        [self addSubview:self.collectionView];
        [self addUIConstraints];
        
        [[UIApplication sharedApplication].keyWindow addSubview:self];
    }
    
    return self;
}

#pragma mark ui layout

- (void)addUIConstraints
{
    [self.titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.top.right.equalTo(self);
        make.height.mas_equalTo(30);
    }];
    
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.bottom.equalTo(self);
        make.top.equalTo(_titleLable.mas_bottom);
        
    }];
}

#pragma mark lazy load

- (UILabel *)titleLable
{
    if(_titleLable == nil)
    {
        _titleLable = [[UILabel alloc] init];
        
        _titleLable.textColor = [UIColor blackColor];
        _titleLable.font = [UIFont systemFontOfSize:14.0];
        _titleLable.textAlignment = NSTextAlignmentCenter;
    }
    
    return _titleLable;
}

- (UICollectionView *)collectionView
{
    if(_collectionView == nil)
    {
        UICollectionViewFlowLayout *flowlayout = [[UICollectionViewFlowLayout alloc] init];
        
        [flowlayout setScrollDirection:UICollectionViewScrollDirectionVertical];
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowlayout];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.backgroundColor = [UIColor clearColor];
        
        strReuser = @"CollectionViewCell";
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:strReuser];
        
    }
    
    return _collectionView;
}


#pragma mark UICollectionDatasource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [resultArray count];
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    COCollectionViewCell *collectionCell = [collectionView dequeueReusableCellWithReuseIdentifier:strReuser forIndexPath:indexPath];
    
    COResultInfo *resultInfo = [resultArray objectAtIndex:[indexPath row]];
    
    [collectionCell configWithDataModel:resultInfo];

    
    return collectionCell;
}

#pragma mark --UICollectionViewDelegateFlowLayout

//定义每个Item 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(MAX_WIDTH, (MAX_HEIGHT/2.5)/3);
}


#pragma mark member function

+(void)showViewWithArray:(NSArray *)resultinfoArray;
{
    resultListView = [[COResultListView alloc] initWithArrayData:resultinfoArray];
    
    [UIView animateWithDuration:0.3 animations:^{
    
        resultListView.frame = CGRectMake(0, MAX_HEIGHT - MAX_HEIGHT/2.5, MAX_WIDTH, MAX_HEIGHT/2.5);
        
    }completion:^(BOOL finished) {
        
        
    }];
}


@end
