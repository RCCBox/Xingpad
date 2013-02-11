//
//  Created by Roberto Seidenberg
//  All rights reserved
//

// Header
#import "NSManagedObject+XingAPIAdditions.h"

// Inherited classes
// OAuth herer ...

@implementation NSManagedObject(XingAPIAdditions)

#pragma mark - Fetching

+ (void)fetchJSONForPath:(NSString *)path withBlock:(void (^)(NSString *, NSError *error))block {
	
	// Read placeholder string for testing
	NSError *error;
	NSString *jsonPath   = [[NSBundle mainBundle] pathForResource:@"NetworkActivity" ofType:@"json"];
	NSString *jsonString = [NSString stringWithContentsOfFile:jsonPath encoding:NSUTF8StringEncoding error:&error];
	
	// Error
	if (error) {
		
		// Call block with error object
		block(nil, error);
		
	// Success
	} else if (jsonString) {
		
		// Call block with JSON
		block(jsonString, nil);
		
	// Nothing to return
	} else {
		
		// Call block with nil values
		block (nil, nil);
	}
	
	// Build OAuth Fetching stuff
	// Get JSON string
	
	// Return string and nil error
	// Or nil
	// Or nil and error
}

#pragma mark - Persistence

+ (void)importJSONObjects:(id)jsonObjects intoClass:(Class)aClass callback:(MRSaveCompletionHandler)callback {
	
	// Persist
	[MagicalRecord saveWithBlock:^(NSManagedObjectContext *localContext) {
		
		// Import object graph
		// Object is a dictionary
		if ([jsonObjects isKindOfClass:[NSDictionary class]]) {
			id anObject = [aClass performSelector:@selector(createInContext:) withObject:localContext];
			[anObject performSelector:@selector(importValuesForKeysWithObject:) withObject:jsonObjects];
			
			// Object is an array
		} else if ([jsonObjects isKindOfClass:[NSArray class]]) {
			for (NSDictionary *aDict in jsonObjects) {
				id anObject = [aClass performSelector:@selector(createInContext:) withObject:localContext];
				[anObject performSelector:@selector(importValuesForKeysWithObject:) withObject:aDict];
			}
		}
		
	} completion:callback];
}
@end