//
//  LKUINavigationTabBarController.m
//  LemonKit
//
//  Created by 1em0nsOft on 2016/11/29.
//  Copyright © 2016年 Lemonsoft. All rights reserved.
//

#import "LKUINavigationTabBarController.h"

@interface LKUINavigationTabBarController ()

@end

@implementation LKUINavigationTabBarController

- (instancetype)init{
    self->_lkTabBarController = [[LKUITabBarController alloc] init];
    if (self = [super initWithRootViewController: self->_lkTabBarController]) {
        self.navigationBarHidden = YES;
    }
    return self;
}

@end
