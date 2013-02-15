//
//  OAuthPersistenceManager.m
//  XINGPad
//
//  Created by Jörg Polakowski on 11/02/13.
//  Copyright (c) 2013 Joerg Polakowski. All rights reserved.
//

#import "OAuthPersistenceManager.h"
#import "OAuthConsumerCredentials.h"

@implementation OAuthPersistenceManager

+ (OAuthPersistenceManager *)instance {
    static OAuthPersistenceManager *_instance = nil;

    @synchronized (self) {
        if (_instance == nil) {
            _instance = [[self alloc] init];
        }
    }
    return _instance;
}

- (BOOL)isUserAuthorized {
    BOOL authorized = NO;
    NSString *authTokenKey = [NSString stringWithFormat:@"%@%@", [self safePrefix], XING_OAUTH_TOKEN_AUTHORIZED];

    if ([[NSUserDefaults standardUserDefaults] objectForKey:authTokenKey]) {
        DLog(@"User is already authorized.");

        // XING user is already authorized, because an auth token is stored
        // set isLoggedInViaTwitter:YES

        authorized = YES;
    }
    else {
        // user not logged in yet
        DLog(@"No User logged in yet.");
        authorized = NO;
    }
    return authorized;
}

- (NSString *)authorizedUserID {
    NSString *userID = nil;
    if ([self isUserAuthorized]) {
        NSString *userIdKey = [NSString stringWithFormat:@"%@%@", [self safePrefix], XING_OAUTH_USER_ID];
        userID = [[NSUserDefaults standardUserDefaults] objectForKey:userIdKey];
    }
    return nil;
}

- (NSString *)loadOAuthValue:(NSString *)key {
    return [[NSUserDefaults standardUserDefaults] stringForKey:
            [NSString stringWithFormat:@"%@%@", [self safePrefix], key]];
}

- (void)saveOAuthValue:(NSString *)value for:(NSString *)key {
    [[NSUserDefaults standardUserDefaults] setObject:value
                                              forKey:[NSString stringWithFormat:@"%@%@", [self safePrefix], key]];
}

- (void)forget {
    // todo implement
}

- (NSString *)safePrefix {
    /*
    * Having the 'safePrefix' defined in the manager singleton has the following consequences:
    * 1. Only one persisted user can be defined per app and OAuth provider (e.g. xing, twitter).
    */
    return @"OAuth_";
}

@end
