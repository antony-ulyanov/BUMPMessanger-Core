//
//  BMDateUtil.m
//  BUMPMessages
//
//  Created by Alexander Shchekoldin on 04.03.13.
//  Copyright (c) 2013 BUMP Interactive. All rights reserved.
//

#import "BMDateUtil.h"

@implementation BMDateUtil

#pragma mark [LOGIC]

#pragma mark BMDateUtil

+ (NSDate *)timestampToDate:(unsigned long long)timestamp {
    return [NSDate dateWithTimeIntervalSince1970:timestamp / 1000.0f];
}

+ (unsigned long long)dateToTimestamp:(NSDate *)date {
    return (unsigned long long) round([date timeIntervalSince1970] * 1000.0);
}

+ (NSString *)formatDateWithTemplate:(NSString *)template date:(NSDate *)date {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = template;

    [dateFormatter setTimeZone:[NSTimeZone localTimeZone]];

    return [dateFormatter stringFromDate:date];
}

@end
