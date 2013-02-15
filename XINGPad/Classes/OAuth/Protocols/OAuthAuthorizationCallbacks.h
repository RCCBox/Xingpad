//
//  OAuthAuthorizationCallbacks.h
//
//  Created by Jörg Polakowski on 14/02/13.
//  Copyright (c) 2013 Joerg Polakowski. All rights reserved.
//

@class OAuth;

@protocol OAuthAuthorizationCallbacks <NSObject>

/**
 * Called after the user has successfully authorized the application.
 *
 * @params oauth - the OAuth authenticator object, which contains details about the authenticated user.
*/
- (void) authorizationDidSucceed:(OAuth *)oauth;

/**
 * Called after the user has canceled authorization of the application.
 * Reasons can be: user cancellation, authorization failed
 *
 * @params oauth - the OAuth authenticator object, which contains details about the authenticated user.
*/
- (void) authorizationDidFail:(OAuth *)oauth;

@end
