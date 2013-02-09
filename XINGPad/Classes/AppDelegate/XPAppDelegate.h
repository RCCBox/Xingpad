//
//  XPAppDelegate.h
//
//  Created by Jörg Polakowski on 05/02/13.
//  Copyright (c) 2013 Joerg Polakowski. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XPViewController;

@interface XPAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) XPViewController *viewController;

@end
