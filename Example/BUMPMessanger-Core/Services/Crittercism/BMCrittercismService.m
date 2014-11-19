#import "BMCrittercismService.h"
#import "Crittercism.h"


static NSString *const CRITTERCISM_APP_ID = @"513eee00558d6a4624000002";

@implementation BMCrittercismService

objection_register_singleton(BMCrittercismService)

#pragma mark [LOGIC]

#pragma mark BMCrittercismService

- (void)enableOptOut {
    [Crittercism setOptOutStatus:YES];
}

- (void)startTracking {
    [Crittercism enableWithAppID:CRITTERCISM_APP_ID];
    [Crittercism setOptOutStatus:NO];
}

- (void)setUsername:(NSString *)username {
    BmAssertStringNotEmpty(username);

    DDLogVerbose(@"Setting \"Crittercism\" user name with value = %@", username);

    [Crittercism setUsername:username];
}

- (void)clearUsername {
    DDLogVerbose(@"Clearing \"Crittercism\" user name");

    [Crittercism setUsername:nil];
}

@end
