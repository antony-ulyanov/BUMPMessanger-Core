#import "BMMobileAccountPresenter.h"


@implementation BMMobileAccountPresenter

@synthesize userId = _userId;
@synthesize securityToken = _securityToken;

#pragma mark [LOGIC]

#pragma mark Private

- (void)parse:(NSDictionary * const)json {
    BmAssertNotNil(json);
    BmAssertYes([[json allKeys] count] == 2);

    NSNumber *rawUserId = [json objectForKey:@"userId"];
    NSString *rawSecurityToken = [json objectForKey:@"securityToken"];

    BmAssertNotNil(rawUserId);
    BmAssertNotNil(rawSecurityToken);

    _userId = [rawUserId unsignedLongLongValue];
    _securityToken = [rawSecurityToken copy];
}

#pragma mark BMDialogPresenter

- (id)initWithJson:(NSDictionary * const)json {
    self = [super init];

    if (self) {
        [self parse:json];
    }

    return self;
}

- (NSDictionary * const)toJson {
    return @{
            @"userId" : [NSNumber numberWithUnsignedLongLong:_userId],
            @"securityToken" : [_securityToken copy]
    };
}

@end
