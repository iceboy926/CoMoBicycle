//
//  COAccount.m
//  CoMoBicycle
//
//  Created by 金玉衡 on 16/10/21.
//  Copyright © 2016年 AutoMo. All rights reserved.
//

#import "COAccount.h"
@implementation COAccount


+ (void)saveAccount:(NSArray *)account{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    //保存数据 用户信息MD5；用户名；用户密码的hash值
    [userDefaults setObject:account  forKey:@"Account" ];
    NSString *username = [account objectAtIndex:0];
    NSString *password = [account objectAtIndex:1];
    
    [userDefaults setObject:[username md5]  forKey:@"userName" ];
    [userDefaults setObject:[password md5]  forKey:@"passWord" ];
    [userDefaults synchronize];
};


+ (NSArray *)getAccount{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSArray *array = [userDefaults objectForKey:@"Account"];
    return array;
};

@end
