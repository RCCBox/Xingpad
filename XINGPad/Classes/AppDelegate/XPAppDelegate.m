//
//  XPAppDelegate.m
//
//  Created by Jörg Polakowski on 05/02/13.
//  Copyright (c) 2013 Joerg Polakowski. All rights reserved.
//

#import "XPAppDelegate.h"
#import "XPViewController.h"
#import "OAuthXing.h"
#import "OAuthViewController.h"
#import "OAuthPersistenceManager.h"

@implementation XPAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    // DEBUG
    NSLog(@"%@", [[NSUserDefaults standardUserDefaults] dictionaryRepresentation]);

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    self.viewController = [[XPViewController alloc] initWithNibName:@"XPViewController" bundle:nil];
    self.window.rootViewController = self.viewController;

    [self.window makeKeyAndVisible];

    if ([[OAuthPersistenceManager instance] isUserAuthorized] == NO) {
        self.oauthViewController = [OAuthViewController presentCredentialsViewController:self.viewController
                                                                                animated:NO
                                                                              completion:nil
                                                                         callbackURLName:@"xingipad://handleOAuthLogin"];
    }

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
            [self.oauthViewController handleOAuthVerifier:[keyVal objectAtIndex:1]];
        }
    }

    return YES;
}

@end
