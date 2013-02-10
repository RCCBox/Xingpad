//
//  XPMetaLike.h
//  XINGPad
//
//  Created by Roberto Seidenberg on 10.02.13.
//  Copyright (c) 2013 Joerg Polakowski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface XPMetaLike : NSManagedObject

@property (nonatomic, retain) NSNumber * xpAmount;
@property (nonatomic, retain) NSNumber * xpCurrentUserLiked;
@property (nonatomic, retain) NSManagedObject *xpInvRelActivity;

@end
