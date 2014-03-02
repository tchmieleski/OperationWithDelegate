//
//  BaseOperation.h
//  OperationWithDelegate
//
//  Created by Troy Chmieleski on 3/2/14.
//  Copyright (c) 2014 Troy Chmieleski. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseOperation : NSOperation

/**
 *  Must override isExecuting, isFinished and isConcurrent in order to set up a concurrent operation. These overridden methods must be KVO compliant.
 */
@property (nonatomic, getter = isExecuting) BOOL executing;
@property (nonatomic, getter = isFinished) BOOL finished;
@property (nonatomic, getter = isConcurrent) BOOL concurrent;

@end
