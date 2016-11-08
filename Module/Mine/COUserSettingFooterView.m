//
//  COUserSettingFooterView.m
//  CoMoBicycle
//
//  Created by 金玉衡 on 16/11/4.
//  Copyright © 2016年 AutoMo. All rights reserved.
//

#import "COUserSettingFooterView.h"

@interface COUserSettingFooterView()

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation COUserSettingFooterView

- (instancetype)init
{
    self = [super init];
    if(self)
    {
        self.backgroundColor = backGroundColor;
        
        [self addSubview:self.imageView];
        
        [self addUIConstraints];
    }
    
    return self;
}

#pragma mark ui layout

- (void)addUIConstraints
{
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.equalTo(self);
        
    }];
}

#pragma mark lazy load

- (UIImageView *)imageView
{
    if(_imageView == nil)
    {
        _imageView = [[UIImageView alloc] init];
        
        _imageView.image = [[UIImage imageNamed:@"placeholder_60x60"] resizableImageWithCapInsets:UIEdgeInsetsMake(5, 5, 5, 5)];
    }
    
    return _imageView;
}

@end
