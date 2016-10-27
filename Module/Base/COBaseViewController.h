//
//  COBaseViewController.h
//  CoMoBicycle
//
//  Created by 金玉衡 on 16/10/21.
//  Copyright © 2016年 AutoMo. All rights reserved.
//


@interface COBaseViewController : UIViewController

- (void)showInfoStatus:(NSString *)strMsg;

- (void)showWaitStatus:(NSString *)strMsg;

- (void)hideWait;


- (void)addPresentAnimation;

@end
