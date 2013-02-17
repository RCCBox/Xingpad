//
//  XPUser.h
//  XINGPad
//
//  Created by Roberto Seidenberg on 17.02.13.
//  Copyright (c) 2013 Joerg Polakowski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class XPActivity, XPArticle, XPBookmark, XPComment, XPObjects, XPStatus;

@interface XPUser : NSManagedObject

@property (nonatomic, retain) NSString * xpID;
@property (nonatomic, retain) NSSet *xpActivity;
@property (nonatomic, retain) XPArticle *xpArticle;
@property (nonatomic, retain) XPBookmark *xpBookmark;
@property (nonatomic, retain) XPComment *xpComment;
@property (nonatomic, retain) XPObjects *xpObjects;
@property (nonatomic, retain) XPStatus *xpStatus;
@end

@interface XPUser (CoreDataGeneratedAccessors)

- (void)addXpActivityObject:(XPActivity *)value;
- (void)removeXpActivityObject:(XPActivity *)value;
- (void)addXpActivity:(NSSet *)values;
- (void)removeXpActivity:(NSSet *)values;

@end
