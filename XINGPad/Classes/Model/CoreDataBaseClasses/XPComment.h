//
//  XPComment.h
//  XINGPad
//
//  Created by Roberto Seidenberg on 11.02.13.
//  Copyright (c) 2013 Joerg Polakowski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class XPMetaComment, XPUser;

@interface XPComment : NSManagedObject

@property (nonatomic, retain) NSString * xpContent;
@property (nonatomic, retain) NSDate * xpCreatedAt;
@property (nonatomic, retain) NSString * xpID;
@property (nonatomic, retain) XPMetaComment *xpInvRelMetaComment;
@property (nonatomic, retain) NSSet *xpRelUser;
@end

@interface XPComment (CoreDataGeneratedAccessors)

- (void)addXpRelUserObject:(XPUser *)value;
- (void)removeXpRelUserObject:(XPUser *)value;
- (void)addXpRelUser:(NSSet *)values;
- (void)removeXpRelUser:(NSSet *)values;

@end
