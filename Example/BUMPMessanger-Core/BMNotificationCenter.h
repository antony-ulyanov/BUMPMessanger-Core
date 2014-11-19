//
//  BMNotificationCenterDelegate.h
//  BUMPMessages
//
//  Created by Alexander Shchekoldin on 08.02.13.
//  Copyright (c) 2013 BUMP Interactive. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BMNotificationCenter <NSObject>

- (void)subscribeOnNotificationCenterEvents;

- (void)unsubscribeFromNotificationCenterEvents;

@end
