//
//  StepperOperation.h
//  OperationWithDelegate
//
//  Created by Troy Chmieleski on 3/2/14.
//  Copyright (c) 2014 Troy Chmieleski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseOperation.h"

@protocol OperationDelegate <NSObject>

- (void)didFinishStep1;
- (void)didFinishStep2;
- (void)didFinishStep3;
- (void)didFinishStep4;

@end

@interface StepperOperation : BaseOperation

@property (weak) id <OperationDelegate> delegate;

@end
