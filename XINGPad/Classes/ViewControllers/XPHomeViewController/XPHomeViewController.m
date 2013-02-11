//
//  Created by Roberto Seidenberg
//  All rights reserved
//

// Header
#import "XPHomeViewController.h"

// App classes
// Model categories
#import "XPUser+XPAdditions.h"

@implementation XPHomeViewController

// MARK: Template methods
- (void)viewDidAppear:(BOOL)animated {	
	[super viewDidAppear:animated];
	
	// Fetch activities for user
	[XPUser activitiesWithBlock:^(XPActivity *activity, NSError *error) {
		
		if (error) {
			;
			
		} else if (activity) {
			DLog(@"%@", activity);
		}
	}];
}
@end