#import "Kiwi.h"
#import "AlertViewController.h"
#import "AlertManager.h"

@interface AlertViewController ()
- (IBAction)showAlert:(id)sender;
- (IBAction)popViewController:(id)sender;
@end

SPEC_BEGIN(AlertViewControllerSpec)
describe(@"AlertViewController", ^{
    __block AlertViewController *controller;
    beforeEach(^{
        controller = [[AlertViewController alloc] init];
    });
    describe(@"showAlert:", ^{
        it(@"receive show alertView", ^{
            [[AlertManager should] receive:@selector(test)];
            [controller showAlert:nil];
        });
    });
    describe(@"popViewController:", ^{
        it(@"receive show alertView", ^{
            [[AlertManager should] receive:@selector(popViewController:)];
            [controller popViewController:nil];
        });
    });
});
describe(@"AlertManager", ^{
    describe(@"test", ^{
        it(@"receive show alertView", ^{
            UIAlertView *mock = [UIAlertView nullMock];
            [UIAlertView stub:@selector(alloc) andReturn:mock];
            [[mock should] receive:@selector(initWithTitle:message:delegate:cancelButtonTitle:otherButtonTitles:) andReturn:mock];
            [[mock should] receive:@selector(show)];
            
            [AlertManager test];
        });
    });
    describe(@"popViewController:", ^{
        it(@"receive show alertView", ^{
            UIAlertView *mock = [UIAlertView nullMock];
            [UIAlertView stub:@selector(alloc) andReturn:mock];
            [[mock should] receive:@selector(initWithTitle:message:delegate:cancelButtonTitle:otherButtonTitles:) andReturn:mock];
            [[mock should] receive:@selector(show)];
            
            [AlertManager popViewController:nil];
        });
    });
});
SPEC_END