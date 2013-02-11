//
//  Created by Roberto Seidenberg
//  All rights reserved
//

// Inherited class
#import "XPActivity.h"

@interface XPActivity(XPAdditions)

// MARK: Utility
/**
 Fetches all of the users activities from the XING web api.
 
 @return XPActivity* (NSManagedObject) containing relationships to the activities object tree. Nil if nothing could be fetched.
 @return NSError* in case of failure
*/
+ (void)fetchOnlineWithBlock:(void (^)(XPActivity *, NSError *error))block;

/**
 Fetches all of the users activities from the db.
 
 @return XPActivity* (NSManagedObject) containing relationships to the activities object tree. Nil if nothing could be fetched.
 @return NSError* in case of failure
*/
+ (void)fetchOfflineWithBlock:(void (^)(XPActivity *, NSError *error))block;
@end
