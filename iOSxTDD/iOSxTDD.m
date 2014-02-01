//
//  iOSxTDD.m
//  iOSxTDD
//
//  Created by akuraru on 2014/01/31.
//  Copyright (c) 2014年 akuraru. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FizzBuzz.h"

@interface iOSxTDD : XCTestCase

@end

@implementation iOSxTDD

- (void)test1 {
    FizzBuzz *fizzBuzz = [[FizzBuzz alloc] init];
    NSString *result = [fizzBuzz at:1];
    XCTAssertEqualObjects(result, @"1", @"1を送ると文字列の1を返す");
}

@end
