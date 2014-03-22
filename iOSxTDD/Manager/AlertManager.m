//
//  AlertManager.m
//  iOSxTDD
//
//  Created by akuraru on 2014/03/02.
//  Copyright (c) 2014年 akuraru. All rights reserved.
//

#import <Lambda-Alert/CCAlertView.h>
#import "AlertManager.h"

@implementation AlertManager

+ (void)test {
    CCAlertView *alert = [[CCAlertView alloc] initWithTitle:@"title" message:@"message"];
    [alert addButtonWithTitle:@"OK" block:nil];
    [alert show];
}

+ (void)popViewController:(void (^)())complete {
    CCAlertView *alert = [[CCAlertView alloc] initWithTitle:@"pop view controller" message:nil];
    [alert addButtonWithTitle:@"OK" block:complete];
    [alert addButtonWithTitle:@"Cancel" block:nil];
    [alert show];

}
@end
