//
//  BMJsonUtil.m
//  BUMPMessages
//
//  Created by Alexander Shchekoldin on 22.04.13.
//  Copyright (c) 2013 BUMP Interactive. All rights reserved.
//

#import "BMJsonUtil.h"
#import "BMPresenter.h"

@implementation BMJsonUtil

#pragma mark [LOGIC]

#pragma mark BMJsonUtil

+ (NSArray * const)parseJsonArray:(NSArray * const)jsonArray instanceClass:(Class)instanceClass {
    BmAssertNotNil(jsonArray);
    BmAssertNotNil(instanceClass);
    BmAssertYes([instanceClass conformsToProtocol:@protocol(BMPresenter)]);

    NSMutableArray *result = [NSMutableArray arrayWithCapacity:[jsonArray count]];

    for (NSUInteger i = 0; i < [jsonArray count]; ++i) {
        NSDictionary *json = jsonArray[i];
        [result addObject:[[instanceClass alloc] initWithJson:json]];
    }

    return result;
}

@end
