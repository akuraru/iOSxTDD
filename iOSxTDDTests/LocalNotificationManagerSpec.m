#import "Kiwi.h"
#import "LocalNotificationManager.h"

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
            [LocalNotificationManager reset];
        });
    });
});
SPEC_END