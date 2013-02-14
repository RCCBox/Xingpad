//
//  XPBookmark.h
//  XINGPad
//
//  Created by Roberto Seidenberg on 13.02.13.
//  Copyright (c) 2013 Joerg Polakowski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class XPUser;

@interface XPBookmark : NSManagedObject

@property (nonatomic, retain) NSString * xpBookmarkType;
@property (nonatomic, retain) NSDate * xpCreatedAt;
@property (nonatomic, retain) NSString * xpDescription;
@property (nonatomic, retain) NSString * xpID;
@property (nonatomic, retain) NSString * xpImage;
@property (nonatomic, retain) NSString * xpTitle;
@property (nonatomic, retain) NSString * xpURL;
@property (nonatomic, retain) NSSet *xpCreator;
@end

@interface XPBookmark (CoreDataGeneratedAccessors)

- (void)addXpCreatorObject:(XPUser *)value;
- (void)removeXpCreatorObject:(XPUser *)value;
- (void)addXpCreator:(NSSet *)values;
- (void)removeXpCreator:(NSSet *)values;

@end
