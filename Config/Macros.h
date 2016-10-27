//
//  Macros.h
//  CoMoBicycle
//
//  Created by 金玉衡 on 16/10/21.
//  Copyright © 2016年 AutoMo. All rights reserved.
//

#ifndef Macros_h
#define Macros_h

#define MAX_WIDTH  [UIScreen mainScreen].bounds.size.width
#define MAX_HEIGHT [UIScreen mainScreen].bounds.size.height
#define WIDTH_TO_FIT(width)  (ceilf( [UIScreen mainScreen].bounds.size.width / 375.0f  * (width / 2) * 2) \
/ 2.0f)

#define WEAK_SELF(weakSelf) __weak __typeof(&*self)weakSelf = self;
#define STRONG_SELF(strongSelf) __strong __typeof(&*self)strongSelf = self;

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)(((rgbValue) & 0xFF0000) >> 16))/255.0 green:((float)(((rgbValue) & 0xFF00) >> 8))/255.0 blue:((float)((rgbValue) & 0xFF))/255.0 alpha:1.0]


#define ISIOS10 ([[[UIDevice currentDevice] sysytemVersion] doubleValue]>=10.0)
#define ISIOS9 ([[[UIDevice currentDevice] systemVersion] doubleValue]>=9.0)
#define ISIOS8 ([[[UIDevice currentDevice] systemVersion] doubleValue]>=8.0)
#define ISIOS7 ([[[UIDevice currentDevice] systemVersion] doubleValue]>=7.0)

#define lightYellowColor UIColorFromRGB(0xF89022)


#endif /* Macros_h */
