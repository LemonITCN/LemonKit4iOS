//
//  LKUINavigationTabBarController.h
//  LemonKit
//
//  Created by 1em0nsOft on 2016/11/29.
//  Copyright © 2016年 Lemonsoft. All rights reserved.
//

#import "LKUITabBarController.h"
#import "LKUINavigationController.h"

@interface LKUINavigationTabBarController : LKUINavigationController

/**
 导航栏控制器
 */
@property (nonatomic , readonly) LKUITabBarController *lkTabBarController;

@end
