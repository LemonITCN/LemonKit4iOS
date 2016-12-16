//
//  LKNotificationManager.m
//  LemonKit
//
//  Created by 1em0nsOft on 16/8/29.
//  Copyright © 2016年 1em0nsOft. All rights reserved.
//

#import "LKNotificationManager.h"

@implementation LKNotificationManager

+ (LKNotificationManager *)defaultManager{
    static LKNotificationManager *defaultManagerObj;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        defaultManagerObj = [[LKNotificationManager alloc] init];
    });
    return defaultManagerObj;
}

- (instancetype)init{
    if (self = [super init]) {
        self.default_style = LK_NOTIFICATION_BAR_STYLE_LIGHT;
        self.default_alpha = 0.95;
    }
    return self;
}

- (LKNotificationBar *)createWithTitle: (NSString *)title content: (NSString *)content icon: (UIImage *)icon{
    LKNotificationBar *notificationBar = [[LKNotificationBar alloc] initWithTitle: title content: content icon: icon style: self.default_style];
    [notificationBar setBarAlpha: self.default_alpha];
    return notificationBar;
}

- (LKNotificationBar *)createWithTitle: (NSString *)title content: (NSString *)content{
    LKNotificationBar *notificationBar = [[LKNotificationBar alloc] initWithTitle: title content: content icon: _default_icon style: self.default_style];
    [notificationBar setBarAlpha: self.default_alpha];
    return notificationBar;
}

@end
