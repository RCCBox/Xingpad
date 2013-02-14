//
//  Created by Roberto Seidenberg
//  All rights reserved
//

// Header
#import "XPUser+XPAdditions.h"

// Categories
#import "XPActivity+XPAdditions.h"

@implementation XPUser(XPAdditions)

#pragma mark - Fetching

+ (void)activitiesWithBlock:(void (^)(NSArray *, NSError *error))block {
	
	// Fetch activities from db
	// Call block when finished
	[XPActivity fetchOfflineWithBlock:^(NSArray *activities, NSError *error) {
			
		// Error
		// Return error
		if (error) {
			block(nil, error);
			
		// Success
		// Return objects
		} else if (activities) {
			block(activities, nil);
			
		// No objects available
		// Wait for online data
		} else {
			block(nil, nil);
		}
	}];
	
	// Check if connected to internet
	// If yes kick off online fetching in parallel
 	// Call block when finished
	[XPActivity fetchOnlineWithBlock:^(NSArray *activities, NSError *error) {
		
		// Error
		// Return error
		if (error) {
			block(nil, error);
			
		// Success
		// Return objects
		} else if (activities) {
			block(activities, nil);
			
		// No objects available
		} else {
			block(nil, nil);
		}
	}];
}
@end