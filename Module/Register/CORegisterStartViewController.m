//
//  CORegisterStartViewController.m
//  CoMoBicycle
//
//  Created by 金玉衡 on 16/10/25.
//  Copyright © 2016年 AutoMo. All rights reserved.
//

#import "CORegisterStartViewController.h"
#import "CORegisterNextViewController.h"

#import "CONavigationBar.h"
#import "CORegisterStartView.h"

@interface CORegisterStartViewController()

@property (nonatomic, strong) CONavigationBar *navigaterBarView;
@property (nonatomic, strong) CORegisterStartView *registerStartView;

@end

@implementation CORegisterStartViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view addSubview:self.navigaterBarView];
    [self.view addSubview:self.registerStartView];
    
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self addUIConstraints];
}



#pragma mark subview layout

- (void)addUIConstraints
{
    [self.navigaterBarView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.top.right.equalTo(self.view);
        make.height.mas_equalTo(64);
        
    }];
    
    [self.registerStartView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(self.view);
        make.top.equalTo(_navigaterBarView.mas_bottom);
    }];
}

#pragma mark subview lazy load

- (CONavigationBar *)navigaterBarView
{
    if(_navigaterBarView == nil)
    {
        WEAK_SELF(weakself)
        _navigaterBarView = [[CONavigationBar alloc] initWithTitle:@"注册(1/3)"];
        
        _navigaterBarView.backBtnClickedBlock = ^{
        
            [weakself dismissViewControllerAnimated:YES completion:nil];
            
        };
        
        _navigaterBarView.nextBtnClickedBlock = ^{
            
            CORegisterNextViewController *nextVC = [[CORegisterNextViewController alloc] init];
            
            [weakself addPresentAnimation];
            
            [weakself presentViewController:nextVC animated:NO completion:nil];
            
        };
    }
    
    return _navigaterBarView;
}

- (CORegisterStartView *)registerStartView
{
    if(_registerStartView == nil)
    {
        _registerStartView = [[CORegisterStartView alloc] init];
     
    }
    
    return _registerStartView;
}

@end
