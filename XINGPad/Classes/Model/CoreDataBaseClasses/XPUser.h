//
//  XPUser.h
//  XINGPad
//
//  Created by Roberto Seidenberg on 15.02.13.
//  Copyright (c) 2013 Joerg Polakowski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class XPActivity, XPArticle, XPBookmark, XPComment, XPStatus;

@interface XPUser : NSManagedObject

@property (nonatomic, retain) NSString * xpID;
@property (nonatomic, retain) NSSet *xpActivity;
@property (nonatomic, retain) XPBookmark *xpBookmark;
@property (nonatomic, retain) XPComment *xpComment;
@property (nonatomic, retain) XPStatus *xpStatus;
@property (nonatomic, retain) XPArticle *xpArticle;
@end

@interface XPUser (CoreDataGeneratedAccessors)

- (void)addXpActivityObject:(XPActivity *)value;
- (void)removeXpActivityObject:(XPActivity *)value;
- (void)addXpActivity:(NSSet *)values;
- (void)removeXpActivity:(NSSet *)values;

@end
