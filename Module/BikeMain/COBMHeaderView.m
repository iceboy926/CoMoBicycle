//
//  COBaseNavigationBar.m
//  CoMoBicycle
//
//  Created by 金玉衡 on 16/10/31.
//  Copyright © 2016年 AutoMo. All rights reserved.
//

#import "COBMHeaderView.h"

@interface COBMHeaderView()
{
    NSString *strTitle;
}

@property (nonatomic, strong) UIButton *leftSliderBtn;
@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation COBMHeaderView

- (instancetype)initWithTitle:(NSString *)title
{
    self = [super init];
    if(self)
    {
        self.backgroundColor = navigaterBarColor;
        
        strTitle = title;
        
        [self addSubview:self.leftSliderBtn];
        [self addSubview:self.titleLabel];
        
        [self addUIConstraints];
        
    }
    
    return self;
}


#pragma mark UI layout

- (void)addUIConstraints
{
    [self.leftSliderBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.top.bottom.equalTo(self).insets(UIEdgeInsetsMake(20, 0, 0, 0));
        make.width.mas_equalTo(44);
        
    }];
    
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(self);
        make.top.equalTo(_leftSliderBtn.mas_top);
        make.width.equalTo(self.mas_width).multipliedBy(0.3);
        make.bottom.equalTo(self.mas_bottom);
    }];

}


#pragma mark lazy load

- (UIButton *)leftSliderBtn
{
    if(_leftSliderBtn == nil)
    {
        _leftSliderBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        _leftSliderBtn.layer.borderColor = [UIColor whiteColor].CGColor;
        _leftSliderBtn.layer.borderWidth = 1.0;
        _leftSliderBtn.layer.cornerRadius = 20;
        _leftSliderBtn.layer.masksToBounds = YES;
        
        [_leftSliderBtn setImage:[UIImage imageNamed:@"goback"] forState:UIControlStateNormal];
        [_leftSliderBtn addTarget:self action:@selector(leftSlideBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _leftSliderBtn;
}

- (UILabel *)titleLabel
{
    if(_titleLabel == nil)
    {
        _titleLabel = [[UILabel alloc] init];
        
        _titleLabel.text = strTitle;
        _titleLabel.font = [UIFont systemFontOfSize:16.0];
        _titleLabel.textColor = customButtonColor;
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.adjustsFontSizeToFitWidth = YES;
    }
    
    return _titleLabel;
}

#pragma mark button-action

- (void)leftSlideBtnClicked:(id)sender
{

}


@end
