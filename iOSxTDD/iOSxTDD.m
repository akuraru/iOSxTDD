//
//  iOSxTDD.m
//  iOSxTDD
//
//  Created by akuraru on 2014/01/31.
//  Copyright (c) 2014年 akuraru. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface iOSxTDD : XCTestCase

@end

@implementation iOSxTDD

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample
{
    XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
}

@end
