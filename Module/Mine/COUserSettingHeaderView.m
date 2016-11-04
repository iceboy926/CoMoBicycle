//
//  COUserSettingHeaderView.m
//  CoMoBicycle
//
//  Created by 金玉衡 on 16/11/3.
//  Copyright © 2016年 AutoMo. All rights reserved.
//

#import "COUserSettingHeaderView.h"

@interface COUserSettingHeaderView()

@property (nonatomic, strong)UIImageView *headImage;
@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, strong)UILabel *descriptLabel;

@end

@implementation COUserSettingHeaderView

- (instancetype)init
{
    self = [super init];
    if(self)
    {
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"blurred_background"]];
        
        [self addSubview:self.headImage];
        [self addSubview:self.titleLabel];
        [self addSubview:self.descriptLabel];
        
        [self addUIConstriants];
        
    }
    
    return self;
}

#pragma mark ui layout

- (void)addUIConstriants
{
    [self.headImage mas_makeConstraints:^(MASConstraintMaker *make) {
        
        
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        
    }];
    
    [self.descriptLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        
    }];
}

#pragma mark lazy load

- (UIImageView *)headImage
{
    if(_headImage == nil)
    {
        _headImage = [[UIImageView alloc] init];
        
    }
    return _headImage;
}

- (UILabel *)titleLabel
{
    if(_titleLabel == nil)
    {
        _titleLabel = [[UILabel alloc] init];
        
        _titleLabel.text = @"";
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.font = [UIFont systemFontOfSize:18.0];
        _titleLabel.backgroundColor = [UIColor whiteColor];
        
    }
    
    return _titleLabel;
}

- (UILabel *)descriptLabel
{
    if(_descriptLabel == nil)
    {
        _descriptLabel = [[UILabel alloc] init];
        _descriptLabel.textColor = [UIColor whiteColor];
        _descriptLabel.text = @"";
        _descriptLabel.font = [UIFont systemFontOfSize:16.0];
        _descriptLabel.numberOfLines = 0;
    }
    
    return _descriptLabel;
}

@end
