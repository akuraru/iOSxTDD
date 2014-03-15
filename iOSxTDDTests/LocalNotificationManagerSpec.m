#import "Kiwi.h"
#import "LocalNotificationManager.h"


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
                beforeEach(^{
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
            });
        });
    });
});
SPEC_END