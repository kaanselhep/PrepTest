//
//  OperationViewController.h
//  TestApp
//
//  Created by Kaan Ersan on 2016-05-14.
//  Copyright © 2016 Kaan Ersan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface OperationViewController : UIViewController {
	NSOperationQueue *operationQueue;
}

@property (nonatomic, weak) IBOutlet UILabel *label1;
@property (nonatomic, weak) IBOutlet UILabel *label2;
@property (nonatomic, weak) IBOutlet UILabel *label3;
@property (nonatomic, weak) IBOutlet UILabel *timeLabel;

- (IBAction)applyBackgroundColor1;
- (IBAction)applyBackgroundColor2;
- (IBAction)applyBackgroundColor3;

- (void)counterTask;
- (void)colorRotatorTask;

@end
