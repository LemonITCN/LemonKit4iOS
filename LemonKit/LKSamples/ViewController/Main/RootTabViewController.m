//
//  RootTabViewController.m
//  LemonKit
//
//  Created by Lemonsoft on 2017/1/7.
//  Copyright © 2017年 Lemonsoft. All rights reserved.
//

#import "RootTabViewController.h"

@interface RootTabViewController ()

@end

@implementation RootTabViewController

- (void)initView{
    NSArray<NSString *> *vcKeys = @[@"m_tabHomepage" , @"m_tabDemo" , @"m_tabService" , @"m_tabMy"];// 创建viewController的key数组，数组内存的是视图控制器的key
    self.lkTabBarController.tabBar.tintColor = [UIColor themeColor];
    for (NSString *item in vcKeys) {
        UIViewController *vc = LKInstanceFindViewControllerWithKey(item);
        [self.lkTabBarController addChildViewController: vc];
        vc.tabBarItem.image = LKImageNamed(item);// 设置选项卡图标
        vc.tabBarItem.title = LKLocalStr(item);// 设置标题
    }
}

@end
