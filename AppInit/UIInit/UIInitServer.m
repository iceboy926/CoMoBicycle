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


@end
