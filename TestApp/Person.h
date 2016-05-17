//
//  Person.h
//  TestApp
//
//  Created by Kaan Ersan on 2016-05-16.
//  Copyright © 2016 Kaan Ersan. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface Person : NSManagedObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *facebookId;

@end