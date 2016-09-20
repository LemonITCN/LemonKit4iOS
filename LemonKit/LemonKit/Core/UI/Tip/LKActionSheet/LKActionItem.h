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
@property UIView *contentView;
/// @brief 点击事件
@property LK_ACION_SHEET_ON_ITEM_TOUCH action;
/// @brief 控件的高度
@property CGFloat height;

- (instancetype)initWithTitle: (NSString *)title height: (CGFloat)height textColor: (UIColor *)textColor;

- (instancetype)initWithTitle: (NSString *)title height: (CGFloat)height textColor: (UIColor *)textColor onTouchEvent: (LK_ACION_SHEET_ON_ITEM_TOUCH)onTouchEvent;

- (instancetype)initWithTitle: (NSString *)title height: (CGFloat)height textColor: (UIColor *)textColor onTouchEvent: (SEL)onTouchEvent withObject: (NSObject *)obj;

- (instancetype)initWithTitle: (NSString *)title height: (CGFloat)height;

- (instancetype)initWithTitle: (NSString *)title textColor: (UIColor *)textColor;

- (instancetype)initWithTitle: (NSString *)title;

- (instancetype)initWithTitle: (NSString *)title onTouchBlock: (LK_ACION_SHEET_ON_ITEM_TOUCH)onTouchBlock;

- (instancetype)initWithCustomView: (UIView *)customView height: (CGFloat)height onTouchBlock: (LK_ACION_SHEET_ON_ITEM_TOUCH)onTouchBlock;

@end
