//
//  AppDelegate.h
//  CoMoBicycle
//
//  Created by 金玉衡 on 16/10/21.
//  Copyright © 2016年 AutoMo. All rights reserved.
//


@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;


+ (AppDelegate *)globalDelegate;

- (void)toggleDrawLeft;

- (void)closeDrawleftAnimated:(BOOL)animated completion:(void(^)(BOOL finished))completion;

- (UINavigationController *)rootNavigationController;

@end

