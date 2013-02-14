//
//  Created by Roberto Seidenberg
//  All rights reserved
//

// Header
#import "NSManagedObject+XingAPIAdditions.h"

// Inherited classes
#import "OAuthFactory.h"
#import "OAuthXing.h"

// Network
#import "AFJSONRequestOperation.h"

// Constants
static NSString* const kXPXingApiBaseURL = @"https://api.xing.com/v1";

@implementation NSManagedObject(XingAPIAdditions)

#pragma mark - Fetching

+ (void)fetchJSONForPath:(NSString *)path withBlock:(void (^)(NSDictionary *, NSError *error))block {

    // fetch authenticated OAuth credentials
    OAuthXing *oAuthXing = [OAuthFactory createAndLoadOAuthXingAuthenticator];

    // prepare request URL
    NSURL *url = [NSURL URLWithString:[kXPXingApiBaseURL stringByAppendingString:path]];

    // initialize HTTP request
    NSMutableURLRequest *apiRequest = [NSMutableURLRequest requestWithURL:url];

    // enrich network request with OAuth specific header values
    NSString *oAuthValue = [oAuthXing oAuthHeaderForMethod:@"GET" andUrl:[url absoluteString] andParams:nil];
    [apiRequest addValue:oAuthValue forHTTPHeaderField:@"Authorization"];

    // keep success and failure blocks separately for better readability
    void (^success)(NSURLRequest*, NSHTTPURLResponse*, id) = ^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        NSLog(@"JSON Stream: %@", JSON);

        block(JSON, nil);
    };

    void (^failure)(NSURLRequest*, NSHTTPURLResponse*, NSError*, id) = ^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        DLog(@"Fetching error: %@", [error description]);

        block(JSON, error);
    };

    // setup AFNetwork json request & fire request
    [[AFJSONRequestOperation JSONRequestOperationWithRequest:apiRequest
                                                     success:success
                                                     failure:failure] start];
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