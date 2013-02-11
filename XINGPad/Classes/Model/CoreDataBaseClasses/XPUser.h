//
//  XPUser.h
//  XINGPad
//
//  Created by Roberto Seidenberg on 11.02.13.
//  Copyright (c) 2013 Joerg Polakowski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class XPActivity;

@interface XPUser : NSManagedObject

@property (nonatomic, retain) NSString * xpID;
@property (nonatomic, retain) NSSet *xpRelActivity;
@property (nonatomic, retain) XPActivity *xpInvRelActivity;
@end

@interface XPUser (CoreDataGeneratedAccessors)

- (void)addXpRelActivityObject:(XPActivity *)value;
- (void)removeXpRelActivityObject:(XPActivity *)value;
- (void)addXpRelActivity:(NSSet *)values;
- (void)removeXpRelActivity:(NSSet *)values;

@end
