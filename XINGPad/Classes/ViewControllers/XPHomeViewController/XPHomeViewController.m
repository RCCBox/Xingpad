//
//  Created by Roberto Seidenberg
//  All rights reserved
//

// Header
#import "XPHomeViewController.h"

// Vendor
// Categories
#import "NSObject+KVOBlockBinding.h"

// App classes
// Model
#import "OAuthPersistenceManager.h"

@implementation XPHomeViewController

#pragma mark - Setters

- (void)setUser:(XPUser *)user {
	
	// Store object
	_user = user;
	
	// FIXME: Remove this once testing is done
	// Import JSON placeholder data
	NSString *path     = [[NSBundle mainBundle] pathForResource:@"NetworkActivity" ofType:@"json"];
	NSData *data       = [NSData dataWithContentsOfFile:path];
	NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
	
	// Import JSON into db
	[self.user importValuesForKeysWithObject:json];
	[[NSManagedObjectContext defaultContext] saveToPersistentStoreAndWait];
}

#pragma mark - Template methods

- (void)viewDidLoad {
	[super viewDidLoad];
	
	// Observe user property
	[self addObserverForKeyPath:@"self.user.xpActivity" owner:self block:^(id observed, NSDictionary *change) {
		DLog(@"!!!\n%@", change);
	}];
}

@end