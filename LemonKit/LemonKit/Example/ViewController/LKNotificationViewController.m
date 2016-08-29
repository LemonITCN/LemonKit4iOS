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
    [[[self getLKNotificationManager] createWithTitle: @"测试的LK刷新" content:@"这是一个LKNotificationBar,正在进行测试显示情况" icon: [UIImage imageNamed: @"icon.jpg"]] showWithAnimated: YES];
    LKLog(@"this is log%@" , @"111");
    
}

@end

