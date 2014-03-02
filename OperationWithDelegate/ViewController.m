//
//  ViewController.m
//  OperationWithDelegate
//
//  Created by Troy Chmieleski on 3/2/14.
//  Copyright (c) 2014 Troy Chmieleski. All rights reserved.
//

#import "ViewController.h"

#import "QueueManager.h"
#import "StepperOperation.h"

@interface ViewController () <OperationDelegate>

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	[self operate];
}

- (void)operate {
	QueueManager *sharedQueueManager = [QueueManager sharedQueueManager];
	
	NSOperationQueue *queue = sharedQueueManager.queue;
	
	StepperOperation *operation = [[StepperOperation alloc] init];
	[operation setDelegate:self];
	
	[queue addOperation:operation];
}

- (void)didFinishStep1 {
	NSLog(@"did finish step 1");
}

- (void)didFinishStep2 {
	NSLog(@"did finish step 2");
}

- (void)didFinishStep3 {
	NSLog(@"did finish step 3");
}

- (void)didFinishStep4 {
	NSLog(@"did finish step 4");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
