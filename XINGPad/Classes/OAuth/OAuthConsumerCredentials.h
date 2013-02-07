//
//  OAuthConsumerCredentials.h
//
//  Created by Jörg Polakowski on 06/02/13.
//  Copyright (c) 2013 Joerg Polakowski. All rights reserved.
//

// todo these are the TEST keys and need to be replaced with production keys !!!

/**
 * The consumer key assigned to your application.
 */
#define OAUTH_CONSUMER_KEY_XING     @"8f6316c750aae4b741b3"

/**
 * The consumer secret key assigned to your application.
 */
#define OAUTH_CONSUMER_SECRET_XING  @"fa1b746da8a03eda26ff2f58c5f35da054bca66c"





/**
 * XING specific OAuth values.
 * String prefix for values, which may be persisted by your app, e.g. NSUserDefaults
 *
 * Note: Changing the prefix might cause an already authenticated user as unregistered.
 * Because the app can't load the already stored OAuth token information.
 */
#define XING_OAUTH_PREFIX           @"OAuthXING_"

/**
 * The request token to be used in the next call. Please note that this token is not
 * an access token and you will not be able to perform calls with it in order to access
 * XING data. Instead, your application should use the call described next to exchange
 * this request token for an access token.
 */
#define XING_OAUTH_TOKEN            @"oauth_token"

/**
 * The secret for the OAuth request token. This should be used to generate the
 * request signature as described in OAuth 1.0 specification, section 3.4.
 */
#define XING_OAUTH_TOKEN_SECRET     @"oauth_token_secret"

/**
 * Boolean value, which indicates whether the token has been authorized or not.
 */
#define XING_OAUTH_TOKEN_AUTHORIZED @"oauth_token_authorized"
