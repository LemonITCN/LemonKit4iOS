//
//  UIResponder+LemonBubble.h
//  LemonKit
//
//  Created by 1em0nsOft on 16/8/30.
//  Copyright © 2016年 1em0nsOft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LemonBubbleView.h"

// 展示一个带对号的提示信息
#define LKRightBubble(title, time) [self showRightWithTitle: title autoCloseTime: time]
// 展示一个带错误X的提示信息
#define LKErrorBubble(title, time) [self showErrorWithTitle: title autoCloseTime: time]
// 展示一个圆形的无限循环的进度条
#define LKWaitBubble(title) [self showRoundProgressWithTitle: title]
// 隐藏现在显示的泡泡控件
#define LKHideBubble() [self hideBubble]
// 定时隐藏现在显示的泡泡控件
#define LKHideBubbleAfter(time) [self hideBubbleAfter: time]
// 显示指定泡泡信息规定的泡泡控件
#define LKShowBubbleInfo(info) [self showBubbleWithInfo: info]
// 显示置顶的泡泡信息规定的泡泡控件，并在指定的时间后关闭
#define LKShowBubbleInfoWithTime(info , duration) [self showBubbleWithInfo: info time: duration]

/**
 为了方便用户的使用，对UIResponder以及其所有子类进行扩展使用方法
 */
@interface UIResponder (LemonBubble)

/**
 获取默认的显示成功的泡泡信息对象，可以在此基础之上自定义

 @return 泡泡信息描述对象
 */
- (LemonBubbleInfo *)getDefaultRightBubbleInfo;

/**
 展示一个带对号的提示信息

 @param title         要提示的标题
 @param autoCloseTime 自动关闭的时间
 */
- (void)showRightWithTitle: (NSString *)title
             autoCloseTime: (CGFloat)autoCloseTime;

/**
 获取默认的显示加载中的泡泡信息对象，可以在此基础之上自定义

 @return 泡泡信息描述对象
 */
- (LemonBubbleInfo *)getDefaultRoundProgressBubbleInfo;

/**
 展示一个圆形的无限循环的进度条

 @param title 要提示的标题
 */
- (void)showRoundProgressWithTitle: (NSString *)title;

/**
 获取默认的显示错误的泡泡信息对象，可以在此基础之上自定义

 @return 泡泡信息描述对象
 */
- (LemonBubbleInfo *)getDefaultErrorBubbleInfo;

/**
 展示一个带错误X的提示信息

 @param title         提示信息的标题
 @param autoCloseTime 自动关闭的时间
 */
- (void)showErrorWithTitle: (NSString *)title
             autoCloseTime: (CGFloat)autoCloseTime;

/**
 隐藏现在显示的泡泡控件
 */
- (void)hideBubble;

/**
 定时隐藏现在显示的泡泡控件

 @param duration 等待的时间
 */
- (void)hideBubbleAfter: (CGFloat)duration;

/**
 显示指定泡泡信息规定的泡泡控件

 @param info 泡泡信息对象
 */
- (void)showBubbleWithInfo: (LemonBubbleInfo *)info;

/**
 显示置顶的泡泡信息规定的泡泡控件，并在指定的时间后关闭

 @param info 泡泡信息对象
 @param time 要关闭的延迟时间
 */
- (void)showBubbleWithInfo: (LemonBubbleInfo *)info time: (CGFloat)time;

@end
