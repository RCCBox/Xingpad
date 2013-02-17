//
//  XPMetaComment.h
//  XINGPad
//
//  Created by Roberto Seidenberg on 17.02.13.
//  Copyright (c) 2013 Joerg Polakowski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class XPActivity, XPComment;

@interface XPMetaComment : NSManagedObject

@property (nonatomic, retain) NSNumber * xpAmount;
@property (nonatomic, retain) NSNumber * xpCurrentUserCommented;
@property (nonatomic, retain) XPActivity *xpActivity;
@property (nonatomic, retain) NSSet *xpComment;
@end

@interface XPMetaComment (CoreDataGeneratedAccessors)

- (void)addXpCommentObject:(XPComment *)value;
- (void)removeXpCommentObject:(XPComment *)value;
- (void)addXpComment:(NSSet *)values;
- (void)removeXpComment:(NSSet *)values;

@end
