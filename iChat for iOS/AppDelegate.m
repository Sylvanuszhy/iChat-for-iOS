//
//  AppDelegate.m
//  iChat for iOS
//
//  Created by Sylvanus on 6/5/16.
//  Copyright © 2016 Sylvanus. All rights reserved.
//

#import "AppDelegate.h"
#import "iChat.h"
#import "ViewController.h"
#import "TabBarController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [[NSNotificationCenter defaultCenter] addObserverForName:LoginNotification object:nil queue:nil usingBlock:^(NSNotification *note) {
        [self login];
    }];
    [[NSNotificationCenter defaultCenter] addObserverForName:LogoutNotification object:nil queue:nil usingBlock:^(NSNotification *note) {
        [self logout];
    }];
    
    NSString *token = [[NSUserDefaults standardUserDefaults] objectForKey:@"token"];
    if (token == nil) {
        //[self showLoginScreen];
        [self logout];
    } else {
        [self login];
    }
    return YES;
}

- (void)showLoginScreen {
    ViewController *viewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"ViewController"];
    [self.window makeKeyAndVisible];
    [self.window.rootViewController presentViewController:viewController animated:NO completion:nil];
    //self.window.rootViewController = loginViewController;
}

- (void)login {
    TabBarController *tabBarController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"TabBarController"];
    [self.window setRootViewController:tabBarController];
}

- (void)logout {
    ViewController *viewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"ViewController"];
    [self.window setRootViewController:viewController];
    
    //[self showLoginScreen];
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
