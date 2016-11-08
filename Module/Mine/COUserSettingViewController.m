//
//  UserSettingViewController.m
//  CoMoBicycle
//
//  Created by 金玉衡 on 16/11/3.
//  Copyright © 2016年 AutoMo. All rights reserved.
//

#import "COUserSettingViewController.h"
#import "COUserSettingHeaderView.h"
#import "COUserSettingFooterView.h"
#import "COUserSettingTableViewModel.h"
#import "COUserSettingHeadViewModel.h"
#import "COUserSettingHeadModel.h"

@interface COUserSettingViewController() <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) COUserSettingHeaderView *settingHeaderView;
@property (nonatomic, strong) UITableView *settingTableView;
@property (nonatomic, strong) COUserSettingFooterView *settingFooterView;

@property (nonatomic, strong) COUserSettingTableViewModel *settingViewModel;
@property (nonatomic, strong) COUserSettingHeadViewModel *headViewModel;

@end

@implementation COUserSettingViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view addSubview:self.settingHeaderView];
    [self.view addSubview:self.settingTableView];
    [self.view addSubview:self.settingFooterView];

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self addUIConstraints];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self requestData];
}


#pragma mark ui layout

- (void)addUIConstraints
{
    [self.settingHeaderView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.top.right.equalTo(self.view);
        make.height.equalTo(self.view.mas_height).multipliedBy(0.3);
        
    }];
    
    [self.settingTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.equalTo(self.view);
        make.top.equalTo(_settingHeaderView.mas_bottom);
        make.bottom.equalTo(_settingFooterView.mas_top);
    }];
    
    [self.settingFooterView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.bottom.equalTo(self.view);
        make.height.equalTo(self.view.mas_height).multipliedBy(0.2);
        
    }];
}

#pragma mark lazy load

- (COUserSettingHeaderView *)settingHeaderView
{
    if(_settingHeaderView == nil)
    {
        _settingHeaderView = [[COUserSettingHeaderView alloc] init];
    }

    return _settingHeaderView;
}

- (UITableView *)settingTableView
{
    if(_settingTableView == nil)
    {
        _settingTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        
        _settingTableView.delegate = self;
        _settingTableView.dataSource = self;
        _settingTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _settingTableView.backgroundColor = shadowViewColor;
    }
    
    return _settingTableView;
}

- (COUserSettingFooterView *)settingFooterView
{
    if(_settingFooterView == nil)
    {
        _settingFooterView = [[COUserSettingFooterView alloc] init];
    }
    
    return _settingFooterView;
}

- (COUserSettingTableViewModel *)settingViewModel
{
    if(_settingViewModel == nil)
    {
        _settingViewModel = [[COUserSettingTableViewModel alloc] init];
    }
    
    return _settingViewModel;
}

- (COUserSettingHeadViewModel *)headViewModel
{
    if(_headViewModel == nil)
    {
        _headViewModel = [[COUserSettingHeadViewModel alloc] init];
        
    }
    
    return _headViewModel;
}


#pragma mark custom function

- (void)requestData
{
    WEAK_SELF(weakself)
    [self.headViewModel fetchUserSettingHeadDataWithCallBack:^(id response) {
       
        COUserSettingHeadModel *headModel = [[COUserSettingHeadModel alloc] initWithDictionary:response];
        
        [weakself.settingHeaderView setHeadModel:headModel];
        
    }];
}


#pragma mark UITableView datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.settingViewModel numberOfRowsInSection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.settingViewModel tableView:tableView cellForRowAtIndexPath:indexPath];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.settingViewModel tableView:tableView heightForRowAtIndexPath:indexPath];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}


@end
