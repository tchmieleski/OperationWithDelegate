//
//  StepOperation.m
//  OperationWithDelegate
//
//  Created by Troy Chmieleski on 3/2/14.
//  Copyright (c) 2014 Troy Chmieleski. All rights reserved.
//

#import "StepOperation.h"

@implementation StepOperation {
	NSTimeInterval _delay;
}

- (void)start {
	[self step];
	
	[self setFinished:NO];
	[self setExecuting:YES];
}

- (id)initWithDelay:(NSTimeInterval)delay {
	self = [super init];
	
	if (self) {
		_delay = delay;
	}
	
	return self;
}

#pragma mark - Step

- (void)step {
	NSTimer *timer = [NSTimer timerWithTimeInterval:_delay target:self selector:@selector(didFinishStep) userInfo:nil repeats:NO];
	
	[[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
}

- (void)didFinishStep {
	if (self.stepCompletionBlock) {
		self.stepCompletionBlock();
	}
	
	[self done];
}

- (void)done {
	[self setExecuting:NO];
	[self setFinished:YES];
}

@end
