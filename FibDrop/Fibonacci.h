//
//  Fibonacci.h
//  FibDrop
//
//  Created by Amarjit on 11/03/2016.
//  Copyright © 2016 Amarjit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <math.h>

@interface Fibonacci : NSObject

/**
 Fibonacci sequence is a set of numbers that starts with a one or a zero, followed by a one, 
 and proceeds based on the rule that each number (called a Fibonacci number) is equal to the sum 
 of the preceding two numbers. 
 
 If the Fibonacci sequence is denoted F ( n ), where n is the first term in the sequence, 
 the following equation obtains for n = 0, where the first two terms are defined as 0 and 1 by convention:

 F (0) = 0, 1, 1, 2, 3, 5, 8, 13, 21, 34 ...
 
 Notation: f(n) = f(n-1) + f(n-2)
 **/
+ (unsigned long) sequenceFromNumber:(unsigned long)n;

// Uses a hard limit
+ (void) createFibonacciSequenceWithCompletion:(void (^)(NSArray *sequence, NSError *error))completion;

@end
