//
//  XPAppDelegate.m
//
//  Created by Jörg Polakowski on 05/02/13.
//  Copyright (c) 2013 Joerg Polakowski. All rights reserved.
//

#import "XPAppDelegate.h"
#import "XPAuthenticationViewController.h"
#import "XPOAuthConsumerCredentials.h"

@implementation XPAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

//    NSLog(@"%@", [[NSUserDefaults standardUserDefaults] dictionaryRepresentation]);

    [self.window makeKeyAndVisible];

    if ([self isUserAuthorized] == NO) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
        authenticationController = (XPAuthenticationViewController *) [storyboard instantiateViewControllerWithIdentifier:@"XPAuthenticationViewController"];
        navigationController = [[UINavigationController alloc] initWithRootViewController:authenticationController];
        navigationController.delegate = authenticationController;
        [self.window addSubview:navigationController.view];
    }

    return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {

    // naively parse url
    NSArray *urlComponents = [[url absoluteString] componentsSeparatedByString:@"?"];
    NSArray *requestParameterChunks = [[urlComponents objectAtIndex:1] componentsSeparatedByString:@"&"];
    for (NSString *chunk in requestParameterChunks) {
        NSArray *keyVal = [chunk componentsSeparatedByString:@"="];

        if ([[keyVal objectAtIndex:0] isEqualToString:@"oauth_verifier"]) {
            [authenticationController authorizeOAuthVerifier:[keyVal objectAtIndex:1]];
        }
    }

    return YES;
}


// todo duplicate code in XPViewController, refactor - JPO
- (BOOL)isUserAuthorized {
    BOOL authorized = NO;
    NSString *authTokenKey = [NSString stringWithFormat:@"%@%@", XING_OAUTH_PREFIX, XING_OAUTH_TOKEN];

    NSLog(@"xXXX - %@", authTokenKey);
    NSLog(@"xXXX - %@", [[NSUserDefaults standardUserDefaults] objectForKey:authTokenKey]);
    
    if ([[NSUserDefaults standardUserDefaults] objectForKey:authTokenKey]) {
        NSLog(@"XING User is already authorized.");

        // XING user is already authorized, because an auth token is stored
        // set isLoggedInViaTwitter:YES

        authorized = YES;
    }
    else {

        // user not logged in yet
        NSLog(@"No XING User logged in yet.");
        authorized = NO;
    }
    return authorized;
}

@end
