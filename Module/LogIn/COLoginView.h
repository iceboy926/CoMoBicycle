//
//  COLoginView.h
//  CoMoBicycle
//
//  Created by 金玉衡 on 16/10/21.
//  Copyright © 2016年 AutoMo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface COLoginView : UIView

@property (nonatomic, copy) void (^loginBtnClickedBlock)(NSString *userName, NSString *password);
@property (nonatomic, copy) void (^loginByBIOBtnClickedBlock)(NSString *userName);

@end
