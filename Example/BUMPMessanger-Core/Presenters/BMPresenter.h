@protocol BMPresenter <NSObject>

@required
- (id)initWithJson:(NSDictionary * const)json;

@optional
+ (NSArray * const)parseJsonArray:(NSArray * const)jsonArray;

- (NSDictionary * const)toJson;

@end
