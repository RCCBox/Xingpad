//
//  XPActivity.h
//  XINGPad
//
//  Created by Roberto Seidenberg on 13.02.13.
//  Copyright (c) 2013 Joerg Polakowski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class XPGroup, XPMetaComment, XPMetaLike, XPObjects, XPUser;

@interface XPActivity : NSManagedObject

@property (nonatomic, retain) NSNumber * xpAggregated;
@property (nonatomic, retain) NSString * xpAggregatedBy;
@property (nonatomic, retain) NSDate * xpCreatedAt;
@property (nonatomic, retain) NSString * xpVerb;
@property (nonatomic, retain) NSSet *xpGroup;
@property (nonatomic, retain) NSSet *xpMetaComment;
@property (nonatomic, retain) XPMetaLike *xpMetaLike;
@property (nonatomic, retain) NSSet *xpObjects;
@property (nonatomic, retain) NSSet *xpUser;
@end

@interface XPActivity (CoreDataGeneratedAccessors)

- (void)addXpGroupObject:(XPGroup *)value;
- (void)removeXpGroupObject:(XPGroup *)value;
- (void)addXpGroup:(NSSet *)values;
- (void)removeXpGroup:(NSSet *)values;

- (void)addXpMetaCommentObject:(XPMetaComment *)value;
- (void)removeXpMetaCommentObject:(XPMetaComment *)value;
- (void)addXpMetaComment:(NSSet *)values;
- (void)removeXpMetaComment:(NSSet *)values;

- (void)addXpObjectsObject:(XPObjects *)value;
- (void)removeXpObjectsObject:(XPObjects *)value;
- (void)addXpObjects:(NSSet *)values;
- (void)removeXpObjects:(NSSet *)values;

- (void)addXpUserObject:(XPUser *)value;
- (void)removeXpUserObject:(XPUser *)value;
- (void)addXpUser:(NSSet *)values;
- (void)removeXpUser:(NSSet *)values;

@end
