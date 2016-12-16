//
//  UIResponder+LKGestureListener.m
//  LemonKit
//
//  Created by 1em0nsOft on 2016/12/8.
//  Copyright © 2016年 Lemonsoft. All rights reserved.
//

#import "UIView+LKGestureListener.h"
#import <objc/runtime.h>

static const void *OnTapKey = &OnTapKey;
static const void *OnLongPressKey = &OnLongPressKey;

@implementation UIView (LKGestureListener)

@dynamic onTap;
@dynamic onLongPress;

// 触摸手势对象
static UITapGestureRecognizer *_lk_view_tap_gesture;
static UILongPressGestureRecognizer *_lk_view_long_press_gesture;

- (LK_UI_VIEW_GESTURE_BLOCK)onTap{
    return objc_getAssociatedObject(self, OnTapKey);
}

- (void)setOnTap:(LK_UI_VIEW_GESTURE_BLOCK)onTap{
    [self removeGestureRecognizer: _lk_view_tap_gesture];// 移除上次的手势
    self.userInteractionEnabled = YES;
    _lk_view_tap_gesture = [[UITapGestureRecognizer alloc] initWithTarget: self action: @selector(_lk_view_on_tap)];// 创建新的手势
    [self addGestureRecognizer: _lk_view_tap_gesture];// 绑定手势
    objc_setAssociatedObject(self, OnTapKey, onTap, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (LK_UI_VIEW_GESTURE_BLOCK)onLongTouch{
    return objc_getAssociatedObject(self, OnLongPressKey);
}

- (void)setOnLongPress:(LK_UI_VIEW_GESTURE_BLOCK)onLongPress{
    [self removeGestureRecognizer: _lk_view_long_press_gesture];// 移除上次的长按手势
    self.userInteractionEnabled = YES;
    _lk_view_long_press_gesture = [[UILongPressGestureRecognizer alloc] initWithTarget: self action: @selector(_lk_view_on_long_press)];// 创建新的长按手势
    [self addGestureRecognizer: _lk_view_long_press_gesture];
    objc_setAssociatedObject(self, OnLongPressKey, onLongPress, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)_lk_view_on_tap{
    self.onTap(self);
}

- (void)_lk_view_on_long_press{
    self.onLongTouch(self);
}

@end
