//
//  UIResponder+LKBubble.h
//  LemonKit
//
//  Created by 1em0nsOft on 16/8/30.
//  Copyright © 2016年 1em0nsOft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LKBubbleView.h"

@interface UIResponder (LKBubble)

/**
 获取默认的显示成功的泡泡信息对象，可以在此基础之上自定义

 @return 泡泡信息描述对象
 */
- (LKBubbleInfo *)getDefaultRightBubbleInfo;

/**
 展示一个带对号的提示信息

 @param title         要提示的标题
 @param autoCloseTime 自动关闭的时间
 */
- (void)showRightWithTitle: (NSString *)title autoCloseTime: (CGFloat)autoCloseTime;

/**
 获取默认的显示加载中的泡泡信息对象，可以在此基础之上自定义

 @return 泡泡信息描述对象
 */
- (LKBubbleInfo *)getDefaultRoundProgressBubbleInfo;

/**
 展示一个圆形的无限循环的进度条

 @param title 要提示的标题
 */
- (void)showRoundProgressWithTitle: (NSString *)title;

/**
 获取默认的显示错误的泡泡信息对象，可以在此基础之上自定义

 @return 泡泡信息描述对象
 */
- (LKBubbleInfo *)getDefaultErrorBubbleInfo;

/**
 展示一个带错误X的提示信息

 @param title         提示信息的标题
 @param autoCloseTime 自动关闭的时间
 */
- (void)showErrorWithTitle: (NSString *)title autoCloseTime: (CGFloat)autoCloseTime;

/**
 隐藏现在显示的泡泡控件
 */
- (void)hideBubble;

@end
