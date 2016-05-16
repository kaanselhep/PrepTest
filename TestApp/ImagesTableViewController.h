//
//  ImagesTableViewController.h
//  TestApp
//
//  Created by Kaan Ersan on 2016-05-14.
//  Copyright © 2016 Kaan Ersan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface ImagesTableViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *people;
@property (nonatomic, weak) IBOutlet UIBarButtonItem *addButton;
@property (nonatomic, strong) IBOutlet UITableView *tableView;

@end