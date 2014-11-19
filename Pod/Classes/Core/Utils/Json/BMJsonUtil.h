//
//  BMJsonUtil.h
//  BUMPMessages
//
//  Created by Alexander Shchekoldin on 22.04.13.
//  Copyright (c) 2013 BUMP Interactive. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BMJsonUtil : NSObject

+ (NSArray * const)parseJsonArray:(NSArray * const)jsonArray instanceClass:(Class)instanceClass;

@end
