//
//  AppDelegate.h
//  liubangzhu
//
//  Created by able on 15/12/20.
//  Copyright © 2015年 able. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UITabBarController *tabbarVc;

-(void)getRootViewController;
@end

