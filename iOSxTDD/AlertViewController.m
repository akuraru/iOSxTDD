//
//  AertViewController.m
//  iOSxTDD
//
//  Created by akuraru on 2014/02/25.
//  Copyright (c) 2014年 akuraru. All rights reserved.
//

#import <Lambda-Alert/CCAlertView.h>
#import "AlertViewController.h"


@interface AlertViewController () <UIAlertViewDelegate>

@end

@implementation AlertViewController

- (IBAction)showAlert:(id)sender {
    CCAlertView *alert = [[CCAlertView alloc] initWithTitle:@"title" message:@"message"];
    [alert addButtonWithTitle:@"OK" block:nil];
    [alert show];
}
- (IBAction)popViewController:(id)sender {
    __weak typeof(self) this = self;
    CCAlertView *alert = [[CCAlertView alloc] initWithTitle:@"pop view controller" message:nil];
    [alert addButtonWithTitle:@"OK" block:^{
        [this.navigationController popToRootViewControllerAnimated:YES];
    }];
    [alert addButtonWithTitle:@"Cancel" block:nil];
    [alert show];
}
@end
