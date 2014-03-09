#import "Kiwi.h"
#import "LocalNotificationManager.h"

@interface LocalNotificationManager ()
+ (void)setupNext9;
+ (void)setupAfter3days;
+ (void)setupWhiteDay;
@end

SPEC_BEGIN(LocalNotificationManagerSpec)
describe(@"LocalNotificationManager", ^{
    describe(@"reset", ^{
        __block UIApplication *application;
        beforeEach(^{
            application = [UIApplication mock];
            [UIApplication stub:@selector(sharedApplication) andReturn:application];
        });
        it(@"cancel all", ^{
            [[application should] receive:@selector(cancelAllLocalNotifications)];
            [[LocalNotificationManager should] receive:@selector(setupNext9)];
            [[LocalNotificationManager should] receive:@selector(setupAfter3days)];
            [[LocalNotificationManager should] receive:@selector(setupWhiteDay)];

            [LocalNotificationManager reset];
        });
    });
});
SPEC_END