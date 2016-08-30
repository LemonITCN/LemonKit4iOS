//
//  UIResponder+LKNotification.h
//  LemonKit
//
//  Created by 1em0nsOft on 16/8/29.
//  Copyright © 2016年 1em0nsOft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LKNotificationManager.h"


/**
 *  @author 1em0nsOft LiuRi
 *  @date 2016-08-29 10:08:56
 *
 *  @brief LemonKit通知的快捷扩展
 */
@interface UIResponder (LKNotification)

/**
 *  @author 1em0nsOft LiuRi
 *  @date 2016-08-29 11:08:08
 *
 *  @brief 获取全局默认的LK通知中心管理器
 *
 *  @return 默认的通知中心管理器对象
 */
- (LKNotificationManager *)getLKNotificationManager;

/**
 *  @author 1em0nsOft LiuRi
 *  @date 2016-08-29 13:08:17
 *
 *  @brief 展示一个通知
 *
 *  @param title   消息的标题
 *  @param content 消息的内容
 *  @param icon    消息的图标
 *  @param autoCloseTime 自动关闭的时间
 *  @param delegate 导航栏的代理
 */
- (void)showLKNotificationWithTitle: (NSString *)title content: (NSString *)content icon:(UIImage *)icon style: (LKNotificationBarStyle)style autoCloseTime: (float)autoCloseTime delegate: (NSObject<LKNotificationDelegate> *)delegate;

/**
 *  @author 1em0nsOft LiuRi
 *  @date 2016-08-30 11:08:19
 *
 *  @brief 展示一个通知
 *
 *  @param title   消息的标题
 *  @param content 消息的内容
 *  @param icon    消息的图标
 */
- (void)showLKNotificationWithTitle: (NSString *)title content: (NSString *)content icon: (UIImage *)icon;

/**
 *  @author 1em0nsOft LiuRi
 *  @date 2016-08-30 11:08:56
 *
 *  @brief 展示一个通知
 *
 *  @param title   消息的标题
 *  @param content 消息的内容
 */
- (void)showLKNotificationWithTitle: (NSString *)title content: (NSString *)content;

/**
 *  @author 1em0nsOft LiuRi
 *  @date 2016-08-30 11:08:40
 *
 *  @brief 设置全局LK通知栏的默认图标
 *
 *  @param icon 默认的图标对象
 */
- (void)setLKNotificationDefaultIcon: (UIImage *)icon;

/**
 *  @author 1em0nsOft LiuRi
 *  @date 2016-08-30 11:08:03
 *
 *  @brief 设置全局LK通知栏的默认主题
 *
 *  @param style 主题风格
 */
- (void)setLKNotificationDefaultStyle: (LKNotificationBarStyle)style;

/**
 *  @author 1em0nsOft LiuRi
 *  @date 2016-08-30 11:08:29
 *
 *  @brief 设置全局LK通知栏的默认透明度
 *
 *  @param alpha 透明度数值
 */
- (void)setLKNotificationDefaultAlpha: (CGFloat)alpha;

@end
