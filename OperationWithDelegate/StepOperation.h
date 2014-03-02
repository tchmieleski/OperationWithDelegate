//
//  StepOperation.h
//  OperationWithDelegate
//
//  Created by Troy Chmieleski on 3/2/14.
//  Copyright (c) 2014 Troy Chmieleski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseOperation.h" 

typedef void(^StepHandler)();

@interface StepOperation : BaseOperation

@property (copy) StepHandler stepCompletionBlock;

- initWithDelay:(NSTimeInterval)delay;

@end
