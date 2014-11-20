#import "BMAppSettingsUtil.h"
#import "BMMacro.h"


static NSString *const USER_DEFAULTS_MOBILE_ACCOUNT_KEY = @"bm_mobileAccount";

static NSString *const DEVICE_UUID_KEY = @"device_uuid";

static NSString *const PLIST_APP_STORE_OR_AD_HOC_BUILD = @"APP_STORE_OR_AD_HOC_BUILD";
static NSString *const PLIST_CURRENT_MIRROR_DOMAIN = @"CURRENT_MIRROR_DOMAIN";
static NSString *const PLIST_IN_REVIEW_CURRENT_MIRROR_DOMAIN = @"IN_REVIEW_CURRENT_MIRROR_DOMAIN";
static NSString *const PLIST_API_VERSION_KEY = @"API_VERSION";
static NSString *const PLIST_BUILD_VERSION_KEY = @"BUILD_VERSION";
static NSString *const PLIST_VKONTAKTE_APP_ID_KEY = @"VKONTAKTE_APP_ID";
static NSString *const PLIST_FACEBOOK_APP_ID_KEY = @"FACEBOOK_APP_ID";
static NSString *const PLIST_GOOGLE_PLUS_APP_ID_KEY = @"GOOGLE_PLUS_APP_ID";
static NSString *const PLIST_GOOGLE_PLUS_CLIENT_SECRET_KEY = @"GOOGLE_PLUS_CLIENT_SECRET";

static BOOL _inReview = NO;
static BOOL _superuser = NO;

static BMMobileAccountPresenter *_mobileAccountCache = nil;
static NSString *_uuidCache = nil;
static NSDictionary *_plistConfigCache = nil;

@implementation BMAppSettingsUtil

#pragma mark [LOGIC]

#pragma mark Private

+ (NSUserDefaults *)userDefaults {
    return [NSUserDefaults standardUserDefaults];
}

+ (NSString * const)plistStageDependentValue:(NSString * const)valueKey {
    BmAssertStringNotEmpty(valueKey);
    BmAssertNotNil(_plistConfigCache);

    NSString *valueKeyPrefix = [BMAppSettingsUtil isAppStoreOrAdHocBuild] ? @"PRODUCTION_" : @"DEVELOPMENT_";
    NSString *result = [_plistConfigCache objectForKey:[NSString stringWithFormat:@"%@%@", valueKeyPrefix, valueKey]];

    BmAssertStringNotEmpty(result);

    return result;
}

#pragma mark BMAppSettingsUtil

+ (void)loadPlistConfig {
    BmAssertYes(_plistConfigCache == nil);

    NSString *path = [[NSBundle mainBundle] pathForResource:@"BUMPMessagesConfig" ofType:@"plist"];
    _plistConfigCache = [[NSDictionary alloc] initWithContentsOfFile:path];
}

+ (BOOL const)isAppStoreOrAdHocBuild {
    BmAssertNotNil(_plistConfigCache);

    return [[_plistConfigCache objectForKey:PLIST_APP_STORE_OR_AD_HOC_BUILD] isEqualToString:@"YES"];
}

+ (NSString * const)apiVersion {
    BmAssertNotNil(_plistConfigCache);

    NSString *result = [_plistConfigCache objectForKey:PLIST_API_VERSION_KEY];

    BmAssertStringNotEmpty(result);

    return result;
}

+ (NSString * const)appVersion {
    NSString *bundleVersion = [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *) kCFBundleVersionKey];
    NSString *buildVersion = [_plistConfigCache objectForKey:PLIST_BUILD_VERSION_KEY];

    return [NSString stringWithFormat:@"%@ (%@)", bundleVersion, buildVersion];
}

+ (NSString * const)vkontakteAppId {
    BmAssertNotNil(_plistConfigCache);

    NSString *result = [_plistConfigCache objectForKey:PLIST_VKONTAKTE_APP_ID_KEY];

    BmAssertStringNotEmpty(result);

    return result;
}

+ (NSString * const)facebookAppId {
    BmAssertNotNil(_plistConfigCache);

    NSString *result = [_plistConfigCache objectForKey:PLIST_FACEBOOK_APP_ID_KEY];

    BmAssertStringNotEmpty(result);

    return result;
}

+ (NSString * const)googlePlusAppId {
    BmAssertNotNil(_plistConfigCache);

    NSString *result = [_plistConfigCache objectForKey:PLIST_GOOGLE_PLUS_APP_ID_KEY];

    BmAssertStringNotEmpty(result);

    return result;
}

+ (NSString * const)googlePlusClientSecret {
    BmAssertNotNil(_plistConfigCache);

    NSString *result = [_plistConfigCache objectForKey:PLIST_GOOGLE_PLUS_CLIENT_SECRET_KEY];

    BmAssertStringNotEmpty(result);

    return result;
}

+ (NSString * const)currentMirrorDomain {
    NSString *const valueKey = _inReview ? PLIST_IN_REVIEW_CURRENT_MIRROR_DOMAIN : PLIST_CURRENT_MIRROR_DOMAIN;

    return [BMAppSettingsUtil plistStageDependentValue:valueKey];
}

+ (BMMobileAccountPresenter * const)mobileAccount {
    NSDictionary *rawMobileAccount = [[BMAppSettingsUtil userDefaults] objectForKey:USER_DEFAULTS_MOBILE_ACCOUNT_KEY];

    if (rawMobileAccount == nil) {
        return nil;
    }

    if (_mobileAccountCache == nil) {
        _mobileAccountCache = [[BMMobileAccountPresenter alloc] initWithJson:rawMobileAccount];
    }

    return _mobileAccountCache;
}

+ (void)setMobileAccount:(BMMobileAccountPresenter * const)mobileAccount {
    BmAssertNotNil(mobileAccount);

    [[BMAppSettingsUtil userDefaults] setObject:[mobileAccount toJson] forKey:USER_DEFAULTS_MOBILE_ACCOUNT_KEY];

    BmAssertYes([[BMAppSettingsUtil userDefaults] synchronize]);

    _mobileAccountCache = nil;
}

+ (void)clearMobileAccount {
    [[BMAppSettingsUtil userDefaults] removeObjectForKey:USER_DEFAULTS_MOBILE_ACCOUNT_KEY];

    BmAssertYes([[BMAppSettingsUtil userDefaults] synchronize]);

    _mobileAccountCache = nil;
    _superuser = NO;
}

+ (void)setInReview:(BOOL)inReview {
    _inReview = inReview;
}

+ (BOOL)inReview {
    return _inReview;
}

+ (void)setSuperuser:(BOOL)superuser {
    _superuser = superuser;
}

+ (BOOL)superuser {
    return _superuser;
}

+ (NSString * const)uuid {
    if (_uuidCache == nil) {
        _uuidCache = [[BMAppSettingsUtil userDefaults] objectForKey:DEVICE_UUID_KEY];;
    }

    return _uuidCache;
}

+ (void)setUuid:(NSString * const)uuid {
    BmAssertNotNil(uuid);

    [[BMAppSettingsUtil userDefaults] setObject:uuid forKey:DEVICE_UUID_KEY];

    BmAssertYes([[BMAppSettingsUtil userDefaults] synchronize]);

    _uuidCache = nil;
}

@end
