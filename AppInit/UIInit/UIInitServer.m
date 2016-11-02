//
//  UIInitServer.m
//  CoMoBicycle
//
//  Created by 金玉衡 on 16/10/21.
//  Copyright © 2016年 AutoMo. All rights reserved.
//

#import "UIInitServer.h"
#import "COMediator+COLoginRegistComponet.h"
#import "COMediator+COBikeMainComponet.h"

@implementation UIInitServer

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // init interface load

    [self initWithApplication:application];
    
    [self addLauchImageWithApplication:application Image:[UIImage imageNamed:@"blurred_background"]];

    return YES;
}


- (void)initWithApplication:(UIApplication *)application
{
    application.delegate.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    UIViewController *rootVC = nil;
    if([COAccount getAccount] == nil)
    {
        //登录界面
        rootVC = [[COMediator shareInstance] COLoginRegistComponet_LoginViewController];
    }
    else
    {
        //主界面
        rootVC = [[COMediator shareInstance] COBikeComponet_ViewController];
    }
    
    application.delegate.window.rootViewController = rootVC;
    
    [application.delegate.window makeKeyAndVisible];
}

- (void)addLauchImageWithApplication:(UIApplication *)application Image:(UIImage *)image
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    imageView.image = image;
    [application.delegate.window.rootViewController.view addSubview:imageView];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5*NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    
        [UIView animateWithDuration:1.5 animations:^{
            
            [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
            
            imageView.transform = CGAffineTransformMakeScale(2.0, 2.0);
            
            imageView.alpha = 0;
            
        } completion:^(BOOL blfinished){
            
            [imageView removeFromSuperview];
            
        }];
    
    });
}


@end
