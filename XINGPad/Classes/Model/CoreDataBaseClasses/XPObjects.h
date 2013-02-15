//
//  XPObjects.h
//  XINGPad
//
//  Created by Roberto Seidenberg on 15.02.13.
//  Copyright (c) 2013 Joerg Polakowski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class XPActivity, XPStatus, XPUser;

@interface XPObjects : NSManagedObject

@property (nonatomic, retain) NSString * xpID;
@property (nonatomic, retain) XPActivity *xpActivity;
@property (nonatomic, retain) NSSet *xpStatus;
@property (nonatomic, retain) NSSet *xpUser;
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

@end
