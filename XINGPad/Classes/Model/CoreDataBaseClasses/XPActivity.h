//
//  XPActivity.h
//  XINGPad
//
//  Created by Roberto Seidenberg on 10.02.13.
//  Copyright (c) 2013 Joerg Polakowski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class XPComment, XPMetaLike, XPUser;

@interface XPActivity : NSManagedObject

@property (nonatomic, retain) NSString * xpVerb;
@property (nonatomic, retain) NSNumber * xpAggregated;
@property (nonatomic, retain) NSString * xpAggregatedBy;
@property (nonatomic, retain) NSDate * xpCreatedAt;
@property (nonatomic, retain) NSSet *xpRelActor;
@property (nonatomic, retain) NSSet *xpRelComment;
@property (nonatomic, retain) NSSet *xpRelMetaLike;
@end

@interface XPActivity (CoreDataGeneratedAccessors)

- (void)addXpRelActorObject:(XPUser *)value;
- (void)removeXpRelActorObject:(XPUser *)value;
- (void)addXpRelActor:(NSSet *)values;
- (void)removeXpRelActor:(NSSet *)values;

- (void)addXpRelCommentObject:(XPComment *)value;
- (void)removeXpRelCommentObject:(XPComment *)value;
- (void)addXpRelComment:(NSSet *)values;
- (void)removeXpRelComment:(NSSet *)values;

- (void)addXpRelMetaLikeObject:(XPMetaLike *)value;
- (void)removeXpRelMetaLikeObject:(XPMetaLike *)value;
- (void)addXpRelMetaLike:(NSSet *)values;
- (void)removeXpRelMetaLike:(NSSet *)values;

@end
