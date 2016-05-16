//
//  OperationViewController.m
//  TestApp
//
//  Created by Kaan Ersan on 2016-05-14.
//  Copyright © 2016 Kaan Ersan. All rights reserved.
//

#import "OperationViewController.h"

@implementation OperationViewController

NSDate *firstTime;

- (void)viewDidLoad {
	
	[super viewDidLoad];
	
	firstTime = [NSDate date];
	NSLog(@"firstTime: %@", firstTime);
	
	NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(setTimerText:) userInfo:nil repeats:YES];
	[timer fire];
	
	operationQueue = [NSOperationQueue new];
	
	//NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(counterTask) object:nil];
	//[thread start];
	
	NSInvocationOperation *operation = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(counterTask) object:nil];
	
	[operationQueue addOperation:operation];
	
	operation = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(colorRotatorTask) object:nil];
	
	[operationQueue addOperation:operation];
	
}

- (IBAction)applyBackgroundColor1 {
	[self.view setBackgroundColor:[UIColor colorWithRed:255.0/255.0 green:204.0/255.0 blue:102.0/255.0 alpha:1.0]];
}

- (IBAction)applyBackgroundColor2 {
	[self.view setBackgroundColor:[UIColor colorWithRed:204.0/255.0 green:255.0/255.0 blue:102.0/255.0 alpha:1.0]];
}

- (IBAction)applyBackgroundColor3 {
	[self.view setBackgroundColor:[UIColor whiteColor]];
}

- (void)setTimerText:(id)sender {
	
	NSTimeInterval timeElapsed = fabs([firstTime timeIntervalSinceNow]);
	
	//minutes
	NSString *minutes = [NSString stringWithFormat: @"%.2d", (int)timeElapsed/60];
	NSString *seconds = [NSString stringWithFormat: @"%.2d", (int)timeElapsed%60];
	
	NSString *time = [[minutes stringByAppendingString:@":"] stringByAppendingString:seconds];
	
	self.timeLabel.text = [@"Time Elapsed: " stringByAppendingString:time];
}

- (void)counterTask {
	
	for (int i=0; i<10000000; i++) {
		if (i%100 == 0) {
			
			[self.label1 performSelectorOnMainThread:@selector(setText:) withObject:[NSString stringWithFormat:@"%d", i] waitUntilDone:YES];
		}
	}
	
	[self.label1 performSelectorOnMainThread:@selector(setText:) withObject:@"Thread #1 has finished" waitUntilDone:NO];
	
}

- (void)colorRotatorTask {
	
	UIColor *customColor;
	
	for (int i=0; i<500; i++) {
		
		//Create 3 float numbers with values 0.0 to 1.0
		float redColorValue = (arc4random()%100) * 1.0 / 100;
		float greenColorValue = (arc4random()%100) * 1.0 / 100;
		float blueColorValue = (arc4random()%100) * 1.0 / 100;
		
		customColor = [UIColor colorWithRed:redColorValue green:greenColorValue blue:blueColorValue alpha:1.0];
		
		[self.label2 performSelectorOnMainThread:@selector(setBackgroundColor:) withObject:customColor waitUntilDone:YES];
		[self.label3 performSelectorOnMainThread:@selector(setText:) withObject:[NSString stringWithFormat:@"Red: %.2f\nGreen :%.2f\nBlue: %.2f\nIteration #: %d", redColorValue, greenColorValue, blueColorValue, i] waitUntilDone:YES];
		[NSThread sleepForTimeInterval:0.4];
	}
	
	[self.label3 performSelectorOnMainThread:@selector(setText:) withObject:@"Thread #2 has finished" waitUntilDone:NO];
	
	
}




@end



