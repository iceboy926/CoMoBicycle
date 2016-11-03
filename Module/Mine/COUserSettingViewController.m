//
//  UserSettingViewController.m
//  CoMoBicycle
//
//  Created by 金玉衡 on 16/11/3.
//  Copyright © 2016年 AutoMo. All rights reserved.
//

#import "COUserSettingViewController.h"
#import "COUserSettingHeaderView.h"

@interface COUserSettingViewController() <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) COUserSettingHeaderView *settingHeaderView;
@property (nonatomic, strong) UITableView *settingTableView;

@end

@implementation COUserSettingViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view addSubview:self.settingHeaderView];
    [self.view addSubview:self.settingTableView];
}

#pragma mark ui layout

- (void)addUIConstraints
{
    [self.settingHeaderView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.top.right.equalTo(self.view);
        make.height.mas_equalTo(NavBarHeight*2);
        
    }];
    
    [self.settingTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(_settingHeaderView.mas_bottom);
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
        //_settingTableView.tableHeaderView = self.settingHeaderView;
        
    }
    
    return _settingTableView;
}


#pragma mark UITableView datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *strcell = @"usercell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strcell forIndexPath:indexPath];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strcell];
    }
    
    return cell;
}




@end
