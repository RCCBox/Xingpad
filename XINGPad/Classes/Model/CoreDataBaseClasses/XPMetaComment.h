//
//  XPMetaComment.h
//  XINGPad
//
//  Created by Roberto Seidenberg on 10.02.13.
//  Copyright (c) 2013 Joerg Polakowski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface XPMetaComment : NSManagedObject

@property (nonatomic, retain) NSNumber * xpAmount;
@property (nonatomic, retain) NSString * xpID;
@property (nonatomic, retain) NSSet *xpRelComment;
@end

@interface XPMetaComment (CoreDataGeneratedAccessors)

- (void)addXpRelCommentObject:(NSManagedObject *)value;
- (void)removeXpRelCommentObject:(NSManagedObject *)value;
- (void)addXpRelComment:(NSSet *)values;
- (void)removeXpRelComment:(NSSet *)values;

@end
