//
//  LKNotificationViewController.m
//  LemonKit
//
//  Created by 1em0nsOft on 16/8/29.
//  Copyright © 2016年 1em0nsOft. All rights reserved.
//

#import "LKNotificationViewController.h"


@implementation LKNotificationViewController

- (IBAction)showBasicNotification:(UIButton *)sender {
    [self getLKNotificationManager].default_style = LK_NOTIFICATION_BAR_STYLE_DARK;
    LKNotificationBar *notificationBar = [[self getLKNotificationManager] createWithTitle: @"这是一个LKNotification" content:@"看这里，这是一个LK Notification Bar，在这里显示的是要提示的正文内容。" icon: [UIImage imageNamed: @"icon"]];
    notificationBar.delegate = self;
    [notificationBar showWithAnimated: YES];
//    [self setLKNotificationDefaultIcon: [UIImage imageNamed: @"icon"]];
//    [self showLKNotificationWithTitle: @"这是一个LKNotification" content:@"看这里，这是一个LK Notification Bar，在这里显示的是要提示的正文内容"];
}

- (void)onNavigationBarTouchUpInside:(LKNotificationBar *)navigationBar{
    NSLog(@"TOUCH !@");
    [navigationBar hideWithAnimated: YES];
}

@end

