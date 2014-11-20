#import <Foundation/Foundation.h>

#pragma mark System Versioning

// See "http://stackoverflow.com/questions/12561599/how-to-check-ios-version-is-ios-6".

#define SYSTEM_VERSION_EQUAL_TO(v) \
        ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v) \
        ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v) \
        ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v) \
        ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v) \
        ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

#pragma mark Notification Center

#define BmNcEvent(uniqueEventName) \
        static NSString * const uniqueEventName = @#uniqueEventName

#pragma mark Assert

#define BmAssertNotNil(value) \
        NSAssert(value != nil, @"Parameter %s can't be nil.", #value)

#define BmAssertStringNotEmpty(value) \
        NSAssert(([value isKindOfClass:[NSString class]] && [(NSString*)value length] > 0) == YES, @"Parameter %s can't be an empty string.", #value)

#define BmAssertNumberInRange(value, min, max) \
        NSAssert((value >= min) && (value <= max), @"Parameter %s must be in range [%d..%d].", #value, min, max)

#define BmAssertYes(value) \
        NSAssert((value == YES), @"Expression %s must return YES.", #value)

#define BmAssertKind(value, clazz) \
        BmAssertNotNil(value); \
        NSAssert(([value isKindOfClass:clazz] == YES), @"Parameter %s must be an instance of the class %s.", #value, #clazz)
