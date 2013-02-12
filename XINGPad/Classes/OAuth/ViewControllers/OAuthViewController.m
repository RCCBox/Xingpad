//
//  OAuthViewController.m
//
//  Created by Jörg Polakowski on 06/02/13.
//  Copyright (c) 2013 Joerg Polakowski. All rights reserved.
//

#import "OAuthViewController.h"
#import "OAuthXing.h"
#import "OAuthFactory.h"

// Private interface
@interface OAuthViewController (Private)
- (void)requestTokenWithCallbackUrl:(NSString *)callbackUrl;
- (void)initializeAndSetup;
@end

@implementation OAuthViewController

+ (OAuthViewController *)presentCredentialsViewController:(UIViewController *)parentController
                                                 animated:(BOOL)flag
                                               completion:(void (^)(void))completion
                                          callbackURLName:(NSString *)callbackURL {

    // It's not allowed to call this method with a nil argument
    // todo Roberto: this gives a compiler warning - fix it
//    ZAssert(callbackURL, @"VIOLATION: Method argument (NSString *)callbackURL: %@", callbackURL);

    OAuthViewController *ctrl = [[OAuthViewController alloc] initWithNibName:@"OAuthViewController" bundle:nil];
    ctrl.oAuthCallbackUrl = callbackURL;

    [parentController presentViewController:ctrl animated:flag completion:completion];
    return ctrl;
}

#pragma mark -
#pragma mark initialization

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self initializeAndSetup];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initializeAndSetup];
    }
    return self;
}

