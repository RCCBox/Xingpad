//
//  XPAppDelegate.h
//
//  Created by Jörg Polakowski on 05/02/13.
//  Copyright (c) 2013 Joerg Polakowski. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XPAuthenticationViewController;

@interface XPAppDelegate : UIResponder <UIApplicationDelegate> {
    UINavigationController *navigationController;
    XPAuthenticationViewController *authenticationController;
}

@property (strong, nonatomic) UIWindow *window;

@end
