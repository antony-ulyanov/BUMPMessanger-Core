#import "BMRegistrationFormDto.h"


@implementation BMRegistrationFormDto

@synthesize firstName = _firstName;
@synthesize lastName = _lastName;
@synthesize email = _email;
@synthesize password = _password;
@synthesize passwordConfirmation = _passwordConfirmation;
@synthesize maleSex = _maleSex;

#pragma mark [LOGIC]

#pragma mark BMRegistrationFormDto

- (id)initWithFirstName:(NSString * const)firstName
               lastName:(NSString * const)lastName
                  email:(NSString * const)email
               password:(NSString * const)password
   passwordConfirmation:(NSString * const)passwordConfirmation
                maleSex:(BOOL const)maleSex {
    self = [super init];

    if (self) {
        _firstName = [firstName copy];
        _lastName = [lastName copy];
        _email = [email copy];
        _password = [password copy];
        _passwordConfirmation = [passwordConfirmation copy];
        _maleSex = maleSex;
    }

    return self;
}

@end
