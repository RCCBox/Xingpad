//
//  XPAppDelegate.m
//
//  Created by Jörg Polakowski on 05/02/13.
//  Copyright (c) 2013 Joerg Polakowski. All rights reserved.
//

#import "XPAppDelegate.h"
#import "OAuthNotifications.h"
#import "XPViewController.h"

@implementation XPAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.viewController = [[XPViewController alloc] initWithNibName:@"XPViewController" bundle:nil];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];

    return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {

    // todo - refactor: naively parse url
    NSArray *urlComponents = [[url absoluteString] componentsSeparatedByString:@"?"];
    NSArray *requestParameterChunks = [[urlComponents objectAtIndex:1] componentsSeparatedByString:@"&"];
    for (NSString *chunk in requestParameterChunks) {
        NSArray *keyVal = [chunk componentsSeparatedByString:@"="];

        if ([[keyVal objectAtIndex:0] isEqualToString:@"oauth_verifier"]) {
            [[NSNotificationCenter defaultCenter] postNotificationName:OAuthVerifierCanBeAuthorized
                                                                object:[keyVal objectAtIndex:1]];
        }
    }

    return YES;
}

@end
