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
#import "PersonTableViewCell.h"

@implementation ImagesTableViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	self.people = [[NSMutableArray alloc] init];
	//[self.tableView registerClass: UITableViewCell.self forCellReuseIdentifier:@"PersonTableViewCell"];
}

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	
	//Execute the fetch in a background thread
	dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
		AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
		
		NSManagedObjectContext *context = [appDelegate managedObjectContext];
		
		NSPredicate *predicate = [NSPredicate predicateWithFormat:@"facebookId != nil"];
		
		NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Person"];
		request.predicate = predicate;
		
		NSManagedObjectModel *managedObjectModel = [[context persistentStoreCoordinator] managedObjectModel];
		NSDictionary *entities = [managedObjectModel entitiesByName];
		NSArray *entityNames = [entities allKeys];
		NSLog(@"All loaded entities are: %@", entityNames);
		
		NSError *error;
		self.people = [[context executeFetchRequest:request error:&error] mutableCopy];
		
		//Switch back to main thread for table reload
		dispatch_async(dispatch_get_main_queue(), ^{
			[self.tableView reloadData];
		});
	});
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
	
	//Generate a random facebookId
	unsigned int random = 1111111 + arc4random() % NSIntegerMax - NSIntegerMin;
	NSString *facebookId = [NSString stringWithFormat:@"%d", random];
	[person setValue: facebookId forKey:@"facebookId"];
	
	NSError *error;
	[context save:&error];
	
	[self.people addObject:person];
	
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	PersonTableViewCell *cell = (PersonTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"PersonTableViewCell" forIndexPath:indexPath];
	
	Person *person = self.people[indexPath.row];
	cell.nameLabel.text = person.name;
	cell.fbIdLabel.text = person.facebookId;
	
	return cell;
	
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return self.people.count;
}



@end