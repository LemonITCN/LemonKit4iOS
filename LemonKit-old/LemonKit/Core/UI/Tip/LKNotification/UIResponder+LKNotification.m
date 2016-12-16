//
//  UIResponder+LKNotification.m
//  LemonKit
//
//  Created by 1em0nsOft on 16/8/29.
//  Copyright © 2016年 1em0nsOft. All rights reserved.
//

#import "UIResponder+LKNotification.h"

@implementation UIResponder (LKNotification)

- (LKNotificationManager *)getLKNotificationManager{
    return [LKNotificationManager defaultManager];
}

- (void)showLKNotificationWithTitle: (NSString *)title content: (NSString *)content icon:(UIImage *)icon  style: (LKNotificationBarStyle)style autoCloseTime: (float)autoCloseTime delegate: (NSObject<LKNotificationDelegate> *)delegate{
    LKNotificationBar *notificationBar = [[self getLKNotificationManager] createWithTitle: title content: content icon: icon];
    notificationBar.delegate = delegate;
    [notificationBar setAutoCloseTime: autoCloseTime];
    [notificationBar showWithAnimated: YES];
}

- (void)showLKNotificationWithTitle: (NSString *)title content: (NSString *)content icon: (UIImage *)icon{
    LKNotificationBar *notificationBar = [[self getLKNotificationManager] createWithTitle: title content: content icon: icon];
    [notificationBar showWithAnimated: YES];
}

- (void)showLKNotificationWithTitle: (NSString *)title content: (NSString *)content{
    LKNotificationBar *notificationBar = [[self getLKNotificationManager] createWithTitle: title content: content];
    [notificationBar showWithAnimated: YES];
}

- (void)setLKNotificationDefaultIcon:(UIImage *)icon{
    [self getLKNotificationManager].default_icon = icon;
}

- (void)setLKNotificationDefaultStyle:(LKNotificationBarStyle)style{
    [self getLKNotificationManager].default_style = style;
}

- (void)setLKNotificationDefaultAlpha:(CGFloat)alpha{
    [self getLKNotificationManager].default_alpha = alpha;
}

@end
