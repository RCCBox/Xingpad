//
//  XPUser.h
//  XINGPad
//
//  Created by Roberto Seidenberg on 10.02.13.
//  Copyright (c) 2013 Joerg Polakowski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class XPBookmark, XPStatus;

@interface XPUser : NSManagedObject

@property (nonatomic, retain) NSString * xpID;
@property (nonatomic, retain) XPBookmark *xpInvRelBookmark;
@property (nonatomic, retain) XPStatus *xpInvRelStatus;
@property (nonatomic, retain) NSManagedObject *xpInvRelComment;
@property (nonatomic, retain) NSManagedObject *xpInvRelActivity;

@end
