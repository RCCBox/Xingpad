//
//  NSDictionary+XingAPIAdditions.h
//  XINGPad
//
//  Created by Roberto Seidenberg on 11.02.13.
//  Copyright (c) 2013 Joerg Polakowski. All rights reserved.
//

// Apple
#import <Foundation/Foundation.h>

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
#import "XPArticle.h"

@interface NSDictionary (XingAPIAdditions)

#pragma mark - JSON -> NSManagedobject conversion

/**
 Tries to derivate a matching core data model class from the "type" property in the dictionary.
 
 @return Matching class for dictionary or Nil
*/
- (Class)matchingXingAPIClass;
@end
