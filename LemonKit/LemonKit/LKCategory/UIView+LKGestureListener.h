//
//  UIResponder+LKGestureListener.h
//  LemonKit
//
//  Created by 1em0nsOft on 2016/12/8.
//  Copyright © 2016年 Lemonsoft. All rights reserved.
//

#import <UIKit/UIKit.h>

/// @brief 自定义动画Block
typedef void(^ LK_UI_VIEW_GESTURE_BLOCK)(UIView *sender);

/**
 扩展控件的快速设置手势事件的类别
 */
@interface UIView (LKGestureListener)

/**
 控件的触摸事件
 */
@property (nonatomic , assign) LK_UI_VIEW_GESTURE_BLOCK onTap;

/**
 控件的长按事件
 */
@property (nonatomic , assign) LK_UI_VIEW_GESTURE_BLOCK onLongPress;

@end
