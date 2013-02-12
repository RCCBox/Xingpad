//
//  OAuthFactory.h
//
//  This factory can be used to fetch OAuth authenticators.
//  Each authenticator is fully initialized and pre-loaded with everything that's
//  needed to authenticate HTTP requests.
//
//  Created by Jörg Polakowski on 12/02/13.
//  Copyright (c) 2013 Joerg Polakowski. All rights reserved.
//

#import <Foundation/Foundation.h>

@class OAuthXing;

@interface OAuthFactory : NSObject

+ (OAuthXing *) createAndLoadOAuthXingAuthenticator;

@end
