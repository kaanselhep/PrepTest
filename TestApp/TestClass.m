//
//  TestClass.m
//  TestApp
//
//  Created by Kaan Ersan on 2016-04-25.
//  Copyright © 2016 Kaan Ersan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TestClass.h"
#import "Tree.h"

#define PI 3.14519
#define RADIANS_TO_DEGREES(radians) ((radians) * (180.0 / PI))

@implementation TestClass

// **** LOOSE COUPLING ****
//In computing and systems design a loosely coupled system is one in which each of its components has, or makes use of,
//little or no knowledge of the definitions of other separate components. Sub-areas include the coupling of classes,
//interfaces, data, and services.

+(int)get_max_profit:(int *)stockPrices size:(int)arraySize {
	
	int minBuy = 99999;
	int maxSell = -9999;
	
	for (int i=0; i<arraySize; i++) {
		if (stockPrices[i] < minBuy) {
			minBuy = stockPrices[i];
		}
		
		if (stockPrices[i] > maxSell) {
			maxSell = stockPrices[i];
		}
	}
	
	printf([@"You should buy stocks for: %d and sell for: %d\n" UTF8String], minBuy, maxSell);
	
	
	return maxSell - minBuy;
}

+(BOOL)wordIsInTheList:(NSArray *)wordList word:(NSString *)word {
	
	for (int j=0; j<wordList.count; j++) {
		//Grab the word from our list
		NSString *aWord = [wordList objectAtIndex:j];
		int matchingChars = 0;
		
		//If words are not the same length, they can't be equal
		if (aWord.length != word.length) {
			continue;
		}
		
		for (int k=0; k<aWord.length; k++) {
			NSString *c = [word substringWithRange:NSMakeRange(k, 1)];
			if ([c isEqualToString:@"."]) {
				matchingChars++;
				continue;
			}
			NSString *aWordC = [aWord substringWithRange:NSMakeRange(k, 1)];
			if ([aWordC isEqualToString:c]) {
				matchingChars++;
			}
		}
		
		if (matchingChars == [aWord length]) {
			return YES;
		}
	}
	
	return NO;
}

+(int)findHighestProduct:(NSArray *)numbers usingUpto:(int)elements {
	
	if ([numbers count] < 3) {
		return 0;
	}
	
	NSMutableArray *modifNumbers = [[NSMutableArray alloc] initWithArray:numbers];
	int highestIndex = 0;
	int product = 1;
	for (int z=0; z<elements; z++) {
		int highest = -99999;
		highestIndex = 0;
		for (int i=0; i<modifNumbers.count; i++) {
			int value = [[modifNumbers objectAtIndex:i] intValue];
			if (value >= highest) {
				highestIndex = i;
				highest = value;
			}
		}
		[modifNumbers removeObjectAtIndex:highestIndex];
		product = product * highest;
	}
	return product;
}

//Input : 4
//Output : True
//as 2^2 = 4.
+(int)isPower:(int)A {
	
	int a;
	double p;
	if (A == 1) {
		return 1;
	}
	
	for (a = 1; a<= sqrt(A); a++) {
		p = log(A) / log(a);
		
		if (p - (int)p < 0.000000001) {
			return 1;
		}
	}
	return 0;
}

//Returns the highest product as the product of 3 numbers in the array
+(int)higestProduct:(NSArray *)numbers {
	
	if ([numbers count] < 3) {
		return 0;
	}
	
	int highest = -99999;
	int higher = -99999;
	int high = -99999;
	
	NSMutableArray *modifNumbers = [[NSMutableArray alloc] initWithArray:numbers];
	int highestIndex = 0;
	
	for (int i=0; i<numbers.count; i++) {
		int value = [[numbers objectAtIndex:i] intValue];
		if (value >= highest) {
			highestIndex = i;
			highest = value;
		}
	}
	[modifNumbers removeObjectAtIndex:highestIndex];
	
	for (int i=0; i<modifNumbers.count; i++) {
		int value = [[modifNumbers objectAtIndex:i] intValue];
		if (value >= higher) {
			highestIndex = i;
			higher = value;
		}
	}
	[modifNumbers removeObjectAtIndex:highestIndex];
	
	for (int i=0; i<modifNumbers.count; i++) {
		int value = [[modifNumbers objectAtIndex:i] intValue];
		if (value >= high) {
			highestIndex = i;
			high = value;
		}
	}
	
	return highest * higher * high;
}


