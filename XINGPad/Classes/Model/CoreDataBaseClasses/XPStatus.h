//
//  XPStatus.h
//  XINGPad
//
//  Created by Roberto Seidenberg on 13.02.13.
//  Copyright (c) 2013 Joerg Polakowski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class XPUser;

@interface XPStatus : NSManagedObject

@property (nonatomic, retain) NSString * xpContent;
@property (nonatomic, retain) NSDate * xpCreatedAt;
@property (nonatomic, retain) NSString * xpID;
@property (nonatomic, retain) NSSet *xpCreator;
@end

@interface XPStatus (CoreDataGeneratedAccessors)

- (void)addXpCreatorObject:(XPUser *)value;
- (void)removeXpCreatorObject:(XPUser *)value;
- (void)addXpCreator:(NSSet *)values;
- (void)removeXpCreator:(NSSet *)values;

@end
