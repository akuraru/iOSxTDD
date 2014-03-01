#import "Kiwi.h"
#import "AlertViewController.h"

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
            UIAlertView *mock = [UIAlertView nullMock];
            [UIAlertView stub:@selector(alloc) andReturn:mock];
            [[mock should] receive:@selector(show)];
            [[mock should] receive:@selector(setTitle:) withArguments:@"title"];
            
            [controller showAlert:nil];
        });
    });
    describe(@"popViewController:", ^{
        it(@"receive show alertView", ^{
            UIAlertView *mock = [UIAlertView nullMock];
            [UIAlertView stub:@selector(alloc) andReturn:mock];
            [[mock should] receive:@selector(show)];
            [[mock should] receive:@selector(setTitle:) withArguments:@"pop view controller"];
            
            [controller popViewController:nil];
        });
    });
});
SPEC_END