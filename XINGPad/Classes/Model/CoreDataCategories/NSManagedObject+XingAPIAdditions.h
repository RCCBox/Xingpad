//
//  Created by Roberto Seidenberg
//  All rights reserved
//

// Apple
#import <CoreData/CoreData.h>

@interface NSManagedObject(XingAPIAdditions)

#pragma mark - Fetching (GET)

/**
 Fetch JSON resources using the XING API for the given path:
 Example path:
 /users/me/network_feed.json

 This constitutes a GET request.

 @return NSString* containing JSON. Nil if nothing could be fetched.
 @return NSError* in case of failure
 
*/
+ (void)fetchJSONForPath:(NSString *)path withBlock:(void (^)(NSString *, NSError *error))block;

#pragma mark - Persistence

/**
 Converts JSON objects to NSManagedObject entities and saves them to the persistent store.
 
 @return BOOL indicating if the objects have been saved successfully
 @return NSError* in case of failure
 
 */
+ (void)importJSONObjects:(id)jsonObjects intoClass:(Class)aClass callback:(MRSaveCompletionHandler)callback;
@end