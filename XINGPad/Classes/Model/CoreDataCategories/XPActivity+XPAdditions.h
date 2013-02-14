//
//  Created by Roberto Seidenberg
//  All rights reserved
//

// Inherited class
#import "XPActivity.h"

@interface XPActivity(XPAdditions)

#pragma mark - Fetching

/**
 Fetches all of the users activities from the XING web api.
 
 @return NSArray[XPActivity*] (NSManagedObject) containing relationships to the activities object tree. Nil if nothing could be fetched.
 @return NSError* in case of failure
*/
+ (void)fetchOnlineWithBlock:(void (^)(NSArray *, NSError *error))block;

/**
 Fetches all of the users activities from the db.
 
 @return NSArray[XPActivity*] (NSManagedObject) containing relationships to the activities object tree. Nil if nothing could be fetched.
 @return NSError* in case of failure
*/
+ (void)fetchOfflineWithBlock:(void (^)(NSArray *, NSError *error))block;
@end
