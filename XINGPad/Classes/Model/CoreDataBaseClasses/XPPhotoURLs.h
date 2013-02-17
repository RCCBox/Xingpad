//
//  XPPhotoURLs.h
//  XINGPad
//
//  Created by Roberto Seidenberg on 17.02.13.
//  Copyright (c) 2013 Joerg Polakowski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class XPUser;

@interface XPPhotoURLs : NSManagedObject

@property (nonatomic, retain) NSString * xpLarge;
@property (nonatomic, retain) NSString * xpMaxiThumb;
@property (nonatomic, retain) NSString * xpMediumThumb;
@property (nonatomic, retain) NSString * xpMiniThumb;
@property (nonatomic, retain) NSString * xpThumb;
@property (nonatomic, retain) XPUser *xpUser;

@end
