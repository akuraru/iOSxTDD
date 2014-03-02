//
//  AlertManager.h
//  iOSxTDD
//
//  Created by akuraru on 2014/03/02.
//  Copyright (c) 2014年 akuraru. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AlertManager : NSObject

+ (void)test;

+ (void)popViewController:(void (^)())complete;
@end
