//
//  XPObjects.h
//  XINGPad
//
//  Created by Roberto Seidenberg on 15.02.13.
//  Copyright (c) 2013 Joerg Polakowski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class XPActivity, XPArticle, XPBookmark, XPCompanyProfile, XPCompanyProfileUpdate, XPEvent, XPGroup, XPJobPosting, XPStatus, XPThread, XPUser;

@interface XPObjects : NSManagedObject

@property (nonatomic, retain) NSString * xpID;
@property (nonatomic, retain) XPActivity *xpActivity;
@property (nonatomic, retain) NSSet *xpStatus;
@property (nonatomic, retain) NSSet *xpUser;
@property (nonatomic, retain) NSSet *xpEvent;
@property (nonatomic, retain) NSSet *xpCompanyProfile;
@property (nonatomic, retain) NSSet *xpCompanyProfileUpdate;
@property (nonatomic, retain) NSSet *xpJobPosting;
@property (nonatomic, retain) NSSet *xpThread;
@property (nonatomic, retain) NSSet *xpBookmark;
@property (nonatomic, retain) NSSet *xpGroup;
@property (nonatomic, retain) NSSet *xpArticle;
@end

@interface XPObjects (CoreDataGeneratedAccessors)

- (void)addXpStatusObject:(XPStatus *)value;
- (void)removeXpStatusObject:(XPStatus *)value;
- (void)addXpStatus:(NSSet *)values;
- (void)removeXpStatus:(NSSet *)values;

- (void)addXpUserObject:(XPUser *)value;
- (void)removeXpUserObject:(XPUser *)value;
- (void)addXpUser:(NSSet *)values;
- (void)removeXpUser:(NSSet *)values;

- (void)addXpEventObject:(XPEvent *)value;
- (void)removeXpEventObject:(XPEvent *)value;
- (void)addXpEvent:(NSSet *)values;
- (void)removeXpEvent:(NSSet *)values;

- (void)addXpCompanyProfileObject:(XPCompanyProfile *)value;
- (void)removeXpCompanyProfileObject:(XPCompanyProfile *)value;
- (void)addXpCompanyProfile:(NSSet *)values;
- (void)removeXpCompanyProfile:(NSSet *)values;

- (void)addXpCompanyProfileUpdateObject:(XPCompanyProfileUpdate *)value;
- (void)removeXpCompanyProfileUpdateObject:(XPCompanyProfileUpdate *)value;
- (void)addXpCompanyProfileUpdate:(NSSet *)values;
- (void)removeXpCompanyProfileUpdate:(NSSet *)values;

- (void)addXpJobPostingObject:(XPJobPosting *)value;
- (void)removeXpJobPostingObject:(XPJobPosting *)value;
- (void)addXpJobPosting:(NSSet *)values;
- (void)removeXpJobPosting:(NSSet *)values;

- (void)addXpThreadObject:(XPThread *)value;
- (void)removeXpThreadObject:(XPThread *)value;
- (void)addXpThread:(NSSet *)values;
- (void)removeXpThread:(NSSet *)values;

- (void)addXpBookmarkObject:(XPBookmark *)value;
- (void)removeXpBookmarkObject:(XPBookmark *)value;
- (void)addXpBookmark:(NSSet *)values;
- (void)removeXpBookmark:(NSSet *)values;

- (void)addXpGroupObject:(XPGroup *)value;
- (void)removeXpGroupObject:(XPGroup *)value;
- (void)addXpGroup:(NSSet *)values;
- (void)removeXpGroup:(NSSet *)values;

- (void)addXpArticleObject:(XPArticle *)value;
- (void)removeXpArticleObject:(XPArticle *)value;
- (void)addXpArticle:(NSSet *)values;
- (void)removeXpArticle:(NSSet *)values;

@end
