//
//  AppDelegate.m
//  LTSDemo
//
//  Created by yuqian on 2018/9/14.
//  Copyright © 2018年 yuqian. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

//UIApplicationStateActive,
//UIApplicationStateInactive,
//UIApplicationStateBackground

//UIApplicationState 变化过程
//1.冷启动:
//    func:-[AppDelegate application:didFinishLaunchingWithOptions:]  status:1
//    func:-[AppDelegate applicationDidBecomeActive:]  status:0
//2.前台->后台：
//    func:-[AppDelegate applicationWillResignActive:]  status:0
//    func:-[AppDelegate applicationDidEnterBackground:]  status:2
//3.后台->前台：
//    func:-[AppDelegate applicationWillEnterForeground:]  status:2
//    func:-[AppDelegate applicationDidBecomeActive:]  status:0
//4.前台->锁屏:
//    func:-[AppDelegate applicationWillResignActive:]  status:0
//    func:-[AppDelegate applicationDidEnterBackground:]  status:2
//5.锁屏->前台:
//    func:-[AppDelegate applicationWillEnterForeground:]  status:2
//    func:-[AppDelegate applicationDidBecomeActive:]  status:0
//6.上拉功能栏:
//    func:-[AppDelegate applicationWillResignActive:]  status:0
//7.收起功能栏:
//    func:-[AppDelegate applicationDidBecomeActive:]  status:0
//8.下拉通知栏:
//    func:-[AppDelegate applicationWillResignActive:]  status:0
//    func:-[AppDelegate applicationDidBecomeActive:]  status:0
//    func:-[AppDelegate applicationWillResignActive:]  status:0
//9.收起通知栏:
//    func:-[AppDelegate applicationDidBecomeActive:]  status:0
//10.唤起多任务:
//    func:-[AppDelegate applicationWillResignActive:]  status:0
//11.杀死程序:
//    func:-[AppDelegate applicationDidEnterBackground:]  status:2
//    func:-[AppDelegate applicationWillTerminate:]  status:2

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    NSLog(@"func:%s  status:%ld", __func__, application.applicationState);
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    
    NSLog(@"func:%s  status:%ld", __func__, application.applicationState);
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    NSLog(@"func:%s  status:%ld", __func__, application.applicationState);
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background
    
    NSLog(@"func:%s  status:%ld", __func__, application.applicationState);
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    NSLog(@"func:%s  status:%ld", __func__, application.applicationState);
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    NSLog(@"func:%s  status:%ld", __func__, application.applicationState);
}


@end
