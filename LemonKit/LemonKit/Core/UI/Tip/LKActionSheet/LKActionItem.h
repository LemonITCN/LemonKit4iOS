//
//  LKActionItem.h
//  LemonKit
//
//  Created by 1em0nsOft on 2016/9/20.
//  Copyright © 2016年 1em0nsOft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LKActionItem : NSObject

typedef void(^ LK_ACION_SHEET_ON_ITEM_TOUCH)(LKActionItem *);

/// @brief 内容控件
@property (nonatomic , strong) UIView *contentView;
/// @brief 点击事件
@property (assign) LK_ACION_SHEET_ON_ITEM_TOUCH action;
/// @brief 控件的高度
@property (assign) CGFloat height;


/**
 通过标题，高度，默认的标题颜色初始化事件行

 @param title     标题
 @param height    事件行的高度
 @param textColor 默认的事件行中的文本颜色

 @return 事件行的实例对象
 */
- (instancetype)initWithTitle: (NSString *)title height: (CGFloat)height textColor: (UIColor *)textColor;

/**
 通过标题，高度，默认文字颜色，以及事件行的点击事件初始化事件行

 @param title        标题
 @param height       事件行的高度
 @param textColor    默认的事件行中的文本颜色
 @param onTouchEvent 事件行的触摸相应事件

 @return 事件行的实例对象
 */
- (instancetype)initWithTitle: (NSString *)title height: (CGFloat)height textColor: (UIColor *)textColor onTouchEvent: (LK_ACION_SHEET_ON_ITEM_TOUCH)onTouchEvent;

/**
 通过标题，高度，默认的标题行颜色和selector初始化事件行

 @param title        标题
 @param height       事件行的高度
 @param textColor    默认的事件行的文本高度
 @param onTouchEvent 触摸事件的selector
 @param obj          selector作用于的对象

 @return 事件行的实例对象
 */
- (instancetype)initWithTitle: (NSString *)title height: (CGFloat)height textColor: (UIColor *)textColor onTouchEvent: (SEL)onTouchEvent withObject: (NSObject *)obj;

/**
 通过标题，高度初始化事件行

 @param title  标题
 @param height 事件行的高度

 @return 事件行的实例对象
 */
- (instancetype)initWithTitle: (NSString *)title height: (CGFloat)height;

/**
 通过标题，默认的标题行文字颜色初始化事件行

 @param title     标题
 @param textColor 事件行的默认文字颜色

 @return 事件行的实例对象
 */
- (instancetype)initWithTitle: (NSString *)title textColor: (UIColor *)textColor;

/**
 通过标题初始化事件行

 @param title 标题

 @return 事件行的实例对象
 */
- (instancetype)initWithTitle: (NSString *)title;

/**
 通过标题，事件行的默认标题颜色和触摸事件来初始化事件行对象

 @param title        标题
 @param textColor    默认的事件行的文字颜色
 @param onTouchBlock 触摸的回调函数

 @return 事件行的实例对象
 */
- (instancetype)initWithTitle: (NSString *)title textColor: (UIColor *)textColor onTouchBlock: (LK_ACION_SHEET_ON_ITEM_TOUCH)onTouchBlock;

/**
 通过标题，触摸时间来初始化事件行对象

 @param title        标题
 @param onTouchBlock 触摸的事件回调

 @return 事件行的实例对象
 */
- (instancetype)initWithTitle: (NSString *)title onTouchBlock: (LK_ACION_SHEET_ON_ITEM_TOUCH)onTouchBlock;

/**
 通过自定义的控件和事件行的高度来初始化事件行对象

 @param customView 自定义控件
 @param height     事件行的高度

 @return 事件行的实例对象
 */
- (instancetype)initWithCustomView: (UIView *)customView height: (CGFloat)height;

/**
 通过自定义的控件和行高以及点击回调来初始化事件行对象

 @param customView   自定义的控件
 @param height       默认的行高
 @param onTouchBlock 触摸的回调block

 @return 事件行的实例对象
 */
- (instancetype)initWithCustomView: (UIView *)customView height: (CGFloat)height onTouchBlock: (LK_ACION_SHEET_ON_ITEM_TOUCH)onTouchBlock;

@end
