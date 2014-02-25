//
//  AertViewController.m
//  iOSxTDD
//
//  Created by akuraru on 2014/02/25.
//  Copyright (c) 2014年 akuraru. All rights reserved.
//

#import "AlertViewController.h"

@interface AlertViewController () <UIAlertViewDelegate>

@end

@implementation AlertViewController

- (IBAction)showAlert:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] init];
    alert.title = @"title";
    alert.message = @"message";
    [alert addButtonWithTitle:@"OK"];
    alert.delegate = self;
    alert.tag = 0;
    [alert show];
    
}
- (IBAction)popViewController:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] init];
    alert.title = @"pop view controller";
    [alert addButtonWithTitle:@"OK"];
    [alert addButtonWithTitle:@"Cancel"];
    [alert setCancelButtonIndex:1];
    alert.delegate = self;
    alert.tag = 1;
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (alertView.tag == 1) {
        if (buttonIndex == 0) {
            [self.navigationController popToRootViewControllerAnimated:YES];
        }
    }
}
@end
