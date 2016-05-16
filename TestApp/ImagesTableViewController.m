//
//  ImagesTableViewController.m
//  TestApp
//
//  Created by Kaan Ersan on 2016-05-14.
//  Copyright © 2016 Kaan Ersan. All rights reserved.
//

#import "ImagesTableViewController.h"
#import "AppDelegate.h"
#import "Person.h"

@implementation ImagesTableViewController

- (void)viewDidLoad {
	self.people = [[NSMutableArray alloc] init];
	[self.tableView registerClass: UITableViewCell.self forCellReuseIdentifier:@"Cell"];
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	
	AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
	
	NSManagedObjectContext *context = [appDelegate managedObjectContext];
	
	NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Person"];
	
	NSManagedObjectModel *managedObjectModel = [[context persistentStoreCoordinator] managedObjectModel];
	NSDictionary *entities = [managedObjectModel entitiesByName];
	NSArray *entityNames = [entities allKeys];
	NSLog(@"All loaded entities are: %@", entityNames);
	
	NSError *error;
	self.people = [[context executeFetchRequest:request error:&error] mutableCopy];
	
	
}

- (IBAction)addButtonTapped:(UIBarButtonItem *)sender {
	
	UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"New Name" message:@"Add a new name" preferredStyle:UIAlertControllerStyleAlert];
	
	UIAlertAction *saveAction = [UIAlertAction actionWithTitle:@"Save" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
		NSString *textEntered = alert.textFields.firstObject.text;
		[self saveName:textEntered];
		[self.tableView reloadData];
	}];
	
	UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
		
	}];
	
	[alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
		
	}];
	
	[alert addAction:saveAction];
	[alert addAction:cancelAction];
	
	[self presentViewController:alert animated:YES completion:nil];
	
}

- (void)saveName:(NSString *)name {
	AppDelegate *app = [[UIApplication sharedApplication] delegate];
	
	NSManagedObjectContext *context = [app managedObjectContext];
	
	NSEntityDescription *personEntity = [NSEntityDescription entityForName:@"Person" inManagedObjectContext:context];
	
	NSManagedObject *person = [[NSManagedObject alloc] initWithEntity:personEntity insertIntoManagedObjectContext:context];
	[person setValue:name forKey:@"name"];
	
	NSError *error;
	[context save:&error];
	
	[self.people addObject:person];
	
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
	
	Person *person = self.people[indexPath.row];
	cell.textLabel.text = person.name;
	
	return cell;
	
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return self.people.count;
}



@end