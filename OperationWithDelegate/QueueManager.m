//
//  QueueManager.m
//  OperationWithDelegate
//
//  Created by Troy Chmieleski on 3/2/14.
//  Copyright (c) 2014 Troy Chmieleski. All rights reserved.
//

#import "QueueManager.h"

@interface QueueManager ()

@end

@implementation QueueManager

+ (instancetype)sharedQueueManager {
	static QueueManager *sharedQueueManager;
	
	static dispatch_once_t onceToken;
	
	dispatch_once(&onceToken, ^{
		sharedQueueManager = [[QueueManager alloc] init];
	});
	
	return sharedQueueManager;
}

- (id)init {
    self = [super init];
	
    if (self) {
		_queue = [[NSOperationQueue alloc] init];
    }
	
    return self;
}

@end
