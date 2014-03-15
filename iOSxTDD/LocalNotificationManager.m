//
// Created by akuraru on 2014/03/08.
// Copyright (c) 2014 akuraru. All rights reserved.
//

#import "LocalNotificationManager.h"
#import "NSDate+AZDateBuilder.h"


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
    [self localNotificationForBody:@"9時になりました" fireDate:[[[NSDate date] dateByAddingTimeInterval:24 * 60 *60]AZ_dateByUnit:@{
        AZ_DateUnit.hour : @9,
    }]];
}

+ (void)setupAfter3days {
    [self localNotificationForBody:@"3日経ちました" fireDate:[[NSDate date] dateByAddingTimeInterval:3 * 24 * 60 *60]];
}

+ (void)setupWhiteDay {
    [self localNotificationForBody:@"明日はホワイトデー" fireDate:[NSDate AZ_dateByUnit:@{
        AZ_DateUnit.year : @2014,
        AZ_DateUnit.month : @3,
        AZ_DateUnit.day : @13,
        AZ_DateUnit.hour : @9,
    }]];
}

+ (void)localNotificationForBody:(NSString *)body fireDate:(NSDate *)fireDate {
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    notification.fireDate = fireDate;
    notification.alertBody = body;
    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
}
@end