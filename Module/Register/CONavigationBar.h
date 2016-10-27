//
//  CONavigationBar.h
//  CoMoBicycle
//
//  Created by 金玉衡 on 16/10/25.
//  Copyright © 2016年 AutoMo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CONavigationBar : UIView

- (instancetype)initWithTitle:(NSString *)strTitle;

@property (nonatomic, copy) void (^backBtnClickedBlock)();
@property (nonatomic, copy) void (^nextBtnClickedBlock)();

@end
