//
// Created by akuraru on 2014/03/08.
// Copyright (c) 2014 akuraru. All rights reserved.
//

#import "LocalNotificationManager.h"


@implementation LocalNotificationManager {

}
+ (void)reset {
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
}
@end