//
// Created by akuraru on 2014/03/08.
// Copyright (c) 2014 akuraru. All rights reserved.
//

#import "LocalNotificationManager.h"


@implementation LocalNotificationManager {

}
+ (void)reset {
    [[UIApplication sharedApplication] cancelAllLocalNotifications];

    [self setupNext9];
    [self setupAfter3days];
    [self setupWhiteDay];
}

+ (void)setupNext9 {

}

+ (void)setupAfter3days {

}

+ (void)setupWhiteDay {

}
@end