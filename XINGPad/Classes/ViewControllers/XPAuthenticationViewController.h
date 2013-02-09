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

@interface XPAuthenticationViewController : UIViewController <OAuthXingCallbacks, OAuthLoginPopupDelegate,
        UIWebViewDelegate> {

}

@property (strong) OAuthXing *oAuthXing;
@property (strong) NSString *oAuthCallbackUrl;
@property (strong) NSOperationQueue *queue;

@property (nonatomic, strong) IBOutlet UIWebView *webView;

@property (unsafe_unretained) id<OAuthLoginPopupDelegate> delegate;

@end
