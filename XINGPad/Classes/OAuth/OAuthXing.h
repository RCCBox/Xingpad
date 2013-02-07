//
//  OAuthXing.h
//
//  Created by Jörg Polakowski on 06/02/13.
//  Copyright (c) 2013 Joerg Polakowski. All rights reserved.
//

#import "OAuth.h"
#import "OAuthXingCallbacks.h"

@interface OAuthXing : OAuth {
    NSString *user_id;
    id<OAuthXingCallbacks> __unsafe_unretained delegate;
}

@property (copy) NSString *user_id;
@property (unsafe_unretained) id<OAuthXingCallbacks> delegate;

// XING convenience methods
- (void) synchronousRequestXingToken;
- (void) synchronousRequestXingTokenWithCallbackUrl:(NSString *)callbackUrl;
- (void) synchronousAuthorizeXingTokenWithVerifier:(NSString *)oauth_verifier;
- (BOOL) synchronousVerifyXingCredentials;

@end
