//
//  AertViewController.m
//  iOSxTDD
//
//  Created by akuraru on 2014/02/25.
//  Copyright (c) 2014年 akuraru. All rights reserved.
//

#import "AlertViewController.h"
#import "AlertManager.h"

@interface AlertViewController () <UIAlertViewDelegate>

@end

@implementation AlertViewController

- (IBAction)showAlert:(id)sender {
    [AlertManager test];
}
- (IBAction)popViewController:(id)sender {
    __weak typeof(self) this = self;
    [AlertManager popViewController:^{
        [this.navigationController popToRootViewControllerAnimated:YES];
    }];
}
@end
