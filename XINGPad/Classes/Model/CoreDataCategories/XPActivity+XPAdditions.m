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
#import "XPPossibleActions+XingAPIAdditions.h"

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
		
		// No "connecting" xpObjects class available
		XPObjects *xpObjects;
		if (!self.xpObjects) {
			
			// Create new xpObjects instance and add to activity class
			xpObjects      = [XPObjects createInContext:[NSManagedObjectContext defaultContext]];
			self.xpObjects = xpObjects;
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
			} else if ([aManagedObject isKindOfClass:[XPEvent class]]) {
				[xpObjects addXpEventObject:aManagedObject];
			} else if ([aManagedObject isKindOfClass:[XPCompanyProfile class]]) {
				[xpObjects addXpCompanyProfileObject:aManagedObject];
			} else if ([aManagedObject isKindOfClass:[XPCompanyProfileUpdate class]]) {
				[xpObjects addXpCompanyProfileUpdateObject:aManagedObject];
			} else if ([aManagedObject isKindOfClass:[XPCompanyProfile class]]) {
				[xpObjects addXpCompanyProfileObject:aManagedObject];
			} else if ([aManagedObject isKindOfClass:[XPJobPosting class]]) {
				[xpObjects addXpJobPostingObject:aManagedObject];
			} else if ([aManagedObject isKindOfClass:[XPCompanyProfile class]]) {
				[xpObjects addXpCompanyProfileObject:aManagedObject];
			} else if ([aManagedObject isKindOfClass:[XPThread class]]) {
				[xpObjects addXpThreadObject:aManagedObject];
			} else if ([aManagedObject isKindOfClass:[XPBookmark class]]) {
				[xpObjects addXpBookmarkObject:aManagedObject];
			} else if ([aManagedObject isKindOfClass:[XPGroup class]]) {
				[xpObjects addXpGroupObject:aManagedObject];
			} else if ([aManagedObject isKindOfClass:[XPArticle class]]) {
				[xpObjects addXpArticleObject:aManagedObject];
			}
		}
		
		// Persist
		[[NSManagedObjectContext defaultContext] saveToPersistentStoreAndWait];
	}
	
	// Returning YES means: Object import has been taken care of
	return YES;
}
- (BOOL)importXpPossibleActions:(id)data {

	// Get data for "objects" property
	data = [data objectForKey:@"possible_actions"];
	
	// Only continue if data is available
	if (data) {
		
		// No xpPossibleActions object available
		XPPossibleActions *actions;
		if (!self.xpPossibleActions) {
			
			// Create new xpObjects instance and add to activity class
			actions                = [XPPossibleActions createInContext:[NSManagedObjectContext defaultContext]];
			actions.xpActivity     = self;
			self.xpPossibleActions = actions;
		}
		
		// Find actions strings in data array and set according bools in db object
		for (NSString *action in data) {
			if ([action isEqualToString:kXPPossibleActionsStringComment]) actions.xpIsCommentingPossible = @YES;
			if ([action isEqualToString:kXPPossibleActionsStringLike])    actions.xpIsLikingPossible     = @YES;
			if ([action isEqualToString:kXPPossibleActionsStringShare])   actions.xpIsSharingPossible    = @YES;
			if ([action isEqualToString:kXPPossibleActionsStringDelete])  actions.xpIsDeletingPossible   = @YES;
			if ([action isEqualToString:kXPPossibleActionsStringIgnore])  actions.xpIsIgnoringPossible   = @YES;
		}
	}
	
	// Persist
	[[NSManagedObjectContext defaultContext] saveToPersistentStoreAndWait];
	
	// Returning YES means: Object import has been taken care of
	return YES;
}
@end