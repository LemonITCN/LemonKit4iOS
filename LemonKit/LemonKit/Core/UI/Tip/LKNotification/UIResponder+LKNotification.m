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

@end
