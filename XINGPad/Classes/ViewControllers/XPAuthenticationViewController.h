//
//  XPAuthenticationViewController.h
//
//  Created by Jörg Polakowski on 06/02/13.
//  Copyright (c) 2013 Joerg Polakowski. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OAuthXingCallbacks.h"
#import "OAuthLoginPopupDelegate.h"

@class OAuthXing;

@interface XPAuthenticationViewController : UIViewController <UINavigationControllerDelegate,
        OAuthXingCallbacks, OAuthLoginPopupDelegate, UIWebViewDelegate> {

    IBOutlet UIWebView *webView;

    OAuthXing *oAuthXing;
    NSString *oAuthCallbackUrl;
    NSOperationQueue *queue;

    id <OAuthLoginPopupDelegate> __unsafe_unretained delegate;
}

@property (nonatomic, strong) IBOutlet UIWebView *webView;

@property (unsafe_unretained) id<OAuthLoginPopupDelegate> delegate;

//@property (nonatomic, strong) OAuthXing *oAuthXing;
//@property (nonatomic, copy) NSString *oAuthCallbackUrl;

- (void)authorizeOAuthVerifier:(NSString *)oauth_verifier;

@end
