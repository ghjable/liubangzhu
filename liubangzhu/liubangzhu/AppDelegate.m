//
//  AppDelegate.m
//  liubangzhu
//
//  Created by able on 15/12/20.
//  Copyright © 2015年 able. All rights reserved.
//

#import "AppDelegate.h"
#import "LoginViewController.h"
#import "XuanshangViewController.h"
#import "YihubaiyingViewController.h"
#import "ZhongrenbangViewController.h"
#import "BangzhuzhanViewController.h"
@interface AppDelegate ()<UITabBarControllerDelegate>


@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIWindow *window=[[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    LoginViewController *loginVC=[[LoginViewController alloc] init];
    UINavigationController *loginNV=[[UINavigationController alloc] initWithRootViewController:loginVC];
    loginNV.navigationBar.hidden=YES;
    window.rootViewController=loginNV;
    
//    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent ];
    
    
    [window makeKeyAndVisible];
    self.window=window;
    return YES;

    // Override point for customization after application launch.
    return YES;
}
-(void)getRootViewController
{
    _tabbarVc=[[UITabBarController alloc] init];
    _tabbarVc.delegate = self;
    XuanshangViewController *XuanVc=[[XuanshangViewController alloc] init];
    XuanVc.view.backgroundColor=[UIColor whiteColor];
    UINavigationController *navXuan=[[UINavigationController alloc] initWithRootViewController:XuanVc];
    XuanVc.tabBarItem.title=@"悬赏";
    XuanVc.tabBarItem.image=[[UIImage imageNamed:@"icon30-30"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    XuanVc.tabBarItem.selectedImage=[[UIImage imageNamed:@"icon30-30"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    YihubaiyingViewController *YiVc=[[YihubaiyingViewController alloc] init];
    YiVc.view.backgroundColor=[UIColor whiteColor];
    UINavigationController *navYi=[[UINavigationController alloc] initWithRootViewController:YiVc];
    YiVc.tabBarItem.title=@"一呼百应";
    YiVc.tabBarItem.image=[[UIImage imageNamed:@"icon30-30"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    YiVc.tabBarItem.selectedImage=[[UIImage imageNamed:@"icon30-30"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    ZhongrenbangViewController *ZhongVc=[[ZhongrenbangViewController alloc] init];
    ZhongVc.view.backgroundColor=[UIColor whiteColor];
    UINavigationController *navZhong=[[UINavigationController alloc] initWithRootViewController:ZhongVc];
    ZhongVc.tabBarItem.title=@"众人帮";
    ZhongVc.tabBarItem.image=[[UIImage imageNamed:@"icon30-30"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    ZhongVc.tabBarItem.selectedImage=[[UIImage imageNamed:@"icon30-30"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    BangzhuzhanViewController *BangVc=[[BangzhuzhanViewController alloc] init];
    BangVc.view.backgroundColor=[UIColor whiteColor];
    UINavigationController *navBang=[[UINavigationController alloc] initWithRootViewController:BangVc];
    BangVc.tabBarItem.title=@"帮助站";
    BangVc.tabBarItem.image=[[UIImage imageNamed:@"icon30-30"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    BangVc.tabBarItem.selectedImage=[[UIImage imageNamed:@"icon30-30"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    _tabbarVc.viewControllers=@[navXuan,navYi,navZhong,navBang];
    _tabbarVc.tabBar.tintColor=[UIColor redColor];
    
    self.window.rootViewController = _tabbarVc;

}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