+(int *)getProductsOfAllIntsExceptAtIndex:(int *)numbers size:(int)numbersSize {
	
	int productNumbers[numbersSize];
	int product = 1;

//	for (int i=0; i<numbersSize; i++) {
//		product = 1;
//		for (int j=0; j<numbersSize; j++) {
//			if (i==j) {
//				continue;
//			}
//			product = product * numbers[j];
//		}
//		
//		productNumbers[i] = product;
//		
//	}
	return productNumbers;
}

+(int)productOfBeforeIndex:(int)index array:(int *)array {
	int product = 1;
	for (int i=0; i<index; i++) {
		product = product * array[i];
	}
	return product;
}


+(int)productOfAfterIndex:(int)index array:(int *)array size:(int)arraySize {
	int product = 1;
	for (int i=index+1; i<arraySize; i++) {
		product = product * array[i];
	}
	return product;
}

+(void)printArray:(int *)array len:(int)length {
	int i=0;
	
	for (i=0; i<length; i++) {
		printf("%d", array[i]);
		if (i < length-1) {
			printf(",");
		} else {
			printf("\n");
		}
	}
}

+(void)printCharArray:(char *)array len:(int)length {
	int i = 0;
	
	for (i=0; i<length; i++) {
		printf("%c", array[i]);
	}
	printf("\n");
}

+(int)mice:(int *)A len:(int)n1 B:(int *)B len:(int)n2 {
	
	[TestClass bubbleSort:A len:n1];
	[TestClass bubbleSort:B len:n2];
	
	[TestClass printArray:A len:n1];
	[TestClass printArray:B len:n2];
	
	int i = 0;
	int totalTime = 0;
	for (i=0; i<n1; i++) {
//		int timeToEnter = (abs(abs(A[i]) - abs(B[i])));
//		if (timeToEnter > totalTime) {
//			totalTime = totalTime + abs(totalTime - timeToEnter);
//		}
		totalTime = MAX(totalTime, abs(A[i] - B[i]));
	}
	return totalTime;
}

//Find the largest continuous sequence in a array which sums to zero
+(int *)sumToZero:(int *)A len:(int)length {
	
	int i=0;
	int *result = malloc(sizeof(int)*length);
	
	for (i=0; i<length; i++) {
		if (A[i] + A[i+1] == 0) {
			result[i] = A[i];
			result[i+1] = A[i+1];
			i++;
		} else {
			result[i] = 0;
		}
	}
	return result;
}

+(int *)bubbleSort:(int *)array len:(int)length {
	
	int i = 1;
	int j = 0;
	
	for (i=1; i<length; i++) {
		for (j=0; j<length-1; j++) {
			if (array[i] < array[j]) {
				//swap them
				int temp = array[i];
				array[i] = array[j];
				array[j] = temp;
			}
		}
	}
	
	return array;
}

// Function to Merge Arrays L and R into A.
// lefCount = number of elements in L
// rightCount = number of elements in R.
+(void)merge:(int *)A L:(int *)L leftCount:(int)leftCount R:(int *)R rightCount:(int)rightCount {
	
	int i,j,k;
	
	i=0; j=0; k=0;
	
	while (i<leftCount && j<rightCount) {
		if (L[i] < R[j]) {
			A[k++] = L[i++];
		} else {
			A[k++] = R[j++];
		}
	}
	
	while (i < leftCount) {
		A[k++] = L[i++];
	}
	
	while (j < rightCount) {
		A[k++] = R[j++];
	}
	
}

+(void)mergeSort:(int *)array len:(int)length {
	
	int mid, i, *L, *R;
	if (length < 2) {
		return;
	}
	
	mid = length/2;
	
	L = (int *)malloc(mid * sizeof(int));
	R = (int *)malloc((length - mid)*sizeof(int));
	
	//Create the left array
	for (i=0; i<mid; i++) {
		L[i] = array[i];
	}
	
	//Create the right sub array
	for (i=mid; i<length; i++) {
		R[i-mid] = array[i];
	}
	
	[TestClass mergeSort:L len:mid];
	[TestClass mergeSort:R len:length-mid];
	[TestClass merge:array L:L leftCount:mid R:R rightCount:length-mid];
	free(L);
	free(R);
}

