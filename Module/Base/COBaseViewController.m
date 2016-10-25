//
//  COBaseViewController.m
//  CoMoBicycle
//
//  Created by 金玉衡 on 16/10/21.
//  Copyright © 2016年 AutoMo. All rights reserved.
//

#import "COBaseViewController.h"

@interface COBaseViewController()

@end

@implementation COBaseViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
}

- (void)showInfoStatus:(NSString *)strMsg
{
    [SVProgressHUD showInfoWithStatus:strMsg];
}

- (void)showWaitStatus:(NSString *)strMsg
{
    [SVProgressHUD showWithStatus:strMsg];
}

- (void)hideWait
{
    [SVProgressHUD dismiss];
}

@end
