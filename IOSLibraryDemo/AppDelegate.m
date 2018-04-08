//
//  AppDelegate.m
//  IOSLibraryDemo
//
//  Created by 罗海雄 on 2017/10/24.
//  Copyright © 2017年 罗海雄. All rights reserved.
//

#import "AppDelegate.h"
#import "RootViewController.h"
#import <SeaTabBarController.h>
#import "TabBar2ViewController.h"
#import "TabBar3ViewController.h"
#import "SubPageViewController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {


    NSArray *infos = @[[SeaTabBarItemInfo infoWithTitle:@"首页" normalImage:[UIImage imageNamed:@"home_n"] viewController:[[RootViewController new] sea_createWithNavigationController]],
                       [SeaTabBarItemInfo infoWithTitle:@"发现" normalImage:[UIImage imageNamed:@"moment_n"] viewController:[[TabBar2ViewController new] sea_createWithNavigationController]],
                       [SeaTabBarItemInfo infoWithTitle:@"我的" normalImage:[UIImage imageNamed:@"me_n"] viewController:[[TabBar3ViewController new] sea_createWithNavigationController]],
                       ];

    SeaTabBarController *controller = [[SeaTabBarController alloc] initWithItemInfos:infos];

    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = controller;
    [self.window makeKeyAndVisible];
  
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
