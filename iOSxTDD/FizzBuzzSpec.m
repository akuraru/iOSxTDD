//
//  FizzBuzzSpec.m
//  iOSxTDD
//
//  Created by akuraru on 2014/02/02.
//  Copyright (c) 2014年 akuraru. All rights reserved.
//

#import "Kiwi.h"
#import "FizzBuzz.h"

SPEC_BEGIN(FizzBuzzSpec)
context(@"FizzBuzz", ^{
    __block FizzBuzz *fizzBuzz;
    beforeAll(^{
        fizzBuzz = [[FizzBuzz alloc] init];
    });
    it(@"1", ^{
        [[[fizzBuzz at:1] should] equal:@"1"];
    });
    it(@"3", ^{
        [[[fizzBuzz at:3] should] equal:@"Fizz"];
    });
    it(@"5", ^{
        [[[fizzBuzz at:5] should] equal:@"Buzz"];
    });
    it(@"15", ^{
        [[[fizzBuzz at:15] should] equal:@"FizzBuzz"];
    });
});
SPEC_END