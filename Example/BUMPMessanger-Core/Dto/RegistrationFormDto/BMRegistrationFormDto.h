@interface BMRegistrationFormDto : NSObject

- (id)initWithFirstName:(NSString * const)firstName
               lastName:(NSString * const)lastName
                  email:(NSString * const)email
               password:(NSString * const)password
   passwordConfirmation:(NSString * const)passwordConfirmation
                maleSex:(BOOL const)maleSex;

@property(readonly) NSString *firstName;
@property(readonly) NSString *lastName;
@property(readonly) NSString *email;
@property(readonly) NSString *password;
@property(readonly) NSString *passwordConfirmation;
@property(readonly) BOOL maleSex;

@end
