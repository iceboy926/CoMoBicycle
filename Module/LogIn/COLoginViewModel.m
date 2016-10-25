//
//  COLoginViewModel.m
//  CoMoBicycle
//
//  Created by 金玉衡 on 16/10/21.
//  Copyright © 2016年 AutoMo. All rights reserved.
//

#import "COLoginViewModel.h"

@implementation COLoginViewModel


- (void)login
{
    if([[self.username stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[self.password stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""])
    {
        
        self.invalidMsg = @"账号或密码为空";
        self.invalid = @YES;
        return ;
    }
    
    if(![self CheckUserName:self.username])
    {
        
        self.invalidMsg = @"手机号码格式不正确";
        self.invalid = @YES;
        return ;
    }

    if (self.username && self.password) {
        
        NSDictionary *dicParam = @{@"user": self.username, @"psd": [self.password md5]};
        
        [CBNetworking requestWithUrl:API_URL_LOGIN params:dicParam useCache:YES httpMedthod:CBPOSTRequest progressBlock:nil successBlock:^(id response){
        
            if(response[@"success"])
            {
                if([response[@"success"] intValue] == 0)
                {
                    self.loginStatus = @(NO);
                }
                else
                {
                    //保存登录状态 和 token
                    
                    NSDictionary *dicUser = @{@"username": response[@"username"], @"usertoken": response[@"usertoken"], @"logstatus": @(YES)};
                    
                    [COAccount saveAccount:dicUser];
                    
                    self.loginStatus = @(YES);
                }
            }
            else
            {
                self.invalidMsg = @"用户名或密码错误";
                self.loginStatus = @(NO);
            }
        
        } failBlock:^(NSError *error){
            
            self.invalidMsg = @"网络状态异常";
            self.netStatus = @(YES);
        }];
        
    }
}

#pragma  mark  username phonenum check

- (BOOL)CheckUserName:(NSString *)username
{
    NSString *Regex = @"1\\d{10}";
    
    NSPredicate *phonenumbercheck = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", Regex];
    
    return [phonenumbercheck evaluateWithObject:username];
}

@end
