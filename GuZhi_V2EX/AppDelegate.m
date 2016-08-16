//
//  AppDelegate.m
//  GuZhi_V2EX
//
//  Created by Danny Ho on 6/30/16.
//  Copyright © 2016 thanksdanny. All rights reserved.
//

#import "AppDelegate.h"
#import "GZHomeViewController.h"
#import "GZLeftMenuViewController.h"
#import "GZTopicListViewController.h"

#import "MMDrawerController.h"

@interface AppDelegate ()
{
    MMDrawerController *_homeDrawerController;
}

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    GZHomeViewController *homeVC = [[GZHomeViewController alloc] init];
//    GZTopicListViewController *homeVC = [[GZTopicListViewController alloc] init];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:homeVC];
    UINavigationBar *appearance = [UINavigationBar appearance];
    [appearance setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    [appearance setShadowImage:[[UIImage alloc] init]];
    [appearance setTranslucent:NO];
    [appearance setBarStyle:UIBarStyleBlackOpaque];
    [appearance setBarTintColor:[UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1]]; // 颜色往后统一
    [appearance setTintColor:[UIColor whiteColor]];
    [appearance setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor], NSForegroundColorAttributeName, [UIFont boldSystemFontOfSize:15], NSFontAttributeName, nil]];
    
    GZLeftMenuViewController *leftMenuVC = [[GZLeftMenuViewController alloc] init];
    
    _homeDrawerController = [[MMDrawerController alloc] initWithCenterViewController:nav
                                                            leftDrawerViewController:leftMenuVC
                                                           rightDrawerViewController:nil];
    [_homeDrawerController setMaximumLeftDrawerWidth:90.0];
    [_homeDrawerController setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.window addSubview:_homeDrawerController.view];
    self.window.rootViewController = _homeDrawerController;
    
    [_window makeKeyAndVisible];
    
    return YES;
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
