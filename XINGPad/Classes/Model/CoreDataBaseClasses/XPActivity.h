//
//  XPActivity.h
//  XINGPad
//
//  Created by Roberto Seidenberg on 11.02.13.
//  Copyright (c) 2013 Joerg Polakowski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class XPGroup, XPMetaComment, XPMetaLike, XPUser;

@interface XPActivity : NSManagedObject

@property (nonatomic, retain) NSNumber * xpAggregated;
@property (nonatomic, retain) NSString * xpAggregatedBy;
@property (nonatomic, retain) NSDate * xpCreatedAt;
@property (nonatomic, retain) NSString * xpVerb;
@property (nonatomic, retain) XPUser *xpInvRelUser;
@property (nonatomic, retain) NSSet *xpRelUser;
@property (nonatomic, retain) NSSet *xpRelMetaComment;
@property (nonatomic, retain) XPMetaLike *xpRelMetaLike;
@property (nonatomic, retain) NSSet *xpRelGroup;
@end

@interface XPActivity (CoreDataGeneratedAccessors)

- (void)addXpRelUserObject:(XPUser *)value;
- (void)removeXpRelUserObject:(XPUser *)value;
- (void)addXpRelUser:(NSSet *)values;
- (void)removeXpRelUser:(NSSet *)values;

- (void)addXpRelMetaCommentObject:(XPMetaComment *)value;
- (void)removeXpRelMetaCommentObject:(XPMetaComment *)value;
- (void)addXpRelMetaComment:(NSSet *)values;
- (void)removeXpRelMetaComment:(NSSet *)values;

- (void)addXpRelGroupObject:(XPGroup *)value;
- (void)removeXpRelGroupObject:(XPGroup *)value;
- (void)addXpRelGroup:(NSSet *)values;
- (void)removeXpRelGroup:(NSSet *)values;

@end
