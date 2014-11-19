typedef NS_ENUM(NSInteger, BMSocialNetworkType)
{
    BMSocialNetworkTypeVKontakte,
    BMSocialNetworkTypeFacebook,
    BMSocialNetworkTypeTwitter,
    BMSocialNetworkTypeGooglePlus
};

static NSString * socialNetworkTypeToString(BMSocialNetworkType type) {
    switch(type) {
        case BMSocialNetworkTypeVKontakte:
            return @"VKONTAKTE";
        case BMSocialNetworkTypeFacebook:
            return @"FACEBOOK";
        case BMSocialNetworkTypeTwitter:
            return @"TWITTER";
        case BMSocialNetworkTypeGooglePlus:
            return @"GOOGLE";
        default:
            [NSException raise:NSGenericException format:@"Unexpected social network type."];
    }
}
