//
//  XPBookmark.h
//  XINGPad
//
//  Created by Roberto Seidenberg on 10.02.13.
//  Copyright (c) 2013 Joerg Polakowski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface XPBookmark : NSManagedObject

@property (nonatomic, retain) NSString * xpBookmarkType;
@property (nonatomic, retain) NSDate * xpCreatedAt;
@property (nonatomic, retain) NSString * xpDescription;
@property (nonatomic, retain) NSString * xpID;
@property (nonatomic, retain) NSString * xpImage;
@property (nonatomic, retain) NSString * xpTitle;
@property (nonatomic, retain) NSString * xpURL;
@property (nonatomic, retain) NSSet *xpRelCreator;
@end

@interface XPBookmark (CoreDataGeneratedAccessors)

- (void)addXpRelCreatorObject:(NSManagedObject *)value;
- (void)removeXpRelCreatorObject:(NSManagedObject *)value;
- (void)addXpRelCreator:(NSSet *)values;
- (void)removeXpRelCreator:(NSSet *)values;

@end