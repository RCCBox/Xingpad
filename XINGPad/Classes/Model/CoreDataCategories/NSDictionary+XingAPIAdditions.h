//
//  NSDictionary+XingAPIAdditions.h
//  XINGPad
//
//  Created by Roberto Seidenberg on 11.02.13.
//  Copyright (c) 2013 Joerg Polakowski. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (XingAPIAdditions)

#pragma mark - JSON -> NSManagedobject conversion

/**
 Tries to derivate a matching core data model class from the "type" property in the dictionary.
 
 @return Matching class for dictionary or Nil
*/
- (Class)matchingXingAPIClass;
@end
