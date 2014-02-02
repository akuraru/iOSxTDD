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

- (void)test3 {
    FizzBuzz *fizzBuzz = [[FizzBuzz alloc] init];
    NSString *result = [fizzBuzz at:3];
    XCTAssertEqualObjects(result, @"Fizz", @"3を送ると文字列のFizzを返す");
}

- (void)test5 {
    FizzBuzz *fizzBuzz = [[FizzBuzz alloc] init];
    NSString *result = [fizzBuzz at:5];
    XCTAssertEqualObjects(result, @"Buzz", @"5を送ると文字列のBuzzを返す");
}

- (void)test15 {
    FizzBuzz *fizzBuzz = [[FizzBuzz alloc] init];
    NSString *result = [fizzBuzz at:15];
    XCTAssertEqualObjects(result, @"FizzBuzz", @"15を送ると文字列のFizzBuzzを返す");
}

@end
