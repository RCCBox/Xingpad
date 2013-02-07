//
//  XingLoginUiFeedback.h
//
//  Created by Jörg Polakowski on 06/02/13.
//  Copyright (c) 2013 Joerg Polakowski. All rights reserved.
//

@class XingLoginPopup;

@protocol XingLoginUiFeedback <NSObject>

- (void) tokenRequestDidStart:(XingLoginPopup *)xingLogin;
- (void) tokenRequestDidSucceed:(XingLoginPopup *)xingLogin;
- (void) tokenRequestDidFail:(XingLoginPopup *)xingLogin;

- (void) authorizationRequestDidStart:(XingLoginPopup *)xingLogin;
- (void) authorizationRequestDidSucceed:(XingLoginPopup *)xingLogin;
- (void) authorizationRequestDidFail:(XingLoginPopup *)xingLogin;

@end