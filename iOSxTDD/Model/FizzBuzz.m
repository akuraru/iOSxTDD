//
//  FizzBuzz.m
//  iOSxTDD
//
//  Created by akuraru on 2014/01/31.
//  Copyright (c) 2014年 akuraru. All rights reserved.
//

#import "FizzBuzz.h"

@implementation FizzBuzz

- (NSString *)at:(NSInteger)n {
    return !(n%15) ? @"FizzBuzz" : !(n%3) ? @"Fizz" : !(n%5) ? @"Buzz" : [@(n) stringValue];
}
@end
