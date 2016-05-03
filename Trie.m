//
//  Trie.m
//  TestApp
//
//  Created by Kaan Ersan on 2016-05-03.
//  Copyright © 2016 Kaan Ersan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Trie.h"

@implementation Trie

-(id)initWithKey:(NSString *)key {
	
	if (self = [super init]) {
		_key = key;
		_children = [NSMutableArray new];
	}
	return self;
}

-(void)addWord:(NSString *)word {
	
	if (!word.length) {
		return;
	}
	
	Trie *childToUse;
	//Grab the first character
	NSString *firstCharacter = [word substringToIndex:1];
	
	//Traverse children until we find the position to add the letter
	for (Trie *child in _children) {
		if ([child.key isEqualToString:firstCharacter]) {
			childToUse = child;
			break;
		}
	}
	
	if (! childToUse) {
		childToUse = [[Trie alloc] initWithKey:firstCharacter];
		[_children addObject:childToUse];
	}
	
	//Recursive call to add the rest of the word letters
	[childToUse addWord:[word substringFromIndex:1]];
}

- (BOOL)isFinal {
	if (!_children.count) { return YES; } else { return NO; };
}

@end