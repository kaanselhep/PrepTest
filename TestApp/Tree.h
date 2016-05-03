//
//  Tree.h
//  TestApp
//
//  Created by Kaan Ersan on 2016-04-26.
//  Copyright © 2016 Kaan Ersan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tree : NSObject

@property (nonatomic, assign) int data;
@property (nonatomic, strong) Tree *right;
@property (nonatomic, strong) Tree *left;

@end
