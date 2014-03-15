#import "Kiwi.h"
#import "LocalNotificationManager.h"
#import "NSDate+AZDateBuilder.h"


@interface LocalNotificationManager ()
+ (void)setupNext9;
+ (void)setupAfter3days;
+ (void)setupWhiteDay;
@end

SPEC_BEGIN(LocalNotificationManagerSpec)
describe(@"LocalNotificationManager", ^{
    context(@"application", ^{
        __block UIApplication *application;
        beforeEach(^{
            application = [UIApplication mock];
            [UIApplication stub:@selector(sharedApplication) andReturn:application];
        });
        describe(@"reset", ^{
            context(@"alerm off", ^{
                beforeEach(^{
                    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"alerm"];
                });
                it(@"cancel all", ^{
                    [[application should] receive:@selector(cancelAllLocalNotifications)];

                    [LocalNotificationManager reset];
                });
            });
            context(@"alerm on", ^{
                beforeEach(^{
                    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"alerm"];
                });
                it(@"cancel all", ^{
                    [[application should] receive:@selector(cancelAllLocalNotifications)];
                    [[LocalNotificationManager should] receive:@selector(setupNext9)];
                    [[LocalNotificationManager should] receive:@selector(setupAfter3days)];
                    [[LocalNotificationManager should] receive:@selector(setupWhiteDay)];

                    [LocalNotificationManager reset];
                });
            });
            context(@"receive Alert", ^{
                __block NSMutableArray *notifications;
                __block NSDate *date;
                beforeEach(^{
                    date = [NSDate AZ_dateByUnit:@{
                        AZ_DateUnit.year : @2014,
                        AZ_DateUnit.month : @3,
                        AZ_DateUnit.day : @9,
                        AZ_DateUnit.hour : @12,
                    }];
                    [NSDate stub:@selector(date) andReturn:date];
                    
                    notifications = [NSMutableArray array];
                    [[application should] receive:@selector(cancelAllLocalNotifications)];
                    [application stub:@selector(scheduleLocalNotification:) withBlock:^id(NSArray *params) {
                        [notifications addObject:params[0]];
                        return nil;
                    }];
                    [LocalNotificationManager reset];
                });
                it(@"count", ^{
                    [[theValue(notifications.count) should] equal:theValue(3)];
                });
                it(@"scheduled local notification", ^{
                    for (UILocalNotification *n in notifications) {
                        if ([n.alertBody isEqualToString:@"9時になりました"]) {
                            [[n.fireDate should] equal:[NSDate AZ_dateByUnit:@{
                                AZ_DateUnit.year : @2014,
                                AZ_DateUnit.month : @3,
                                AZ_DateUnit.day : @10,
                                AZ_DateUnit.hour : @9,
                            }]];
                        } else if ([n.alertBody isEqualToString:@"3日経ちました"]) {
                            [[n.fireDate should] equal:[NSDate AZ_dateByUnit:@{
                                AZ_DateUnit.year : @2014,
                                AZ_DateUnit.month : @3,
                                AZ_DateUnit.day : @12,
                                AZ_DateUnit.hour : @12,
                            }]];
                        } else if ([n.alertBody isEqualToString:@"明日はホワイトデー"]) {
                            [[n.fireDate should] equal:[NSDate AZ_dateByUnit:@{
                                AZ_DateUnit.year : @2014,
                                AZ_DateUnit.month : @3,
                                AZ_DateUnit.day : @13,
                                AZ_DateUnit.hour : @9,
                            }]];
                        } else {
                            fail(@"not contein alertBody : %@", n);
                        }
                    }
                });
            });
        });
    });
});
SPEC_END