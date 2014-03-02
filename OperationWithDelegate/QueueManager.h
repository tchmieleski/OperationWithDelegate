//
//  QueueManager.h
//  OperationWithDelegate
//
//  Created by Troy Chmieleski on 3/2/14.
//  Copyright (c) 2014 Troy Chmieleski. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QueueManager : NSObject

@property (strong) NSOperationQueue *queue;

+ (instancetype)sharedQueueManager;

@end
