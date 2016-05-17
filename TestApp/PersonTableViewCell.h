//
//  PersonTableViewCell.h
//  TestApp
//
//  Created by Kaan Ersan on 2016-05-16.
//  Copyright © 2016 Kaan Ersan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PersonTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UIImageView *imageView;
@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *fbIdLabel;

@end