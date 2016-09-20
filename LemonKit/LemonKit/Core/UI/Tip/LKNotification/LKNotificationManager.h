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

/// @brief 默认的通知栏主题
@property LKNotificationBarStyle default_style;
/// @brief 默认的通知栏透明度
@property CGFloat default_alpha;
/// @brief 默认的图标
@property UIImage *default_icon;

/**
 *  @author 1em0nsOft LiuRi
 *  @date 2016-08-30 11:08:49
 *
 *  @brief 创建一个通知栏
 *
 *  @param title   通知标题
 *  @param content 通知内容
 *  @param icon    通知图标
 *
 *  @return 通知栏对象
 */
- (LKNotificationBar *)createWithTitle: (NSString *)title content: (NSString *)content icon: (UIImage *)icon;

/**
 *  @author 1em0nsOft LiuRi
 *  @date 2016-08-30 11:08:53
 *
 *  @brief 创建一个默认图标的通知栏
 *
 *  @param title   通知标题
 *  @param content 通知内容
 *
 *  @return 通知栏对象
 */
- (LKNotificationBar *)createWithTitle: (NSString *)title content: (NSString *)content;

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
