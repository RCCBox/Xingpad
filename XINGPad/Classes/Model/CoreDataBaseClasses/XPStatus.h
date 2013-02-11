//
//  XPStatus.h
//  XINGPad
//
//  Created by Roberto Seidenberg on 11.02.13.
//  Copyright (c) 2013 Joerg Polakowski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class XPUser;

@interface XPStatus : NSManagedObject

@property (nonatomic, retain) NSString * xpContent;
@property (nonatomic, retain) NSDate * xpCreatedAt;
@property (nonatomic, retain) NSString * xpID;
@property (nonatomic, retain) NSSet *xpRelCreator;
@end

@interface XPStatus (CoreDataGeneratedAccessors)

- (void)addXpRelCreatorObject:(XPUser *)value;
- (void)removeXpRelCreatorObject:(XPUser *)value;
- (void)addXpRelCreator:(NSSet *)values;
- (void)removeXpRelCreator:(NSSet *)values;

@end
