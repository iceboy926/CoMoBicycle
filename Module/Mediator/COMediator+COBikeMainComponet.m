//
//  COMediator+COBikeMainComponet.m
//  CoMoBicycle
//
//  Created by 金玉衡 on 16/10/21.
//  Copyright © 2016年 AutoMo. All rights reserved.
//

#import "COMediator+COBikeMainComponet.h"

@implementation COMediator (COBikeMainComponet)

- (UIViewController *)COBikeComponet_ViewController
{
    UIViewController *viewController = [self performTarget:@"COBikeMainComponet" action:@"BikeMainViewController" params:nil];
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
