//
// Created by akuraru on 2014/03/08.
// Copyright (c) 2014 akuraru. All rights reserved.
//

#import "LocalNotificationManager.h"


@implementation LocalNotificationManager {

}
+ (void)reset {
    [[UIApplication sharedApplication] cancelAllLocalNotifications];

    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"alerm"]) {
        [self setupNext9];
        [self setupAfter3days];
        [self setupWhiteDay];
    }
}

+ (void)setupNext9 {
    [self localNotificationForBody:@"" fireDate:[NSDate date]];
}

+ (void)setupAfter3days {
    [self localNotificationForBody:@"" fireDate:[NSDate date]];
}

+ (void)setupWhiteDay {
    [self localNotificationForBody:@"" fireDate:[NSDate date]];
}

+ (void)localNotificationForBody:(NSString *)body fireDate:(NSDate *)fireDate {
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    notification.fireDate = fireDate;
    notification.alertBody = body;
    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
}
@end