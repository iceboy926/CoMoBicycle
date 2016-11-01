//
//  COForgetViewModel.m
//  CoMoBicycle
//
//  Created by 金玉衡 on 16/10/31.
//  Copyright © 2016年 AutoMo. All rights reserved.
//

#import "COForgetViewModel.h"

@implementation COForgetViewModel


+ (instancetype)shareInstance
{
    static COForgetViewModel *myInstance =nil;
    dispatch_once_t once_t;
    dispatch_once(&once_t, ^{
    
        if(myInstance == nil)
        {
            myInstance = [[COForgetViewModel alloc] init];
        }
    
    });
    
    return myInstance;
}

- (void)forgetStart
{
    if([[self.username stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""])
    {
        self.invalidMsg = @"请输入手机号码";
        self.invalid = @NO;
        return ;
    }
    
    if(![self.authStatus boolValue])
    {
        self.invalidMsg = @"验证码不正确";
        self.invalid = @NO;
        return ;
    }
    else
    {
        self.invalid = @YES;
    }
}

- (void)forgetNext
{
    
}

@end
