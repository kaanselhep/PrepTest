//
//  TestClass.h
//  TestApp
//
//  Created by Kaan Ersan on 2016-04-25.
//  Copyright © 2016 Kaan Ersan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <stdio.h>
#import "Tree.h"
#import "Node.h"

@interface TestClass : NSObject

+(int)get_max_profit:(int *)stockPrices size:(int)arraySize;
+(int *)getProductsOfAllIntsExceptAtIndex:(int *)numbers size:(int)numbersSize;
+(int)productOfBeforeIndex:(int)index array:(int*)array;
+(int)productOfAfterIndex:(int)index array:(int*)array size:(int)arraySize;
+(BOOL)wordIsInTheList:(NSArray *)wordList word:(NSString *)word;
+(int)higestProduct:(NSArray *)numbers;
+(int)findHighestProduct:(NSArray *)numbers usingUpto:(int)elements;
+(int)isSameTree:(Tree *)A B:(Tree *)B;
+(int)isPower:(int)A;
+(int)numSetBits:(unsigned int)A;
+(unsigned int)int_to_binary:(unsigned int)k;
+(unsigned int)binary_to_int:(unsigned int)k;
+(int *)sumToZero:(int *)A len:(int)length;
+(int)GCD:(unsigned int)a b:(unsigned int)b;
+(int)lengthOfLastword:(NSString *)sentence;
+(int)GCDRecursive:(unsigned int)a b:(unsigned int)b;
+(void)treeToList:(Tree *)root head:(Tree **)head;
+(int)findSingleNumber:(int *)numbers length:(int)len;
+(int)findLoop:(Node *)list;
+(int)flipSwitchesCount:(int *)bulbs size:(int)size;
+(int *)bubbleSort:(int *)array len:(int)length;
+(void)merge:(int *)A L:(int *)L leftCount:(int)leftCount R:(int *)R rightCount:(int)rightCount;
+(void)mergeSort:(int *)array len:(int)length;
+(int)mice:(int *)A len:(int)n1 B:(int *)B len:(int)n2;
+(void)printArray:(int *)array len:(int)length;
+(void)printCharArray:(char *)array len:(int)length;
+(void)printTreeAsList:(Tree *)tree;
+(int)isPrime:(int)A;
+(NSMutableArray *)findPrimesAddToX:(int)X;
+(NSMutableArray *)findAllPrimesLessThan:(int)num;
+(void)print2DArraySorted:(NSArray *)array;
+(bool)findContinuousSum:(NSArray *)array X:(int)X;
+(void)reverseWord:(char *)word len:(int)length;
+(void)reverseSentence:(char *)sentence len:(int)length;
+(BOOL)evaluateInput:(NSString *)input;
+(void)findPrefix:(NSArray *)input;
+(void)printDictionary:(NSDictionary *)dic;

@end