+(int)isSameTree:(Tree *)A B:(Tree *)B {
	
	if (A == NULL && B == NULL) {
		return 1;
	}
	if (A == NULL || B == NULL) {
		return 0;
	}
	
	return (([A data] == [B data]) && [TestClass isSameTree:[A left] B:[B left]] && [TestClass isSameTree:[A right] B:[B right]]);
}

//Isn't working properly...
//It's supposed to return number of '1's inside a binary representation of the given number
+(int)numSetBits:(unsigned int)A {
	int total_ones = 0;
	while (A != 0) {
		A = A >> 1;
		total_ones++;
	}
	return total_ones;
}

//Converts an integer to its binary representation as an int
+(unsigned int)int_to_binary:(unsigned int)k {
	if (k == 0) return 0;
	if (k == 1) return 1;                       /* optional */
	return (k % 2) + 10 * [TestClass int_to_binary:(k/2)];
}

+(unsigned int)binary_to_int:(unsigned int)k {
	
	int decimal = 0, i = 0, rem;
	while (k != 0) {
		rem = k % 10;
		k /= 10;
		decimal += rem * pow(2, i);
		++i;
	}
	return decimal;
}

+(int)GCD:(unsigned int)a b:(unsigned int)b {
	
	int start = MIN(a, b);
	int gcd = 0;
	for (int i=start; i>=0; i--) {
		if (b % i == 0 && a % i == 0) {
			gcd = i;
			break;
		}
	}
	return gcd;
}

+(int)GCDRecursive:(unsigned int)a b:(unsigned int)b {
	if (a < b) {
		//Swap the variables
		int temp = a;
		a = b;
		b = temp;
	}
	if (b == 0) {
		return a;
	}
	return [TestClass GCDRecursive:a%b b:b];
}

+(void)treeToList:(Tree *)root head:(Tree **)head {
	
	if (root == NULL) {
		return;
	}
	
	static Tree *prev = NULL;
	
	[TestClass treeToList:root.left head:head];
	
	if (prev == NULL) {
		*head = root;
	} else {
		root.left = prev;
		prev.right = root;
	}
	prev = root;
	
	[TestClass treeToList:root.right head:head];
}

+(void)printTreeAsList:(Tree *)tree {
	
	while (tree != NULL) {
		printf("%d, ", tree.data);
		tree = tree.right;
	}
}

+(void)printList:(Node *)head {
	
	__block Node *head2 = head;
	
	//Run this in the background thread for no reason
	//dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
		if (head2 != NULL) {
			do {
				printf("%d, ", head2.value);
				head2 = [head2 next];
			} while (head2 != NULL);
		}
	//});
}

//This function goes through the list of numbers
//And finds the number that doesn't have a duplicate and returns it.
+(int)findSingleNumber:(int *)numbers length:(int)len {
	
	int num = 0;
	for (int i=0; i<len; i++) {
		num ^= numbers[i];
	}
	return num;
}

+(int)findLoop:(Node *)list {
	
	if (list == NULL) {
		return 0;
	}
	
	Node *slow;	//this will step at 1x time
	Node *fast; //this will step at 2x time
	
	slow = fast = list;	//set all of them to the beginning of the list
	int collisionPoint = 0;
	
	while (fast.next != NULL) {
		slow = [slow next];
		
		if ([fast next] != NULL) {
			fast = [[fast next] next];	//2 hops
		} else {
			return 0;	//slow and fast didn't meet yet and fast reached end point... so no loops
		}
		
		if (slow == NULL || fast == NULL) {
			return 0;	//One or the other reached end of the list, they haven't met... no loop.
		}
		
		//Increment the collision point
		collisionPoint++;
		
		if (slow == fast) {
			break;	//They met, there must be a loop in this linked list.
		}
	}
	
	if (collisionPoint > 0) {
		//Now do one more traversal to get the start of the loop
		//Reset one of the pointers to the beginning, then traverse until they meet again
		//from the last collision point
		slow = list;
		collisionPoint = 1;
		
		while (fast.next != NULL && slow.next != NULL) {
			slow = [slow next];
			fast = [fast next];
			
			collisionPoint++;
			
			if (slow == fast) {
				return collisionPoint;
			}
			
		}
	}
	
	return 0;
}

+(int)lengthOfLastword:(NSString *)sentence {
	
	if (sentence.length <= 1) {
		return 0;
	}
	int count = 0;
	for (int i=0; i<[sentence length]; i++) {
		char c = [sentence characterAtIndex:i];
		if (c == ' ') {
			count = 0;
			i++;
		}
		count++;
	}
	return count;
}


