//
//  CORegisterEndViewController.m
//  CoMoBicycle
//
//  Created by 金玉衡 on 16/10/25.
//  Copyright © 2016年 AutoMo. All rights reserved.
//

#import "CORegisterEndViewController.h"
#import "CORegisterNextViewController.h"

#import "CORegisterEndView.h"


@interface CORegisterEndViewController()

@property (nonatomic, strong) CORegisterEndView *endView;

@end

@implementation CORegisterEndViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view addSubview:self.endView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self addUIConstraints];
}

#pragma mark ui layout

- (void)addUIConstraints
{
    [self.endView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.edges.equalTo(self.view);
        
    }];
}


#pragma mark ui lazy load

-(CORegisterEndView *)endView
{
    if(_endView == nil)
    {
        _endView = [[CORegisterEndView alloc] init];
        
    }
    
    return _endView;
}

@end
