//
//  COBikeMainViewController.m
//  CoMoBicycle
//
//  Created by 金玉衡 on 16/10/21.
//  Copyright © 2016年 AutoMo. All rights reserved.
//

#import "COBikeMainViewController.h"
#import "COBMHeaderView.h"
#import "COBMCustomView.h"
#import "COBMViewModel.h"
#import "AppDelegate.h"

@interface COBikeMainViewController()

@property (nonatomic, strong) COBMHeaderView *headView;
@property (nonatomic, strong) COBMCustomView   *customView;
@property (nonatomic, strong) COBMViewModel     *viewModel;

@end

@implementation COBikeMainViewController


- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.view addSubview:self.headView];
    [self.view addSubview:self.customView];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    [self addUIConstraints];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
}

#pragma mark ui layout

- (void)addUIConstraints
{
    [self.headView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.top.right.equalTo(self.view);
        make.height.mas_equalTo(NavBarHeight);
        
    }];
    
    [self.customView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.bottom.equalTo(self.view);
        
        make.top.equalTo(_headView.mas_bottom);
    }];
}


#pragma mark lazy load

- (COBMHeaderView *)headView
{
    if(_headView == nil)
    {
        NSData *dataImage = [self.viewModel getLocalUserImage];
        _headView = [[COBMHeaderView alloc] initWithTitle:@"COBicycle" HeaderImage:dataImage];
        
        _headView.leftbtnClickBlock = ^{
            
            [[AppDelegate globalDelegate] toggleDrawLeft];
        };
        
    }
    
    return _headView;
}

- (COBMCustomView *)customView
{
    if(_customView == nil)
    {
        _customView = [[COBMCustomView alloc] init];
    }
    
    return _customView;
}

- (COBMViewModel *)viewModel
{
    if(_viewModel == nil)
    {
        _viewModel = [COBMViewModel sharedInstance];
    }
    
    return _viewModel;
}



@end
