//
//  Created by Roberto Seidenberg
//  All rights reserved
//

// Inherited class
#import "XPUser.h"
#import "XPActivity.h"

@interface XPUser(XPAdditions)

#pragma mark - Fetching

/**
 Fetches all of the users activities from db and online and calls the block with whatever is available first.
 Fetched objects from web are beeing stored in the db.
 If db objects were updated with objects fetched online the callblack block is beeing called again with th updated data.
 
 @return XPActivity* (NSManagedObject) containing relationships to the activities object tree. Nil if nothing could be fetched.
 @return NSError* in case of failure
*/
+ (void)activitiesWithBlock:(void (^)(XPActivity *, NSError *error))block;
@end
