#import <Foundation/Foundation.h>


@interface BMCrittercismService : NSObject

- (void)enableOptOut;

- (void)startTracking;

- (void)setUsername:(NSString *)username;

- (void)clearUsername;

@end
