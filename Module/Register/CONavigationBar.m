//
//  CONavigationBar.m
//  CoMoBicycle
//
//  Created by 金玉衡 on 16/10/25.
//  Copyright © 2016年 AutoMo. All rights reserved.
//

#import "CONavigationBar.h"

@interface CONavigationBar()
{
    NSString *titleStr;
}

@property (nonatomic, strong) UIButton *backBtn;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *nextBtn;

@end

@implementation CONavigationBar

- (instancetype)initWithTitle:(NSString *)strTitle
{
    self = [super init];
    if(self)
    {
        self.backgroundColor = UIColorFromRGB(0x575757);
        
        titleStr = strTitle;
        
        [self addSubview:self.backBtn];
        [self addSubview:self.titleLabel];
        [self addSubview:self.nextBtn];
        
        [self addUIContraints];
    }
    
    return self;
}


#pragma mark ui layout

- (void)addUIContraints
{
    [self.backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.top.bottom.equalTo(self).insets(UIEdgeInsetsMake(20, 0, 0, 0));
        make.width.mas_equalTo(44);
        
    }];
    
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(self);
        make.top.equalTo(_backBtn.mas_top);
        make.width.equalTo(self.mas_width).multipliedBy(0.3);
        make.bottom.equalTo(self.mas_bottom);
    }];
    
    [self.nextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.right.bottom.equalTo(self).insets(UIEdgeInsetsMake(20, 0, 0, 0));
        make.width.equalTo(self.mas_width).multipliedBy(0.3);
        
    }];
}

#pragma mark lazy load

- (UIButton *)backBtn
{
    if(_backBtn == nil)
    {
        _backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_backBtn setImage:[UIImage imageNamed:@"goback"] forState:UIControlStateNormal];
        [_backBtn addTarget:self action:@selector(backBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _backBtn;
}

- (UILabel *)titleLabel
{
    if(_titleLabel == nil)
    {
        _titleLabel = [[UILabel alloc] init];
        
        _titleLabel.text = titleStr;
        _titleLabel.font = [UIFont systemFontOfSize:16.0];
        _titleLabel.textColor = lightYellowColor;
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.adjustsFontSizeToFitWidth = YES;
    }
    
    return _titleLabel;
}

- (UIButton *)nextBtn
{
    if(_nextBtn == nil)
    {
        _nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        _nextBtn.titleLabel.font = [UIFont systemFontOfSize:16.0];
        _nextBtn.titleLabel.textAlignment = NSTextAlignmentRight;
        _nextBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        _nextBtn.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 10);
        
        [_nextBtn setTitle:@"下一步" forState:UIControlStateNormal];
        [_nextBtn setTitleColor:lightYellowColor forState:UIControlStateNormal];
        [_nextBtn addTarget:self action:@selector(nextBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _nextBtn;
}


#pragma mark button-action

- (void)backBtnClicked:(id)sender
{
    if(self.backBtnClickedBlock)
    {
        self.backBtnClickedBlock();
    }
}

- (void)nextBtnClicked:(id)sender
{
    if(self.nextBtnClickedBlock)
    {
        self.nextBtnClickedBlock();
    }
}

@end
