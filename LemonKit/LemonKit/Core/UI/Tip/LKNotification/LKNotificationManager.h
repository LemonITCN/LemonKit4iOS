//
//  LKNotificationManager.h
//  LemonKit
//
//  Created by 1em0nsOft on 16/8/29.
//  Copyright © 2016年 1em0nsOft. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "LKNotificationBar.h"

/**
 *  @author 1em0nsOft LiuRi
 *  @date 2016-08-29 11:08:23
 *
 *  @brief LK通知管理器
 */
@interface LKNotificationManager : NSObject

/// @brief 通知栏对象堆栈
@property (atomic , strong) NSMutableArray<LKNotificationBar *> *barStack;
/// @brief 默认的通知栏主题
@property LKNotificationBarStyle default_style;
/// @brief 默认的通知栏透明度
@property CGFloat default_alpha;

- (LKNotificationBar *)createWithTitle: (NSString *)title content: (NSString *)content icon: (UIImage *)icon;

/**
 *  @author 1em0nsOft LiuRi
 *  @date 2016-08-29 11:08:35
 *
 *  @brief 单例方法，获取默认的通知管理器
 *
 *  @return 默认的通知管理器对象
 */
+ (LKNotificationManager *)defaultManager;

@end
