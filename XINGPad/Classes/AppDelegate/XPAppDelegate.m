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
// Coredata base classes
#import "XPUser.h"
// Authentication
#import "OAuthXing.h"
#import "OAuthViewController.h"
#import "OAuthPersistenceManager.h"
// Viewcontrollers
#import "XPHomeViewController.h"

@interface XPAppDelegate()
@property (strong) OAuthViewController *oauthViewController;
@property (assign) BOOL alreadyCalled;
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

	// User is logged in
    if ([[OAuthPersistenceManager instance] isUserAuthorized]) {
		
		// Get user object for logged in user
		XPUser *user = [XPUser findFirstByAttribute:@"xpID" withValue:[[OAuthPersistenceManager instance] authorizedUserID]];
		
		// Forward user to initial view controller
		XPHomeViewController *xpHVC = (XPHomeViewController *)self.window.rootViewController;
		[xpHVC setUser:user];

	// User did not login before
    } else {
		
		// Ask user for login information
        self.oauthViewController = [OAuthViewController presentCredentialsViewController:self.window.rootViewController animated:NO completion:nil callbackURLName:@"xingipad://handleOAuthLogin"];
        self.oauthViewController.oAuthCallbackDelegate = self;

	}
	
	// Setup debugger for coredata and network debugging
	#ifdef DEBUG
		[self setupPonyDebugger];
	#endif

	// Setup successfull
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

@implementation XPAppDelegate(OAuthAuthorizationProtocol)

#pragma mark - OAuthAuthorizationProtocol

- (void)authorizationDidSucceed:(OAuth *)oauth {
	
    // Persist
	if (!self.alreadyCalled) {
		
		// FIXME: This is beeing called several times
		self.alreadyCalled = YES;
		
		// Create new user  with returned id
		XPUser *user = [XPUser createEntity];
		user.xpID    = [[OAuthPersistenceManager instance] authorizedUserID];
		
		// Forward user object to initial viewcontroller
		XPHomeViewController *xpHVC = (XPHomeViewController *)self.window.rootViewController;
		xpHVC.user = user;
	}
}
- (void)authorizationDidFail:(OAuth *)oauth {
    // todo ?!
}

@end