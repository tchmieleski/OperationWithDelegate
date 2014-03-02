//
//  BaseOperation.m
//  OperationWithDelegate
//
//  Created by Troy Chmieleski on 3/2/14.
//  Copyright (c) 2014 Troy Chmieleski. All rights reserved.
//

#import "BaseOperation.h"

@implementation BaseOperation

@synthesize finished = _finished;
@synthesize executing = _executing;
@synthesize concurrent = _concurrent;

- (void)start {
	// no-op
}

#pragma mark - finished

- (BOOL)isFinished {
	return _finished;
}

- (void)setFinished:(BOOL)finished {
	[self willChangeValueForKey:@"isFinished"];
	_finished = finished;
	[self didChangeValueForKey:@"isFinished"];
}

#pragma mark - executing

- (BOOL)isExecuting {
	return _executing;
}

- (void)setExecuting:(BOOL)executing {
	[self willChangeValueForKey:@"isExecuting"];
	_executing = executing;
	[self didChangeValueForKey:@"isExecuting"];
}

#pragma mark - concurrent

- (BOOL)isConcurrent {
	return _concurrent;
}

- (void)setConcurrent:(BOOL)concurrent {
	[self willChangeValueForKey:@"isConcurrent"];
	_concurrent = concurrent;
	[self didChangeValueForKey:@"isConcurrent"];
}

@end
