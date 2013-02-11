//
//  Created by Roberto Seidenberg
//  All rights reserved
//

// Header
#import "XPUser+XPAdditions.h"

// Categories
#import "XPActivity+XPAdditions.h"

@implementation XPUser(XPAdditions)

// MARK: Fetching
+ (void)activitiesWithBlock:(void (^)(XPActivity *, NSError *error))block {
	
	// Fetch activities from db
	// Call block when finished
	[XPActivity fetchOfflineWithBlock:^(XPActivity *activity, NSError *error) {
			
		// Error
		// Return error
		if (error) {
			block(nil, error);
			
		// Success
		// Return objects
		} else if (activity) {
			block(activity, nil);
			
		// No objects available
		// Wait for online data
		} else {
			block(nil, nil);
		}
	}];
	
	// Check if connected to internet
	// If yes kick off online fetching in parallel
 	// Call block when finished
	[XPActivity fetchOnlineWithBlock:^(XPActivity *activity, NSError *error) {
		
		// Error
		// Return error
		if (error) {
			block(nil, error);
			
		// Success
		// Return objects
		} else if (activity) {
			block(activity, nil);
			
		// No objects available
		} else {
			block(nil, nil);
		}
	}];
}
@end