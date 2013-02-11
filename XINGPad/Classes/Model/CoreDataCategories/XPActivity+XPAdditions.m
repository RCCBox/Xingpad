//
//  Created by Roberto Seidenberg
//  All rights reserved
//

// Header
#import "XPActivity+XPAdditions.h"

// Inherited classes
#import "XPUser.h"

// Categories
#import "NSManagedObject+XingAPIAdditions.h"

// Constants
static NSString* const kXPActivityAPIPath = @"/users/me/network_feed.json";

@implementation XPActivity(XPAdditions)

#pragma mark - Fetching

+ (void)fetchOnlineWithBlock:(void (^)(XPActivity *, NSError *error))block {
	
	// Fetch JSON
	[self fetchJSONForPath:kXPActivityAPIPath withBlock:^(NSString *json, NSError *error) {
		
		// Failure
		if (error) {
			
			// Call block with error
			block(nil, error);
			
		// Success
		} else if (json) {
			
			// Convert JSON to objects
			NSDictionary *jsonObjects = [NSJSONSerialization JSONObjectWithData:[json dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:&error];

			// Convert and store objects in db
			[XPUser importJSONObjects:jsonObjects intoClass:[XPUser class] callback:^(BOOL success, NSError *error) {
				
				// Success
				if (success) {
					
					// Call block with saved objects
					block([XPActivity findFirst], nil);
					
				// Error
				} else if (error) {
					
					// Call block with error
					block(nil, error);
					
				// Nothing fetched
				} else {
					
					// Call block with nil values
					block(nil, nil);
				}
			}];

		// Nothing fetched
		} else {
			
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