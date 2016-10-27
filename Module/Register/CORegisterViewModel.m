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

- (void)registerUser
{
    
}

@end
