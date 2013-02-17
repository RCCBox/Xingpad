//
//  XPPossibleActions.h
//  XINGPad
//
//  Created by Roberto Seidenberg on 17.02.13.
//  Copyright (c) 2013 Joerg Polakowski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class XPActivity;

@interface XPPossibleActions : NSManagedObject

@property (nonatomic, retain) NSNumber * xpIsLikingPossible;
@property (nonatomic, retain) NSNumber * xpIsCommentingPossible;
@property (nonatomic, retain) NSNumber * xpIsIgnoringPossible;
@property (nonatomic, retain) NSNumber * xpIsSharingPossible;
@property (nonatomic, retain) NSNumber * xpIsDeletingPossible;
@property (nonatomic, retain) XPActivity *xpActivity;

@end
