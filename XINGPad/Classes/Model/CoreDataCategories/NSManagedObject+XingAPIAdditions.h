//
//  Created by Roberto Seidenberg
//  All rights reserved
//

// Apple
#import <CoreData/CoreData.h>

@interface NSManagedObject(XingAPIAdditions)

// MARK: Utility
/**
 Fetches JSON resources using the XING API for the given path:
 Example pathes:
 /users/me/network_feed.json
 
 @return NSString* containing JSON. Nil if nothing could be fetched.
 @return NSError* in case of failure
 
*/
+ (void)fetchJSONForPath:(NSString *)path withBlock:(void (^)(NSString *, NSError *error))block;
@end