+(int)flipSwitchesCount:(int *)bulbs size:(int)size {
	
	int flipCount = 0;
	int state = 0;
	for (int i=0; i<size; i++) {
		if (bulbs[i] == state) {
			flipCount++;	//flip the switch
			state = 1 - state;
		}
	}
	return flipCount;
}

+(int)isPrime:(int)A {
	
	//1 is not prime
	if (A == 1) {
		return 0;
	}
	
	int upperlimit = (int)(sqrt(A));
	int i=2;
	for (i=2; i<=upperlimit; i++) {
		if (i < A && (A % i == 0)) {
			return 0;
		}
	}
	return 1;
}

+(NSMutableArray *)findPrimesAddToX:(int)X {
	
	NSMutableArray *result = [[NSMutableArray alloc] init];
	
	NSMutableArray *allPrimes = [TestClass findAllPrimesLessThan:X];
	
	int i=0;
	for (i=0; i<allPrimes.count; i++) {
		int prime = [[allPrimes objectAtIndex:i] intValue];
		if ([TestClass isPrime:(X-prime)]) {
			if ([result indexOfObject:[NSNumber numberWithInt:prime]] == NSNotFound) {
				[result addObject:[NSNumber numberWithInt:prime]];
			}
			if ([result indexOfObject:[NSNumber numberWithInt:(X-prime)]] == NSNotFound) {
				[result addObject:[NSNumber numberWithInt:(X-prime)]];
			}
		}
	}
	
	return result;
}

+(NSMutableArray *)findAllPrimesLessThan:(int)num {
	NSMutableArray *result = [[NSMutableArray alloc] init];
	
	int i = num;
	while (i > 2) {
		i--;
		if ([TestClass isPrime:i]) {
			[result addObject:[NSNumber numberWithInt:i]];
		}
	}
	return result;
}


// Order of algorithm: O(m*n*log(m*n))
+(void)print2DArraySorted:(NSMutableArray *)array {
	
	//This is an array of arrays
	NSMutableArray *copyArray = [[NSMutableArray alloc] init];
	for (NSArray *arr in array) {
		NSMutableArray *a = [[NSMutableArray alloc] initWithArray:arr];
		[copyArray addObject:a];
	}
	
	int rowOfMin = 0;
	int colOfMin = 0;
	int min = 99999;
	bool recordFound = true;
	int colIndex = 0;
	while (recordFound) {
		recordFound = false;
		NSMutableArray *rowArray;
		int row = 0;
		for (row=0; row<copyArray.count; row++) {
			rowArray = [copyArray[row] mutableCopy];
			if (colIndex < rowArray.count) {
				recordFound = true;
				
				if ([rowArray[colIndex] intValue] < min) {
					min = [rowArray[colIndex] intValue];
					rowOfMin = row;
					colOfMin = colIndex;
				}
			}
		}
		
		if (recordFound && min < 99999) {
			printf("%d, ", min);
			[copyArray[rowOfMin] removeObjectAtIndex:colOfMin];
			min = 99999;
			colIndex = 0;
		} else {
			colIndex++;
		}
	}
}

//Given number X, this function returns true if adding any of the elements in array
//equal to X. The numbers must be continously added in the array.
+(bool)findContinuousSum:(NSArray *)array X:(int)X {
	int i=0;
	int j=0;
	bool result = false;
	for (i=0; i<array.count; i++) {
		int sum = 0;
		for (j=i; j<array.count; j++) {
			sum += [array[j] intValue];
			if (sum == X) {
				result = true;
			}
		}
	}
	return result;
}

+(void)reverseWord:(char *)word len:(int)length {
	
	int start = 0;
	int end = length-1;
	for (start = 0; start<end; start++, end--) {
		//swap the variables
		char temp = word[start];
		word[start] = word[end];
		word[end] = temp;
	}
}

+(void)reverseSentence:(char *)sentence len:(int)length {
	
	//reverse all the words 1 by 1 using the space character
	for (int i=0; i<length; i++) {
		
		int j=i+1;
		//Find the end of the word
		while (j < length && sentence[j] != ' ') {
			++j;
		}
		
		[TestClass reverseWord:&sentence[i] len:j-i];
		
		//Move the pointer to the end of the word
		i = j;
	}
	
	//Reverse the sentence 1 more time to reverse the words
	[TestClass reverseWord:sentence len:length];
}

