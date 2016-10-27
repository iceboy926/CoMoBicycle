//
//  CORegisterViewController.m
//  CoMoBicycle
//
//  Created by 金玉衡 on 16/10/25.
//  Copyright © 2016年 AutoMo. All rights reserved.
//

#import "CORegisterNextViewController.h"
#import "CORegisterStartViewController.h"
#import "CORegisterEndViewController.h"

#import "CONavigationBar.h"
#import "CORegisterNextView.h"

@interface CORegisterNextViewController()

@property (nonatomic, strong) CONavigationBar       *navigaterBar;
@property (nonatomic, strong) CORegisterNextView    *nextView;


@end

@implementation CORegisterNextViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view addSubview:self.navigaterBar];
    [self.view addSubview:self.nextView];
    
    [self addUIContraints];
}

#pragma mark ui layout

- (void)addUIContraints
{
    [self.navigaterBar mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.top.right.equalTo(self.view);
        make.height.mas_equalTo(64);
        
    }];
    
    [self.nextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(self.view);
        make.top.equalTo(_navigaterBar.mas_bottom);
    }];
}

#pragma mark ui lazy load

- (CONavigationBar *)navigaterBar
{
    if(_navigaterBar == nil)
    {
        WEAK_SELF(weakself)
        _navigaterBar = [[CONavigationBar alloc] initWithTitle:@"注册(2/3)"];
        
        _navigaterBar.backBtnClickedBlock = ^{
            
            [weakself dismissViewControllerAnimated:YES completion:nil];
        };
        
        _navigaterBar.nextBtnClickedBlock = ^{
            
            CORegisterEndViewController *endVC = [[CORegisterEndViewController alloc] init];
            
            [weakself addPresentAnimation];
            
            [weakself presentViewController:endVC animated:NO completion:nil];
        
        };
    }
    
    return _navigaterBar;
}


- (CORegisterNextView *)nextView
{
    if(_nextView == nil)
    {
        _nextView = [[CORegisterNextView alloc] init];
    }
    
    return _nextView;
}

#pragma mark custom function




@end
