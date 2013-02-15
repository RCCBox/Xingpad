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
static NSString* const kXPActivityAPIPath = @"/users/me/network_feed.json?user_fields=id,display_name,gender,permalink,photo_urls";

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
		
		XPObjects *xpObjects;
		if (!self.xpObjects) {
			xpObjects = [XPObjects createInContext:[NSManagedObjectContext defaultContext]];
			self.xpObjects       = xpObjects;
		}
		
		// Iterate over contained dictionarys
		for (NSDictionary *aDict in data) {
			
			// Insert object of matching class into context
			id aManagedObject = [[aDict matchingXingAPIClass] performSelector:@selector(createInContext:) withObject:[NSManagedObjectContext defaultContext]];
			
			// Populate properties with given values
			[aManagedObject importValuesForKeysWithObject:aDict];
			
			// Insert joining class and add new class
			if ([aManagedObject isKindOfClass:[XPUser class]]) {
				[xpObjects addXpUserObject:aManagedObject];
			} else if ([aManagedObject isKindOfClass:[XPStatus class]]) {
				[xpObjects addXpStatusObject:aManagedObject];
			}
		}
		
		// Persist
		[[NSManagedObjectContext defaultContext] saveToPersistentStoreAndWait];
	}
	
	// Returning YES means: Object import has been taken care of
	return YES;
}
@end