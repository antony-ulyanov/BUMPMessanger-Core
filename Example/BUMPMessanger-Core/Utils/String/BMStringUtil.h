//
//  BMStringUtil.h
//  BUMPMessages
//
//  Created by Alexander Shchekoldin on 07.02.13.
//  Copyright (c) 2013 BUMP Interactive. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BMStringUtil : NSObject

+ (NSData *)dataFromString:(NSString *)value;

+ (NSString *)stringFromData:(id)data;

+ (NSString * const)trim:(NSString * const)value;

+ (BOOL)empty:(NSString *)value;

@end
