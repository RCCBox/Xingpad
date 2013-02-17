//
//  XPComment.h
//  XINGPad
//
//  Created by Roberto Seidenberg on 17.02.13.
//  Copyright (c) 2013 Joerg Polakowski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class XPMetaComment, XPUser;

@interface XPComment : NSManagedObject

@property (nonatomic, retain) NSString * xpContent;
@property (nonatomic, retain) NSDate * xpCreatedAt;
@property (nonatomic, retain) NSString * xpID;
@property (nonatomic, retain) XPMetaComment *xpMetaComment;
@property (nonatomic, retain) NSSet *xpUser;
@end

@interface XPComment (CoreDataGeneratedAccessors)

- (void)addXpUserObject:(XPUser *)value;
- (void)removeXpUserObject:(XPUser *)value;
- (void)addXpUser:(NSSet *)values;
- (void)removeXpUser:(NSSet *)values;

@end