+(BOOL)evaluateInput:(NSString *)input {
	
	if (input == nil || input.length <= 0) {
		return NO;
	}
	
	input = [input stringByReplacingOccurrencesOfString:@"T" withString:@"1"];
	input = [input stringByReplacingOccurrencesOfString:@"F" withString:@"0"];
	
	for (int i=0; i<input.length; i++) {
		char c = [input characterAtIndex:i];
		if (c == '&') {
			
		}
	}
	return NO;
}

//D: Dove, Do: Dog, Z: Zebra, etc. example
+(void)findPrefix:(NSArray *)input {
	
	NSMutableDictionary *output = [[NSMutableDictionary alloc] init];
	
	for (int i=0; i<input.count; i++) {
		NSString *word = [input objectAtIndex:i];
		unsigned int len = (int)[word length];
		
		char buffer[len];

		strncpy(buffer, [word UTF8String], len);
		[word getCharacters:buffer range:NSMakeRange(0, len)];
		
		//traverse the word
		for (int j=0; j<len; j++) {
			char c = buffer[j];
			NSString *key = [NSString stringWithFormat:@"%c", c];
			int keyLength = key.length;
			if ([output valueForKey:key] == nil) {
				[output setValue:word forKey:key];
				break;
			} else {
				//Get the word from the key
				NSString *oldWord = [output valueForKey:key];
				NSString *newKey = [oldWord substringWithRange:NSMakeRange(0, keyLength+1)];
				[output setValue:oldWord forKey:newKey];
				i--;
				[output removeObjectForKey:key];
				break;
			}
		}
	}
	
	[TestClass printDictionary:output];
}

+(void)printDictionary:(NSDictionary *)dic {
	for (NSString *key in [dic allKeys]) {
		NSLog(@"%@:%@", key, [dic valueForKey:key]);
	}
}

+(Node *)mergeTwo:(Node *)a b:(Node *)b {
	
	if (a == NULL) {
		return b;
	}
	else if (b == NULL) {
		return a;
	}
	
	Node *result = NULL;
	
	if (a.value >= b.value) {
		result = b;
		result.next = [self mergeTwo:a b:[b next]];
	} else {
		result = a;
		result.next = [self mergeTwo:[a next] b:b];
	}
	
	return result;
}

+(Node *)mergeKLists:(NSArray *)A len:(int)len {
	
	Node *ans = A[0];
	
	int i = 0;
	for (i=1; i<len; i++) {
		ans = [self mergeTwo:ans b:A[i]];
	}

	return ans;
}

+(Node *)mergeSortedLists:(NSArray *)lists {
	
	Node *head = [[Node alloc] init];
	head.value = 0;
	Node *tail = head;
	
	NSMutableArray *mutableList = [[NSMutableArray alloc] initWithArray:lists];
	
	int min = 99999;
	BOOL recordFound = YES;
	
	while (recordFound) {
		recordFound = NO;
		min = 99999;
		Node *updatedList;
		int rowToUpdate = 0;
		
		for (int i=0; i<mutableList.count; i++) {
			Node *curList = [mutableList objectAtIndex:i];
			if ([curList next] != NULL) {
				recordFound = YES;
			}
			if ([curList value] < min) {
				min = [curList value];
				//Now we found a new min, move the head
				if ([curList next] == NULL) {
					[mutableList removeObjectAtIndex:i];
				}
				curList = [curList next];
				updatedList = curList;
				rowToUpdate = i;
			}
		}
		
		if (min != 99999) {
			Node *newMin = [[Node alloc] init];
			newMin.value = min;
			tail.next = newMin;
			tail = [tail next];
			if (updatedList != NULL) {
				mutableList[rowToUpdate] = updatedList;
			}
		}
	}
	return head;
}

//Find the diagonal difference of a given Matrix of numbers
//Sample input
//11, 2, 4
//4, 5, 6
//10, 8, -12
+(int)diagonalDifference:(NSArray *)A len:(int)len {
	int result = 0;
	int i,j=0;	//traversal helpers
	
	int sumDown, sumUp = 0;
	for (i=0, j=0; i<len; i++, j++) {
		sumDown += ((NSNumber *)A[i][j]).intValue;
	}
	
	for (i=0, j=len-1; i<len, j>=0; i++, j--) {
		sumUp += ((NSNumber *)A[i][j]).intValue;
	}
	
	result = abs(sumDown - sumUp);
	
	return result;
}

@end








