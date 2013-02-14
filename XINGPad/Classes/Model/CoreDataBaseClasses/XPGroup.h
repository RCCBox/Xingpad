//
//  XPGroup.h
//  XINGPad
//
//  Created by Roberto Seidenberg on 13.02.13.
//  Copyright (c) 2013 Joerg Polakowski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class XPActivity;

@interface XPGroup : NSManagedObject

@property (nonatomic, retain) NSDate * xpCreatedAt;
@property (nonatomic, retain) NSString * xpDisplayName;
@property (nonatomic, retain) NSString * xpID;
@property (nonatomic, retain) NSString * xpPermalink;
@property (nonatomic, retain) XPActivity *xpActivity;

@end
