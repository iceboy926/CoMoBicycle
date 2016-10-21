//
//  COAccount.h
//  CoMoBicycle
//
//  Created by 金玉衡 on 16/10/21.
//  Copyright © 2016年 AutoMo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface COAccount : NSObject

/**
 *  存储账号信息
 *  @param account 需要存储的账号信息：第一个值为用户名；第二个值为密码的Hash值
 */
+(void)saveAccount:(NSArray *)account;


+(NSArray *)getAccount;


@end
