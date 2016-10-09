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
 展示一个带对号的提示信息

 @param title         要提示的标题
 @param autoCloseTime 自动关闭的时间
 */
- (void)showRightWithTitle: (NSString *)title autoCloseTime: (CGFloat)autoCloseTime;

/**
 展示一个圆形的无限循环的进度条

 @param title 要提示的标题
 */
- (void)showRoundProgressWithTitle: (NSString *)title;

/**
 展示一个带错误X的提示信息

 @param title         提示信息的标题
 @param autoCloseTime 自动关闭的时间
 */
- (void)showErrorWithTitle: (NSString *)title autoCloseTime: (CGFloat)autoCloseTime;

@end
