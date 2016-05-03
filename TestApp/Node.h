//
//  Node.h
//  TestApp
//
//  Created by Kaan Ersan on 2016-04-26.
//  Copyright © 2016 Kaan Ersan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Node : NSObject

@property (nonatomic, assign) int value;
@property (nonatomic, strong) Node *next;

@end
