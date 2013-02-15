//
//  XPAppDelegate.h
//
//  Created by Jörg Polakowski on 05/02/13.
//  Copyright (c) 2013 Joerg Polakowski. All rights reserved.
//

// Apple
#import <UIKit/UIKit.h>

// OAuth handling
#import "OAuthAuthorizationCallbacks.h"

@interface XPAppDelegate : UIResponder <UIApplicationDelegate, OAuthAuthorizationCallbacks>
// MARK: Properties (public)
// IBOutlets
@property (strong, nonatomic) IBOutlet UIWindow *window;
@end
