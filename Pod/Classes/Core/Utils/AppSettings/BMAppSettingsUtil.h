#import "BMMobileAccountPresenter.h"


/**
 Contains methods to deal with persistent application settings (NSUserDefaults).
 */
@interface BMAppSettingsUtil : NSObject

+ (void)loadPlistConfig;

+ (BOOL const)isAppStoreOrAdHocBuild;

+ (NSString * const)apiVersion;

+ (NSString * const)appVersion;

+ (NSString * const)vkontakteAppId;

+ (NSString * const)facebookAppId;

+ (NSString * const)googlePlusAppId;

+ (NSString * const)googlePlusClientSecret;

/**
 Mirror domain to be used in all HTTP requests.
 */
+ (NSString * const)currentMirrorDomain;

+ (BMMobileAccountPresenter * const)mobileAccount;

+ (void)setMobileAccount:(BMMobileAccountPresenter * const)mobileAccount;

+ (void)clearMobileAccount;

+ (void)setInReview:(BOOL)inReview;

+ (BOOL)inReview;

+ (void)setSuperuser:(BOOL)superuser;

+ (BOOL)superuser;

/**
 UUID
*/
+ (NSString * const)uuid;

+ (void)setUuid:(NSString * const)uuid;

@end
