//
//  Created by Roberto Seidenberg
//  All rights reserved
//

// Header
#import "XPActivity+XPAdditions.h"

// Inherited classes
#import "XPUser.h"
#import "XPStatus.h"
#import "XPObjects.h"

// Categories
#import "NSDictionary+XingAPIAdditions.h"
#import "NSManagedObject+XingAPIAdditions.h"

// Constants
static NSString* const kXPActivityAPIPath = @"/users/me/network_feed.json";

@implementation XPActivity(XPAdditions)

#pragma mark - Fetching

+ (void)fetchOnlineWithBlock:(void (^)(NSArray *, NSError *error))block {
	
	// Fetch JSON
	[self fetchJSONForPath:kXPActivityAPIPath withBlock:^(NSDictionary *json, NSError *error) {
		
		// Failure
		if (error) {
			
			// Call block with error
			block(nil, error);
			
		// Success
		} else if (json) {

			// Convert and store objects in db
			[XPUser importJSONObjects:json intoClass:[XPUser class] callback:^(BOOL success, NSError *error) {
				
				// Success
				if (success) {

                    // Call block with saved objects
                    block([XPActivity findAll], nil);

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
+ (void)fetchOfflineWithBlock:(void (^)(NSArray *, NSError *error))block {
	
	// Magical Record fetching stuff
	// Call block with appropriate values
}

#pragma mark - MagicalRecord template methods

- (BOOL)importXpObjects:(id)data {

	// Get data for "objects" property
	data = [data objectForKey:@"objects"];
			
	// Only continue if an array is beeing passed in
	if ([data isKindOfClass:[NSArray class]]) {
		
		[MagicalRecord saveWithBlock:^(NSManagedObjectContext *localContext) {
			
			// Iterate over contained dictionarys
			for (NSDictionary *aDict in data) {
								
				// Insert object of matching class into context
				id aManagedObject = [[aDict matchingXingAPIClass] performSelector:@selector(createInContext:) withObject:localContext];
				
				// Populate properties with given values
				[aManagedObject performSelector:@selector(importValuesForKeysWithObject:) withObject:aDict];
				
				// Insert joining class and add new class
				XPObjects *xpObject = [XPObjects createInContext:localContext];
				if ([aManagedObject isKindOfClass:[XPUser class]]) {
					[xpObject addXpUserObject:aManagedObject];
				} else if ([aManagedObject isKindOfClass:[XPStatus class]]) {
					[xpObject addXpStatusObject:aManagedObject];
				}
			}
		}];
	}
	
	// Returning YES means: Object import has been taken care of
	return YES;
}
@end