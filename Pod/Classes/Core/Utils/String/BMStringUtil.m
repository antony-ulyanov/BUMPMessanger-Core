//
//  BMStringUtil.m
//  BUMPMessages
//
//  Created by Alexander Shchekoldin on 07.02.13.
//  Copyright (c) 2013 BUMP Interactive. All rights reserved.
//

#import "BMStringUtil.h"
#import "BMMacro.h"

@implementation BMStringUtil

#pragma mark [LOGIC]

#pragma mark BMStringUtil

+ (NSString *)stringFromData:(id)data {
    BmAssertNotNil(data);

    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

+ (NSData *)dataFromString:(NSString *)value {
    BmAssertStringNotEmpty(value);

    return [value dataUsingEncoding:NSUTF8StringEncoding];
}

+ (NSString * const)trim:(NSString * const)value {
    return [value stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

+ (BOOL)empty:(NSString *)value {
    BmAssertNotNil(value);

    return [value isEqualToString:@""];
}

@end
