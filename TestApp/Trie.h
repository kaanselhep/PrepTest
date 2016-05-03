//
//  Trie.h
//  TestApp
//
//  Created by Kaan Ersan on 2016-05-03.
//  Copyright © 2016 Kaan Ersan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Trie : NSObject

@property (nonatomic, strong) NSMutableArray *children;
@property (nonatomic, strong) NSString *key;
@property (nonatomic, readonly) BOOL isFinal;

-(id)initWithKey:(NSString *)key;
-(void)addWord:(NSString *)word;

@end