#pragma mark -
#pragma mark UIViewController and memory management

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];

    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];

	self.queue = [[NSOperationQueue alloc] init];

    self.oAuthXing.delegate = self; // todo implement protocol !!!!
    self.delegate = self;

    // Listen for keyboard hide/show notifications so we can properly reconfigure the UI
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification object:nil];

    [self requestTokenWithCallbackUrl:self.oAuthCallbackUrl];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)dealloc {
    [[UIDevice currentDevice] endGeneratingDeviceOrientationNotifications];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark -
#pragma mark Authorize OAuth verifier received through URL callback or UI

- (void)handleOAuthVerifier:(NSString *)oauth_verifier {
    // delegate authorizationRequestDidStart
//	[self.uiDelegate authorizationRequestDidStart:self];

	NSInvocationOperation *operation = [[NSInvocationOperation alloc]
										initWithTarget:self.oAuthXing
										selector:@selector(synchronousAuthorizeXingTokenWithVerifier:)
										object:oauth_verifier];
	[self.queue addOperation:operation];
}

#pragma mark -
#pragma mark OAuthXingCallbacks protocol

// For all of these methods, we invoked oAuth in a background thread, so these are also called
// in background thread. So we first transfer the control back to main thread before doing
// anything else.

- (void) requestXingTokenDidSucceed:(OAuth *)someOAuth {
	if (![NSThread isMainThread]) {
		[self performSelectorOnMainThread:@selector(requestXingTokenDidSucceed:)
							   withObject:someOAuth
							waitUntilDone:NO];
		return;
	}

    NSURL *myURL = [NSURL URLWithString:[NSString stringWithFormat:@"https://api.xing.com/v1/authorize?oauth_token=%@",
                    someOAuth.oauth_token]];

    self.webView.dataDetectorTypes = UIDataDetectorTypeNone;
    self.webView.scalesPageToFit = YES;
    self.webView.delegate = self;

    [self.webView loadRequest:[NSURLRequest requestWithURL:myURL]];

//	[self.uiDelegate tokenRequestDidSucceed:self];
}

- (void) requestXingTokenDidFail:(OAuth *)someOAuth {
	if (![NSThread isMainThread]) {
		[self performSelectorOnMainThread:@selector(requestXingTokenDidFail:)
							   withObject:someOAuth
							waitUntilDone:NO];
		return;
	}

//	[self.uiDelegate tokenRequestDidFail:self];
}

- (void) authorizeXingTokenDidSucceed:(OAuth *)someOAuth {
	if (![NSThread isMainThread]) {
		[self performSelectorOnMainThread:@selector(authorizeXingTokenDidSucceed:)
							   withObject:someOAuth
							waitUntilDone:NO];
		return;
	}

//	[self.uiDelegate authorizationRequestDidSucceed:self];
    [self.delegate oAuthLoginPopupDidAuthorize:self];
}

- (void) authorizeXingTokenDidFail:(OAuth *)someOAuth {
	if (![NSThread isMainThread]) {
		[self performSelectorOnMainThread:@selector(authorizeXingTokenDidFail:)
							   withObject:someOAuth
							waitUntilDone:NO];
		return;
	}

//	[self.uiDelegate authorizationRequestDidFail:self];
}

#pragma mark -
#pragma mark Custom helpers, called from appropriate places in flow

- (void) requestTokenWithCallbackUrl:(NSString *)callbackUrl {
//    [self.uiDelegate tokenRequestDidStart:self];

	NSInvocationOperation *operation = [[NSInvocationOperation alloc]
										initWithTarget:self.oAuthXing
										selector:@selector(synchronousRequestXingTokenWithCallbackUrl:)
										object:callbackUrl];

	[self.queue addOperation:operation];
}

- (void)initializeAndSetup {
    if (self.oAuthXing == nil) {
        self.oAuthXing = [OAuthFactory createAndLoadOAuthXingAuthenticator];
    }
}

#pragma mark -
#pragma mark Keyboard notifications

- (CGFloat)keyboardHeightFromNotification:(NSNotification *)aNotification {
    // http://stackoverflow.com/questions/2807339/uikeyboardboundsuserinfokey-is-deprecated-what-to-use-instead
    CGRect _keyboardEndFrame;
    [[aNotification.userInfo valueForKey:UIKeyboardFrameEndUserInfoKey] getValue:&_keyboardEndFrame];
    CGFloat _keyboardHeight;
    if (UIDeviceOrientationIsPortrait([[UIDevice currentDevice] orientation])) {
        _keyboardHeight = _keyboardEndFrame.size.height;
    }
    else {
        _keyboardHeight = _keyboardEndFrame.size.width;
    }

    return _keyboardHeight;
}

- (void)keyboardWillShow:(NSNotification *)aNotification {
    // todo fix
//    NSTimeInterval animationDuration = [[[aNotification userInfo] objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
//
//    CGRect scrollFrame = scrollView.frame;
//    scrollFrame.size.height = self.view.frame.size.height - [self keyboardHeightFromNotification:aNotification];
//
//    [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
//    [UIView setAnimationDuration:animationDuration];
//    scrollView.frame = scrollFrame;
//    [UIView commitAnimations];
}

- (void)keyboardWillHide:(NSNotification *)aNotification {
    // todo fix

//    CGRect scrollFrame = scrollView.frame;
//    scrollFrame.size.height = self.view.frame.size.height;
//
//    NSTimeInterval animationDuration = [[[aNotification userInfo] objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
//
//    [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
//    [UIView setAnimationDuration:animationDuration];
//    scrollView.frame = scrollFrame;
//    [UIView commitAnimations];
}

#pragma mark -
#pragma mark AAuthLoginPopupDelegate

- (void)oAuthLoginPopupDidCancel:(UIViewController *)popup {
    [self dismissViewControllerAnimated:NO completion:nil];

    // todo user authenticated - adopt UI accordingly
}

- (void)oAuthLoginPopupDidAuthorize:(UIViewController *)popup {
    [self.oAuthXing save];
    [self dismissViewControllerAnimated:NO completion:nil];
    // todo user authenticated - adopt UI accordingly
}

#pragma mark -
#pragma mark UIWebViewDelegate

- (void)webViewDidStartLoad:(UIWebView *)aWebView {
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
}

- (void)webViewDidFinishLoad:(UIWebView *)aWebView {
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}

@end
