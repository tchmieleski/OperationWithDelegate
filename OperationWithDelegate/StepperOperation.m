//
//  StepperOperation.m
//  OperationWithDelegate
//
//  Created by Troy Chmieleski on 3/2/14.
//  Copyright (c) 2014 Troy Chmieleski. All rights reserved.
//

#import "StepperOperation.h"
#import "StepOperation.h"

@implementation StepperOperation

- (void)start {
	// from this point on, the operation is officially executing, isExecuting needs to be KVO compliant
	[self setExecuting:YES];
	[self setFinished:NO];
	
	[self steps];
}

- (void)steps {
	NSOperationQueue *queue = [[NSOperationQueue alloc] init];
	
	NSRange range = NSMakeRange(0, 10);
		
	StepOperation *step1Operation = [[StepOperation alloc] initWithDelay:[self randomTimeIntervalWithRange:range]];
	StepOperation *step2Operation = [[StepOperation alloc] initWithDelay:[self randomTimeIntervalWithRange:range]];
	StepOperation *step3Operation = [[StepOperation alloc] initWithDelay:[self randomTimeIntervalWithRange:range]];
	StepOperation *step4Operation = [[StepOperation alloc] initWithDelay:[self randomTimeIntervalWithRange:range]];
	
	NSArray *stepOperations = @[step1Operation, step2Operation, step3Operation, step4Operation];
	
	NSBlockOperation *finishOperation = [NSBlockOperation blockOperationWithBlock:^{
		[self done];
	}];
	
	step1Operation.stepCompletionBlock = ^() {
		if ([self.delegate respondsToSelector:@selector(didFinishStep1)]) {
			[self.delegate didFinishStep1];
		}
	};
	
	step2Operation.stepCompletionBlock = ^() {
		if ([self.delegate respondsToSelector:@selector(didFinishStep2)]) {
			[self.delegate didFinishStep2];
		}
	};
	
	step3Operation.stepCompletionBlock = ^() {
		if ([self.delegate respondsToSelector:@selector(didFinishStep3)]) {
			[self.delegate didFinishStep3];
		}
	};
	
	step4Operation.stepCompletionBlock = ^() {
		if ([self.delegate respondsToSelector:@selector(didFinishStep4)]) {
			[self.delegate didFinishStep4];
		}
	};
	
	// all these steps should be performed concurrently, but we don't know how long a step will take
	// only when all the steps are completed should the container operation be considered finished
	NSMutableArray *operations = [NSMutableArray array];
	
	for (StepOperation *stepOperation in stepOperations) {
		[finishOperation addDependency:stepOperation];
		[operations addObject:stepOperation];
	}
	
	[operations addObject:finishOperation];
	
	[queue addOperations:operations waitUntilFinished:NO];
}

- (NSTimeInterval)randomTimeIntervalWithRange:(NSRange)range {
	NSTimeInterval timeInterval = 0;
	
	timeInterval = arc4random() % range.length;
	
	timeInterval += range.location;
	
	return timeInterval;
}

- (void)done {
	[self setExecuting:NO];
	[self setFinished:YES];
	
	self.delegate = nil;
}

@end
