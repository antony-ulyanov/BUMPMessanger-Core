#import "BMRetinaDisplayUtil.h"
#import "BMMacro.h"


@implementation BMRetinaDisplayUtil

#pragma mark Logic#Public

/**
 * See http://www.sourcedrop.net/gTC2a09877843.
 */
+ (BOOL const)isRetina4Inch {
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    return ([UIScreen mainScreen].scale == 2.0f) && (screenHeight == 568.0f);
}

+ (NSString * const)updateImageNameForRetina4Inch:(NSString * const)imageName {
    BmAssertStringNotEmpty(imageName);
    
    NSMutableString *result = [imageName mutableCopy];
    
    if ([BMRetinaDisplayUtil isRetina4Inch]) {
        NSRange insertRange = [result rangeOfString:@"@2x" options:NSBackwardsSearch];
        
        if (insertRange.location == NSNotFound) {
            insertRange = [result rangeOfString:@"." options:NSBackwardsSearch];
        }
        
        [result insertString:@"-568h" atIndex:insertRange.location];
    }
    
    // Immutable copy of the result.
    return [NSString stringWithString:result];
}

@end
