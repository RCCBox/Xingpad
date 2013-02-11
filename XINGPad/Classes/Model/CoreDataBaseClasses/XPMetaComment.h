//
//  XPMetaComment.h
//  XINGPad
//
//  Created by Roberto Seidenberg on 11.02.13.
//  Copyright (c) 2013 Joerg Polakowski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class XPActivity, XPComment;

@interface XPMetaComment : NSManagedObject

@property (nonatomic, retain) NSNumber * xpAmount;
@property (nonatomic, retain) XPActivity *xpInvRelActivity;
@property (nonatomic, retain) XPComment *xpRelComment;

@end
