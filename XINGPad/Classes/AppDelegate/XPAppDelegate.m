//
//  XPAppDelegate.m
//
//  Created by Jörg Polakowski on 05/02/13.
//  Copyright (c) 2013 Joerg Polakowski. All rights reserved.
//

// Header
#import "XPAppDelegate.h"

// Debug
// Vendor
#import <PonyDebugger/PonyDebugger.h>

// App classes
// Model
#import "OAuthXing.h"
#import "OAuthViewController.h"
#import "OAuthPersistenceManager.h"

@interface XPAppDelegate()
@property (strong) OAuthViewController *oauthViewController;
@end

@implementation XPAppDelegate(Private)

#pragma mark - Debugging

- (void)setupPonyDebugger {
		
    PDDebugger *debugger = [PDDebugger defaultInstance];
    
    // Enable Network debugging, and automatically track network traffic that comes through any classes that NSURLConnectionDelegate methods.
    [debugger enableNetworkTrafficDebugging];
    [debugger forwardAllNetworkTraffic];
    
    // Enable Core Data debugging, and broadcast the main managed object context.
    [debugger enableCoreDataDebugging];
    [debugger addManagedObjectContext:[NSManagedObjectContext defaultContext] withName:@"XingPAD default MR context"];

    // Auto connect via bonjour discovery
	[debugger connectToURL:[NSURL URLWithString:@"ws://localhost:9000/device"]];
}

@end

@implementation XPAppDelegate

#pragma mark - Template methods

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	
	// Setup coredata with SQLite db
	[MagicalRecord setupCoreDataStack];

	// Present window
	[self.window makeKeyAndVisible];

	// User did not login before	
    if ([[OAuthPersistenceManager instance] isUserAuthorized] == NO) {

		// Ask user for login information
        self.oauthViewController = [OAuthViewController presentCredentialsViewController:self.window.rootViewController animated:NO completion:nil callbackURLName:@"xingipad://handleOAuthLogin"];
    }
	
	#ifdef DEBUG
		[self setupPonyDebugger];
	#endif

    return YES;
}
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {

    // todo - refactor: naively parse url
    NSArray *urlComponents = [[url absoluteString] componentsSeparatedByString:@"?"];
    NSArray *requestParameterChunks = [[urlComponents objectAtIndex:1] componentsSeparatedByString:@"&"];
    for (NSString *chunk in requestParameterChunks) {
        NSArray *keyVal = [chunk componentsSeparatedByString:@"="];

        if ([[keyVal objectAtIndex:0] isEqualToString:@"oauth_verifier"]) {
            [self.oauthViewController handleOAuthVerifier:[keyVal objectAtIndex:1]];
        }
    }

    return YES;
}
@end
