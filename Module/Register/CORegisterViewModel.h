//
//  CORegisterViewModel.h
//  CoMoBicycle
//
//  Created by 金玉衡 on 16/10/25.
//  Copyright © 2016年 AutoMo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CORegisterViewModel : NSObject

@property (nonatomic, strong) NSString *username;

@property (nonatomic, strong) NSString *nickname;

@property (nonatomic, strong) NSString *password;

@property (nonatomic, strong) NSNumber *invalid;

@property (nonatomic, strong) NSString *invalidMsg;

@property (nonatomic, strong) NSNumber *registerStatus;

+(instancetype)shareInstance;

- (void)registerUser;

@end
