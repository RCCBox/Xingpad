//
//  OAuthXingCallbacks.h
//
//  Created by Jörg Polakowski on 06/02/13.
//  Copyright (c) 2013 Joerg Polakowski. All rights reserved.
//

@class OAuth;

@protocol OAuthXingCallbacks <NSObject>

- (void) requestXingTokenDidSucceed:(OAuth *)oAuth;
- (void) requestXingTokenDidFail:(OAuth *)oAuth;
- (void) authorizeXingTokenDidSucceed:(OAuth *)oAuth;
- (void) authorizeXingTokenDidFail:(OAuth *)oAuth;

@end