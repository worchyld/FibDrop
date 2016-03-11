//
//  FibDropTests.m
//  FibDropTests
//
//  Created by Amarjit on 11/03/2016.
//  Copyright © 2016 Amarjit. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Fibonacci.h"
#import <math.h>

@interface FibDropTests : XCTestCase

@end

@implementation FibDropTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {

    XCTestExpectation *expectation = [self expectationWithDescription:@"Valid Fibonacci sequence"];

    dispatch_queue_t myQueue = dispatch_queue_create("My Queue", NULL);
    dispatch_async(myQueue, ^{
        // Perform long running process
        for (int n=1; n<=16; n++) {
            //
            unsigned long number = [Fibonacci sequenceFromNumber:n];

            XCTAssertTrue([self isFibonacci:number]);

            NSLog(@"%ld", (unsigned long) number);
        }

        dispatch_async(dispatch_get_main_queue(), ^{
            // Update the UI
            [expectation fulfill];

        });
    });

    // The test will pause here, running the run loop, until the timeout is hit
    // or all expectations are fulfilled.
    [self waitForExpectationsWithTimeout:1 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Error - %@", error.localizedDescription);
        }
    }];
}

// Adapted from http://stackoverflow.com/questions/2432669/test-if-a-number-is-fibonacci
- (BOOL) isFibonacci:(unsigned long) w
{
    double X1 = 5 * pow(w, 2) + 4;
    double X2 = 5 * pow(w, 2) - 4;

    long X1_sqrt = (long) sqrtl(X1);
    long X2_sqrt = (long) sqrtl(X2);

    return (X1_sqrt * X1_sqrt == X1) || (X2_sqrt * X2_sqrt == X2);
    //    return (X1_sqrt * X1_sqrt == X1) || (X2_sqrt * X2_sqrt == X2) ;

    return YES;
}



- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
