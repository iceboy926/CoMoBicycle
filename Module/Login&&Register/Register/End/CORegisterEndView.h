//
//  CORegisterEndView.h
//  CoMoBicycle
//
//  Created by 金玉衡 on 16/10/27.
//  Copyright © 2016年 AutoMo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CORegisterEndView : UIView

@property (nonatomic, copy) void (^finishedBtnClickedBlock)();
@property (nonatomic, copy) void (^headImageBtnClickedBlock)();
@property (nonatomic, strong) UITextField   *nickNameTextFiled;

- (void)setHeadImage:(UIImage *)image;

@end
