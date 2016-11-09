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
        
        WEAK_SELF(weakself)
        _customView = [[COBMCustomView alloc] init];
        
        _customView.startSearchBlock = ^{
        
            [weakself gotoSearchNavigationViewController];
        
        };
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


#pragma mark goto SearchVC

- (void)gotoSearchNavigationViewController
{
    NSArray *hotkeyArray = @[@"美食", @"酒店", @"银行", @"超市", @"商场", @"景点", @"医院", @"公交站", @"地铁站", @"卫生间"];
    
    WEAK_SELF(weakself)
    PYSearchViewController *searchVC = [PYSearchViewController searchViewControllerWithHotSearches:hotkeyArray searchBarPlaceholder:@"附近的商场、美食" didSearchBlock:^(PYSearchViewController *searchViewController, UISearchBar *searchBar, NSString *searchText) {
        
    [searchViewController.navigationController dismissViewControllerAnimated:YES completion:^{
        
        [weakself.customView startPoiSearchWithKeyword:searchText];
    }];
        
    }];
    
    searchVC.view.backgroundColor = backGroundColor;
    searchVC.hotSearchStyle = PYHotSearchStyleBorderTag;
    searchVC.searchHistoryStyle = PYSearchHistoryStyleBorderTag;
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:searchVC];
    
    [self presentViewController:navigationController animated:YES completion:nil];
}



@end
