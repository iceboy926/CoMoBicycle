//
//  COLoginViewController.m
//  CoMoBicycle
//
//  Created by 金玉衡 on 16/10/21.
//  Copyright © 2016年 AutoMo. All rights reserved.
//

#import "COLoginViewController.h"
#import "COLoginViewModel.h"
#import "COLoginView.h"

@interface COLoginViewController()

@property (nonatomic, strong) UIImageView *bgView;
@property (nonatomic, strong) COLoginView *loginView;
@property (nonatomic, strong) COLoginViewModel *loginViewModel;

@end

@implementation COLoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view insertSubview:self.bgView atIndex:0];
    [self.view addSubview:self.loginView];
    
    [self initUI];
}

- (void)initUI
{
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.equalTo(self.view);
    }];
    
    [self.loginView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.equalTo(self.view);
    }];
    
}

/**
 *  lazy load
 */

- (COLoginView *)loginView
{
    if(_loginView == nil)
    {
        _loginView = [[COLoginView alloc] init];
        _loginView.loginBtnClickedBlock = ^{
        
        
            NSLog(@" login out");
        
        };
    }
    
    return _loginView;
}

- (UIImageView *)bgView
{
    if(_bgView == nil)
    {
        _bgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"login_background.jpg"]];
    }
    
    return _bgView;
}

- (COLoginViewModel *)loginViewModel
{
    if(_loginViewModel == nil)
    {
        _loginViewModel = [[COLoginViewModel alloc] init];
    }
    
    return _loginViewModel;
}

@end
