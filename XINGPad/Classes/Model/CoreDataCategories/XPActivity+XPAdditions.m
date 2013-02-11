//
//  Created by Roberto Seidenberg
//  All rights reserved
//

// Header
#import "XPActivity+XPAdditions.h"

// Categories
#import "NSManagedObject+XingAPIAdditions.h"

// Constants
static NSString* const kXPActivityAPIPath = @"/users/me/network_feed.json";


@implementation XPActivity(XPAdditions)

// MARK: Utiltiy
+ (void)fetchOnlineWithBlock:(void (^)(XPActivity *, NSError *error))block {
	
	// Fetch JSON
	[self fetchJSONForPath:kXPActivityAPIPath withBlock:^(NSString *json, NSError *error) {
		
		// Failure
		if (error) {
			
			// Call block with error
			block(nil, error);
			
		// Success
		} else if (json) {
			
			// Convert to objects
			XPActivity *activity;
			
			// Update db
			// MagicalRecord & CoreData stuff
			
			// Call block with objects
			block(activity, nil);

		} else {
			
			// Nothing fetched
			// Call block with nil values
			block(nil, nil);
		}
		
	}];
}
+ (void)fetchOfflineWithBlock:(void (^)(XPActivity *, NSError *error))block {
	
	// Magical Record fetching stuff
	// Call block with appropriate values
}
@end