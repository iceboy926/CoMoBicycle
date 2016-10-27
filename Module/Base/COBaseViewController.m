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

- (void)addPresentAnimation
{
    CATransition *animation = [CATransition animation];
    animation.duration = 0.5;
    animation.timingFunction = UIViewAnimationCurveEaseInOut;
    animation.type = @"pageCurl";
    //animation.type = kCATransitionPush;
    animation.subtype = kCATransitionFromRight;
    [self.view.window.layer addAnimation:animation forKey:nil];
}

@end
