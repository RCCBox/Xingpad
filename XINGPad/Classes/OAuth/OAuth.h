//
//  OAuth.h
//
//  Created by Jörg Polakowski on 06/02/13.
//  Copyright (c) 2013 Joerg Polakowski. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OAuth : NSObject

// You initialize the object with your app (consumer) credentials.
- (id) initWithConsumerKey:(NSString *)aConsumerKey andConsumerSecret:(NSString *)aConsumerSecret;

// This is really the only critical oAuth method you need.
- (NSString *) oAuthHeaderForMethod:(NSString *)method andUrl:(NSString *)url andParams:(NSDictionary *)params;	

// Child classes need this method during initial authorization phase. No need to call during real-life use.
- (NSString *) oAuthHeaderForMethod:(NSString *)method andUrl:(NSString *)url andParams:(NSDictionary *)params
					 andTokenSecret:(NSString *)token_secret;

// If you detect a login state inconsistency in your app, use this to reset the context back to default,
// not-logged-in state.
- (void) forget;

// Load and save context from/to NSUserDefaults. Child classes should override these, call the parent method
// and also do the load/save of their own custom parameters using the same save prefix.
- (void) load;
- (void) save;

// my app credentials
@property (copy) NSString *oauth_consumer_key;
@property (copy) NSString *oauth_consumer_secret;

// fixed to "HMAC-SHA1"
@property (copy) NSString *oauth_signature_method;

// calculated at runtime for each signature
@property (copy) NSString *oauth_timestamp;
@property (copy) NSString *oauth_nonce;

// Fixed to "1.0". Although now that we support v2 too, should fix this.
@property (copy) NSString *oauth_version;

// We obtain these from the provider.
// These may be either request token (oauth 1.0a 6.1.2) or access token (oauth 1.0a 6.3.2);
// determine semantics with oauth_token_authorized and call synchronousVerifyCredentials
// if you want to be really sure.
//
// For OAuth 2.0, the token simply stores the token that the provider issued, and
// token_secret is undefined.
@property (copy) NSString *oauth_token;
@property (copy) NSString *oauth_token_secret;

// What prefix to use for the keys when saving and loading to/from NSUserDefaults.
// Useful to avoid key naming conflicts.
@property (copy) NSString *save_prefix;

// YES if this token has been authorized and can be used for production calls.
// You need to save and load the state of this yourself, but you don't need to
// modify it during runtime.
@property (assign) BOOL oauth_token_authorized;

@end

