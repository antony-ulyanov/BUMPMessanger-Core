#import "BMGoogleAnalyticsService.h"


static NSString *const GA_TRACKING_ID = @"UA-2486167-6";

@implementation BMGoogleAnalyticsService

objection_register_singleton(BMGoogleAnalyticsService)

#pragma mark [LOGIC]

#pragma mark BMGoogleAnalyticsService

- (void)enableOptOut {
    [[GAI sharedInstance] setOptOut:YES];
}

- (void)startTracking {
    [[GAI sharedInstance] setOptOut:NO];
    [GAI sharedInstance].trackUncaughtExceptions = YES;
    [GAI sharedInstance].dispatchInterval = 20;
    [GAI sharedInstance].debug = YES;
    [[GAI sharedInstance] trackerWithTrackingId:GA_TRACKING_ID];
}

@end
