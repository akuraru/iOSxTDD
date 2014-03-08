//
//  AppDelegate.m
//  iOSxTDD
//
//  Created by akuraru on 2014/02/15.
//  Copyright (c) 2014年 akuraru. All rights reserved.
//

#import "AppDelegate.h"
#import "LocalNotificationManager.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    [LocalNotificationManager reset];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
}

- (void)applicationWillTerminate:(UIApplication *)application {
}
@end
