//
//  CORegisterViewModel.m
//  CoMoBicycle
//
//  Created by 金玉衡 on 16/10/25.
//  Copyright © 2016年 AutoMo. All rights reserved.
//

#import "CORegisterViewModel.h"

@implementation CORegisterViewModel


+(instancetype)shareInstance
{
    static CORegisterViewModel *myViewModel = nil;
    static dispatch_once_t once_time;
    dispatch_once(&once_time, ^{
    
        if(myViewModel == nil)
        {
            myViewModel = [[CORegisterViewModel alloc] init];
        }
    
    });
    
    return myViewModel;
}


- (BOOL)checkSMSNumber
{
    BOOL blValid = YES;
    
    
    return blValid;
}

- (void)startRegister
{
    if([[self.username stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[self.checkSMS stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""])
    {
        self.invalidMsg = @"请输入手机号或校验码";
        self.invalidStart = @YES;
        
        return ;
    }
    
    if([self checkSMSNumber])
    {
        self.smsCheck = @YES;
    }
    else
    {
        self.invalidMsg = @"短信校验码有误";
        self.smsCheck = @NO;
    }
    
}


- (void)nextRegister
{
    if([self.password length] < 6 || [self.password length] > 12)
    {
        self.invalidMsg = @"密码长度为6至12位";
        self.invalidNext = @YES;
        
    }
    else
    {
        self.invalidNext = @NO;
    }

}

- (void)finishRegister
{
    
}



@end
