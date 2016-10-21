//
//  COMediator+COLoginComponet.m
//  CoMoBicycle
//
//  Created by 金玉衡 on 16/10/21.
//  Copyright © 2016年 AutoMo. All rights reserved.
//

#import "COMediator+COLoginComponet.h"

@implementation COMediator (COLoginComponet)

- (UIViewController *)COLoginComponet_ViewController
{
    UIViewController *viewController = [self performTarget:@"COLoginComponet" action:@"LoginViewController" params:nil];
    if([viewController isKindOfClass:[UIViewController class]])
    {
        return viewController;
    }
    else
    {
        return [[UIViewController alloc] init];
    }
}

@end
