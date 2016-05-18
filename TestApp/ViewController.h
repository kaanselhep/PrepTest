//
//  ViewController.h
//  TestApp
//
//  Created by Kaan Ersan on 2016-04-25.
//  Copyright © 2016 Kaan Ersan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController <CLLocationManagerDelegate> {
	IBOutlet UIButton *loadTableButton;
}

@property (nonatomic, weak) IBOutlet UIButton *loadTableButton;
-(IBAction)loadTableTapped:(id)sender;

@end

