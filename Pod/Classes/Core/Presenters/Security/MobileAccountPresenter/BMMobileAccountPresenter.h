#import "BMPresenter.h"


@interface BMMobileAccountPresenter : NSObject <BMPresenter>

- (id)initWithJson:(NSDictionary * const)json;

- (NSDictionary * const)toJson;

@property(readonly) unsigned long long userId;
@property(readonly) NSString *securityToken;

@end
