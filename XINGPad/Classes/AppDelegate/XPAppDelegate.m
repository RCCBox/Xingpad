//
//  XPAppDelegate.m
//
//  Created by Jörg Polakowski on 05/02/13.
//  Copyright (c) 2013 Joerg Polakowski. All rights reserved.
//

// Header
#import "XPAppDelegate.h"

// App classes
// Model
#import "OAuthXing.h"
#import "OAuthViewController.h"
#import "OAuthPersistenceManager.h"

@interface XPAppDelegate()
// MARK: Properties (private)
@property (strong) OAuthViewController *oauthViewController;
@end

@implementation XPAppDelegate

// MARK: Template methods
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    // DEBUG
    NSLog(@"%@", [[NSUserDefaults standardUserDefaults] dictionaryRepresentation]);
	
	// Setup coredata with SQLite db
	[MagicalRecord setupCoreDataStack];

	// Present window
	[self.window makeKeyAndVisible];

	// User did not login befor
	
    if ([[OAuthPersistenceManager instance] isUserAuthorized] == NO) {

		// Ask user for login information
        self.oauthViewController = [OAuthViewController presentCredentialsViewController:self.window.rootViewController animated:NO completion:nil callbackURLName:@"xingipad://handleOAuthLogin"];
    }

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
