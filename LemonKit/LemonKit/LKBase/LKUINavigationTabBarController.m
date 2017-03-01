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

- (void)viewDidLoad{
    // storyboard的时候不掉用init方法，所以需要后挂载
    if (!self->_lkTabBarController) {
        self->_lkTabBarController = [[LKUITabBarController alloc] init];
        self.navigationBarHidden = YES;
        [self addChildViewController: self->_lkTabBarController];
    }
    [super viewDidLoad];
}

@end
