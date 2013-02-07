//
//  OAuthLoginPopupDelegate.h
//
//  Created by Jörg Polakowski on 06/02/13.
//  Copyright (c) 2013 Joerg Polakowski. All rights reserved.
//

@protocol OAuthLoginPopupDelegate <NSObject>
- (void)oAuthLoginPopupDidCancel:(UIViewController *)popup;
- (void)oAuthLoginPopupDidAuthorize:(UIViewController *)popup;
@end