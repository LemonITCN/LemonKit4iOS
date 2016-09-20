//
//  LKNotificationBar.h
//  LemonKit
//
//  Created by 1em0nsOft on 16/8/29.
//  Copyright © 2016年 1em0nsOft. All rights reserved.
//

#import <UIKit/UIKit.h>

/// @brief 通知栏的主题枚举
typedef enum{
    /// @brief 亮主题
    LK_NOTIFICATION_BAR_STYLE_LIGHT = 0,
    /// @brief 暗主题
    LK_NOTIFICATION_BAR_STYLE_DARK
} LKNotificationBarStyle;

@class LKNotificationBar;

@protocol LKNotificationDelegate <NSObject>

/**
 *  @author 1em0nsOft LiuRi
 *  @date 2016-08-30 10:08:25
 *
 *  @brief 导航栏被触摸相应事件
 *
 *  @param navigationBar 当前导航栏对象
 */
- (void)onNavigationBarTouchUpInside: (LKNotificationBar *)navigationBar;

@end

/**
 *  @author 1em0nsOft LiuRi
 *  @date 2016-08-29 10:08:07
 *
 *  @brief 通知控件，通常该View不需要手动实例化
 */
@interface LKNotificationBar : UIControl

/// @brief 当前的通知栏是否处于显示状态
@property(readonly) BOOL isShowing;
/// @brief 代理函数
@property NSObject<LKNotificationDelegate> *delegate;
/// @brief 通知栏的标题
@property(nonatomic) NSString *title;
/// @brief 通知栏的内容
@property(nonatomic) NSString *content;
/// @brief 通知栏的图标
@property(nonatomic) UIImage *icon;
/// @brief 自动关闭的时间
@property float autoCloseTime;

/**
 *  @author 1em0nsOft LiuRi
 *  @date 2016-08-29 13:08:18
 *
 *  @brief 通过传入通知栏的基本信息来构建一个通知栏
 *
 *  @param title   通知栏的标题
 *  @param content 通知栏的内容
 *  @param icon    通知栏的图标
 *  @param style   通知栏的主题，分为亮、暗两种
 *
 *  @return 通知栏的实例对象
 */
- (instancetype)initWithTitle: (NSString *)title content: (NSString *)content icon: (UIImage *)icon style: (LKNotificationBarStyle)style;

/**
 *  @author 1em0nsOft LiuRi
 *  @date 2016-08-29 14:08:37
 *
 *  @brief 设置导航栏的模糊透明度
 *
 *  @param alpha 透明度数值
 */
- (void)setBarAlpha: (CGFloat)alpha;

/**
 *  @author 1em0nsOft LiuRi
 *  @date 2016-08-29 13:08:54
 *
 *  @brief 显示通知栏
 *
 *  @param animated 是否动画显示
 */
- (void)showWithAnimated: (BOOL)animated;

/**
 *  @author 1em0nsOft LiuRi
 *  @date 2016-08-29 13:08:27
 *
 *  @brief 隐藏通知栏
 *
 *  @param animated 是否动画隐藏
 */
- (void)hideWithAnimated: (BOOL)animated;

@end
