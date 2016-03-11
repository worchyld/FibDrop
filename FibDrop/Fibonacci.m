//
//  Fibonacci.m
//  FibDrop
//
//  Created by Amarjit on 11/03/2016.
//  Copyright © 2016 Amarjit. All rights reserved.
//

#import "Fibonacci.h"

static int kLimit = 10;

@implementation Fibonacci

// Notation: f(n) = f(n-1) + f(n-2)
+ (unsigned long) sequenceFromNumber:(unsigned long)n
{
    if ( n <=2 ) {
        return 1;
    }

    unsigned long f1;
    unsigned long f2;

    f1 = [self sequenceFromNumber:n-1];
    f2 = [self sequenceFromNumber:n-2];

    unsigned long f = (f1 + f2);
    return f;
}

+ (void) createFibonacciSequenceWithCompletion:(void (^)(NSArray *sequence, NSError *error))completion
{
    __block NSMutableArray *sequence = [NSMutableArray arrayWithCapacity:kLimit];

    dispatch_queue_t sequenceQueue = dispatch_queue_create("sequenceQueue", 0);

    dispatch_async(sequenceQueue, ^{
        for (int i=0; i<kLimit; i++)
        {
            unsigned long n = [self sequenceFromNumber:(unsigned long)i];
            NSNumber *numb = [[NSNumber alloc] initWithLong:n];
            [sequence addObject:numb];
        }

        dispatch_async(dispatch_get_main_queue(), ^{
            if (sequence.count>0) {
                
                completion(sequence, nil);
            }
            else
            {
                NSDictionary *info = @{ NSLocalizedDescriptionKey : @"Error", NSLocalizedFailureReasonErrorKey : @"Unknown error occured creating sequence" };

                NSError *error = [NSError errorWithDomain:@"uk.co.fibdrop" code:0 userInfo:info];
                completion(nil, error);
            }
        });
    });


}

@end
