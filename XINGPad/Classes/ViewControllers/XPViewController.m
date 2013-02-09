//
//  XPViewController.m
//  Created by Jörg Polakowski on 05/02/13.
//  Copyright (c) 2013 Joerg Polakowski. All rights reserved.
//

#import "XPViewController.h"
#import "OAuthConsumerCredentials.h"

@interface XPViewController ()

@end

@implementation XPViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

    if ([self isUserAuthorized] == NO) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
        UIViewController *ctrl = [storyboard instantiateViewControllerWithIdentifier:@"XPAuthenticationViewController"];
        [self presentViewController:ctrl animated:NO completion:nil];
    }
}

// todo refactor - JPO
- (BOOL)isUserAuthorized {
    BOOL authorized = NO;
    NSString *authTokenKey = [NSString stringWithFormat:@"%@%@", XING_OAUTH_PREFIX, XING_OAUTH_TOKEN];

    if ([[NSUserDefaults standardUserDefaults] objectForKey:authTokenKey]) {
        DLog(@"XING User is already authorized.");

        // XING user is already authorized, because an auth token is stored
        // set isLoggedInViaTwitter:YES

        authorized = YES;
    }
    else {

        // user not logged in yet
        DLog(@"No XING User logged in yet.");
        authorized = NO;
    }
    return authorized;
}

@end
