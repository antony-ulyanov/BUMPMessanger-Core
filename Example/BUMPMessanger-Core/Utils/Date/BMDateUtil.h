//
//  BMDateUtil.h
//  BUMPMessages
//
//  Created by Alexander Shchekoldin on 04.03.13.
//  Copyright (c) 2013 BUMP Interactive. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BMDateUtil : NSObject

+ (NSDate *)timestampToDate:(unsigned long long)timestamp;

+ (unsigned long long)dateToTimestamp:(NSDate *)date;

+ (NSString *)formatDateWithTemplate:(NSString *)template date:(NSDate *)date;

@end
