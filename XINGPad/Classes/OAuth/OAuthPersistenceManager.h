//
//  OAuthPersistenceManager.h
//  XINGPad
//
//  Created by Jörg Polakowski on 11/02/13.
//  Copyright (c) 2013 Joerg Polakowski. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OAuthPersistenceManager : NSObject

+ (OAuthPersistenceManager *)instance;

- (BOOL)isUserAuthorized;

- (NSString *)loadOAuthValue:(NSString *)key;

- (void)saveOAuthValue:(NSString *)value for:(NSString *)key;

- (void)forget;

// What prefix to use for the keys when persisting values.
// Useful to avoid key naming conflicts.
- (NSString *)safePrefix;

@end
