//
//  XPStatus.h
//  XINGPad
//
//  Created by Roberto Seidenberg on 17.02.13.
//  Copyright (c) 2013 Joerg Polakowski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class XPObjects, XPUser;

@interface XPStatus : NSManagedObject

@property (nonatomic, retain) NSString * xpContent;
@property (nonatomic, retain) NSDate * xpCreatedAt;
@property (nonatomic, retain) NSString * xpID;
@property (nonatomic, retain) NSSet *xpCreator;
@property (nonatomic, retain) XPObjects *xpObjects;
@end

@interface XPStatus (CoreDataGeneratedAccessors)

- (void)addXpCreatorObject:(XPUser *)value;
- (void)removeXpCreatorObject:(XPUser *)value;
- (void)addXpCreator:(NSSet *)values;
- (void)removeXpCreator:(NSSet *)values;

@end
