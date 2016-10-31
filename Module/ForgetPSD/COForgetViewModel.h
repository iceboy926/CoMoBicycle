//
//  COForgetViewModel.h
//  CoMoBicycle
//
//  Created by 金玉衡 on 16/10/31.
//  Copyright © 2016年 AutoMo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface COForgetViewModel : NSObject

@property (nonatomic, strong) NSString *username;

@property (nonatomic, strong) NSNumber *authStatus;

@property (nonatomic, strong) NSNumber *invalid;

@property (nonatomic, strong) NSString *invalidMsg;


- (void)forgetStart;

- (void)forgetNext;

@end
