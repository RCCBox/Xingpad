//
//  XPCompanyProfileUpdate.h
//  XINGPad
//
//  Created by Roberto Seidenberg on 10.02.13.
//  Copyright (c) 2013 Joerg Polakowski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface XPCompanyProfileUpdate : NSManagedObject

@property (nonatomic, retain) NSDate * xpCreatedAt;
@property (nonatomic, retain) NSString * xpDescription;
@property (nonatomic, retain) NSString * xpID;
@property (nonatomic, retain) NSString * xpName;
@property (nonatomic, retain) NSString * xpPermalink;

@end
