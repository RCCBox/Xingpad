//
//  NSDictionary+XingAPIAdditions.m
//  XINGPad
//
//  Created by Roberto Seidenberg on 11.02.13.
//  Copyright (c) 2013 Joerg Polakowski. All rights reserved.
//

// Header
#import "NSDictionary+XingAPIAdditions.h"

// Inherited classes
#import "XPUser.h"
#import "XPCompanyProfile.h"
#import "XPStatus.h"
#import "XPEvent.h"
#import "XPCompanyProfileUpdate.h"
#import "XPJobPosting.h"
#import "XPThread.h"
#import "XPBookmark.h"
#import "XPGroup.h"
#import "XPMetaComment.h"
#import "XPComment.h"
#import "XPMetaLike.h"

@implementation NSDictionary (XingAPIAdditions)

#pragma mark - JSON -> NSManagedobject conversion

- (Class)matchingXingAPIClass {
	
	NSString *propertyType = [self valueForKey:@"type"];
	Class retClass;
	
	if (propertyType) {
		NSDictionary *objectMapping = @{@"user": [XPUser class], @"company_profile": [XPCompanyProfile class], @"status": [XPStatus class], @"event": [XPEvent class], @"company_profile_update": [XPCompanyProfileUpdate class], @"job_posting": [XPJobPosting class], @"thread": [XPThread class], @"bookmark": [XPBookmark class], @"group": [XPGroup class], @"meta_comment": [XPMetaComment class], @"comment": [XPCompanyProfileUpdate class], @"meta_like": [XPMetaLike class]};
		retClass = [objectMapping valueForKey:propertyType];
	}
	
	return retClass;
}
@end