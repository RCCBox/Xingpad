//
//  OAuthFactory.m
//
//  Created by Jörg Polakowski on 12/02/13.
//  Copyright (c) 2013 Joerg Polakowski. All rights reserved.
//

#import "OAuthFactory.h"
#import "OAuthConsumerCredentials.h"
#import "OAuthXing.h"

@implementation OAuthFactory

+ (OAuthXing *)createAndLoadOAuthXingAuthenticator {
    OAuthXing *oAuthXing = [[OAuthXing alloc] initWithConsumerKey:OAUTH_CONSUMER_KEY_XING
                                                andConsumerSecret:OAUTH_CONSUMER_SECRET_XING];
    [oAuthXing load];
    return oAuthXing;
}

@end
