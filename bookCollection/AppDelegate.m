//
//  AppDelegate.m
//  bookCollection
//
//  Created by RandyWei on 2019/8/4.
//  Copyright © 2019 RandyWei. All rights reserved.
//

#import "AppDelegate.h"
#import "BookListViewController.h"
#import "Modules/BookScanner/BookScannerViewController.h"
#import "BookAnalyticsViewController.h"

@interface AppDelegate ()<UITabBarControllerDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];

    UITabBarController *tabBarController = [[UITabBarController alloc]init];
    self.window.rootViewController = tabBarController;
    tabBarController.delegate = self;
    
    BookListViewController *bookListViewController = [[BookListViewController alloc]init];
    UITabBarItem *bookListTabBarItem = [[UITabBarItem alloc]initWithTitle:@"我的藏书" image:[[UIImage imageNamed:@"tabbar-icon-collection"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[UIImage imageNamed:@"tabbar-icon-collection"]];
    bookListViewController.tabBarItem = bookListTabBarItem;
    
    BookScannerViewController *bookScannerViewController = [[BookScannerViewController alloc]init];
    UITabBarItem *bookScannerTabBarItem = [[UITabBarItem alloc]initWithTitle:@"扫码藏书" image:[[UIImage imageNamed:@"tabbar-icon-scan"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[UIImage imageNamed:@"tabbar-icon-scan"]];
    bookScannerViewController.tabBarItem = bookScannerTabBarItem;
    
    BookAnalyticsViewController *bookAnalyticsViewController = [[BookAnalyticsViewController alloc]init];
    UITabBarItem *bookAnalyticsTabBarItem = [[UITabBarItem alloc]initWithTitle:@"我" image:[[UIImage imageNamed:@"tabbar-icon-me"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[UIImage imageNamed:@"tabbar-icon-me"]];
    bookAnalyticsViewController.tabBarItem = bookAnalyticsTabBarItem;
    
    tabBarController.viewControllers = @[bookListViewController,bookScannerViewController,bookAnalyticsViewController];
    tabBarController.tabBar.itemPositioning = UITabBarItemPositioningCentered;
    
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

#pragma UITabBarControllerDelegate

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
    if ([viewController isKindOfClass:[BookScannerViewController class]]) {
        
        BookScannerViewController *bookScannerViewController = [[BookScannerViewController alloc]init];
        
        UINavigationController *navigationController = [[UINavigationController alloc]initWithRootViewController:bookScannerViewController];
        [self.window.rootViewController presentViewController:navigationController animated:YES completion:nil];
        
        return NO;
    }
    return YES;
}

@end
