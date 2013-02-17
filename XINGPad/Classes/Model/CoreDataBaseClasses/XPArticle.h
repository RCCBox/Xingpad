//
//  XPArticle.h
//  XINGPad
//
//  Created by Roberto Seidenberg on 17.02.13.
//  Copyright (c) 2013 Joerg Polakowski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class XPObjects, XPUser;

@interface XPArticle : NSManagedObject

@property (nonatomic, retain) NSDate * xpCreatedAt;
@property (nonatomic, retain) NSString * xpDescription;
@property (nonatomic, retain) NSString * xpID;
@property (nonatomic, retain) NSString * xpImageURL;
@property (nonatomic, retain) NSString * xpTitle;
@property (nonatomic, retain) NSString * xpURL;
@property (nonatomic, retain) XPObjects *xpObjects;
@property (nonatomic, retain) XPUser *xpUser;

@end
