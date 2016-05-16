//
//  ViewController.m
//  TestApp
//
//  Created by Kaan Ersan on 2016-04-25.
//  Copyright © 2016 Kaan Ersan. All rights reserved.
//

#import "ViewController.h"
#import "TestClass.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	int stockPrices[] = {10, 7, 5, 8, 11, 9};
	int stockPricesSize = sizeof(stockPrices) / sizeof(stockPrices[0]);
	
	[TestClass get_max_profit:stockPrices size:stockPricesSize];
	
	int products[] = {1, 7, 3, 4};
	int *solution;
	int productsSize = sizeof(products) / sizeof(products[0]);
	solution = [TestClass getProductsOfAllIntsExceptAtIndex:products size:productsSize];
	
	for (int i=0; i<productsSize; i++) {
		printf("product[%d] = %d\n", i, solution[i]);
	}
	
	NSArray *wordList = [[NSArray alloc] initWithObjects:@"cat", @"bob", @"umbrella", nil];
	
	BOOL wordFound = [TestClass wordIsInTheList:wordList word:@"umb.ella"];
	printf("wordFound: %d\n", wordFound);
	
	NSArray *numbers = @[@1, @5, @7, @3, @2, @8, @43, @4, @10, @9, @5, @56, @98, @92, @65, @54, @49, @32];
	
	NSDate *methodStart = [NSDate date];
	int highestProduct = [TestClass higestProduct:numbers];
	NSDate *methodEnd = [NSDate date];
	NSTimeInterval timePassed = [methodEnd timeIntervalSinceDate:methodStart];
	NSLog(@"execution time: %f", timePassed);
	
	printf("highestProduct: %d\n", highestProduct);
	
	NSDate *start = [NSDate date];
	int highProduct = [TestClass findHighestProduct:numbers usingUpto:3];
	NSDate *end = [NSDate date];
	NSTimeInterval time = [end timeIntervalSinceDate:start];
	NSLog(@"execution time: %f", time);
	
	printf("highProduct: %d\n", highProduct);
	
	Tree *A = [[Tree alloc] init];
	A.data = 1;
	Tree *Left = [[Tree alloc] init];
	Left.data = 2;
	Tree *Right = [[Tree alloc] init];
	Right.data = 3;
	
	A.left = Left;
	A.right = Right;
	
	Tree *B = [[Tree alloc] init];
	B.data = 1;
	B.left = Left;
	B.right = Right;
	
	int sameTree = [TestClass isSameTree:A B:B];
	printf("isSameTree: %d\n", sameTree);
	
	int numOfBits = [TestClass numSetBits:8];
	printf("number of bits: %d\n", numOfBits);
	
	int gcd = [TestClass GCD:24 b:48];
	printf("gcd: %d\n", gcd);
	
	int gcd2 = [TestClass GCDRecursive:9 b:6];
	printf("gcd2: %d\n", gcd2);
	
	int doubleNumbers[] = {1, 3, 6, 34, 4, 1, 6, 3, 4};
	int doubleNumbersSize = sizeof(doubleNumbers) / sizeof(doubleNumbers[0]);
	int single = [TestClass findSingleNumber:doubleNumbers length:doubleNumbersSize];
	printf("single number: %d\n", single);
	
	Node *one = [[Node alloc] init];
	one.value = 1;
	
	Node *two = [[Node alloc] init];
	two.value = 2;
	one.next = two;
	
	Node *three = [[Node alloc] init];
	three.value = 3;
	two.next = three;
	
	Node *four = [[Node alloc] init];
	four.value = 4;
	three.next = four;
	
	Node *five = [[Node alloc] init];
	five.value = 5;
	four.next = five;
	
	Node *six = [[Node alloc] init];
	six.value = 6;
	five.next = six;
	four.next = three;
	
	Node *seven = [[Node alloc] init];
	seven.value = 7;
	six.next = seven;
	
	Node *eight = [[Node alloc] init];
	eight.value = 8;
	seven.next = eight;
	
	int isloop = [TestClass findLoop:one];
	printf("loop exists: %d\n", isloop);
	
	int bulbs[] = {1, 1, 0, 0, 1, 1, 0, 0, 1};
	int switchCount = [TestClass flipSwitchesCount:bulbs size:8];
	printf("switchCount: %d\n", switchCount);
	
	
	[TestClass printArray:doubleNumbers len:9];
	[TestClass bubbleSort:doubleNumbers len:9];
	[TestClass printArray:doubleNumbers len:9];
	
	int mice[] = {4, -4, 2};	//After sort: -4, 2, 4
	int holes[] = {4, 0, 5};	//After sort:  0, 4, 5
	
	int totalTime = [TestClass mice:mice len:3 B:holes len:3];
	printf("totalTime: %d\n", totalTime);
	
	int prime = [TestClass isPrime:7];
	printf("prime: %d\n", prime);
	
	[TestClass printArray:stockPrices len:stockPricesSize];
	[TestClass mergeSort:stockPrices len:stockPricesSize];
	[TestClass printArray:stockPrices len:stockPricesSize];
	
	int nums[] = {1, 2, -2, 4, -4, 8, 2, -2, -32, 32, 9};
	int *result = malloc(sizeof(int)*11);
	result = [TestClass sumToZero:nums len:11];
	[TestClass printArray:result len:11];
	
	int k = 60;
	k = [TestClass int_to_binary:k];
	printf("binary k: %d\n", k);
	
	//flip K to negative number - 1
	k = ~k;
	printf("flipped k: %d\n", k);
	k = ~k;
	printf("flipped again k: %d\n", k);
	
	int b = k;
	b = [TestClass binary_to_int:b];
	printf("decimal b: %d\n", b);
	
	int lengthOfLastWord = [TestClass lengthOfLastword:@"Hello Worlddd!"];
	printf("lengthOfLastWord: %d\n", lengthOfLastWord);
	
	NSMutableArray *p = [TestClass findPrimesAddToX:128];
	NSLog(@"Primes that add to number: %@", p);
	
	NSMutableArray *array = [@[@[@20, @40, @80], @[@5, @60, @90], @[@45, @50, @55]] mutableCopy];
	[TestClass print2DArraySorted:array];
	
	NSArray *a = [[NSArray alloc] initWithObjects: @3, @5, @2, @9, @12, @8, nil];
	bool sum = [TestClass findContinuousSum:a X:8];
	printf("sum: %i\n", sum);
	
	char word[] = {'h', 'e', 'l', 'l', 'o', ' ', 'w', 'o', 'r', 'l', 'd'};
	[TestClass reverseWord:word len:11];
	[TestClass printCharArray:word len:11];
	[TestClass reverseWord:word len:11];
	[TestClass printCharArray:word len:11];
	
	[TestClass reverseSentence:word len:11];
	[TestClass printCharArray:word len:11];
	
	Tree *C = [[Tree alloc] init];
	C.data = 5;
	Right.right = C;
	
	Tree *head = NULL;
	[TestClass treeToList:A head:&head];
	[TestClass printTreeAsList:head];
	
	NSString *input = @"T|F&T^T";
	[TestClass evaluateInput:input];
	
	NSArray *wordArray = [[NSArray alloc] initWithObjects:@"zebra", @"dog", @"duck", @"dove", nil];
	[TestClass findPrefix:wordArray];
	
	Node *uno = [[Node alloc] init];
	uno.value = 1;
	
	Node *ten = [[Node alloc] init];
	ten.value = 10;
	uno.next = ten;
	
	Node *twenty = [[Node alloc] init];
	twenty.value = 20;
	ten.next = twenty;
	
	Node *foour = [[Node alloc] init];
	foour.value = 4;
	
	Node *eleven = [[Node alloc] init];
	eleven.value = 11;
	foour.next = eleven;
	
	Node *thirteen = [[Node alloc] init];
	thirteen.value = 13;
	eleven.next = thirteen;
	
	Node *threee = [[Node alloc] init];
	threee.value = 3;
	
	Node *eeight = [[Node alloc] init];
	eeight.value = 8;
	threee.next = eeight;
	
	Node *nine = [[Node alloc] init];
	nine.value = 9;
	eeight.next = nine;
	
	NSArray *listArray = [[NSArray alloc] initWithObjects:uno, foour, threee, nil];
	Node *resultList = [[Node alloc] init];
	
	//resultList = [TestClass mergeSortedLists:listArray];
	resultList = [TestClass mergeKLists:listArray len:3];
	[TestClass printList:resultList];
	
	NSArray *rowOne = [[NSArray alloc] initWithObjects:@11, @2, @4, nil];
	NSArray *rowTwo = [[NSArray alloc] initWithObjects:@4, @5, @6, nil];
	NSArray *rowThree = [[NSArray alloc] initWithObjects:@10, @8, @-12, nil];
	NSArray *diagonalArray = [[NSArray alloc] initWithObjects:rowOne, rowTwo, rowThree, nil];
	
	int diagonalSum = [TestClass diagonalDifference:diagonalArray len:3];
	printf("result: %d", diagonalSum);
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


@end
