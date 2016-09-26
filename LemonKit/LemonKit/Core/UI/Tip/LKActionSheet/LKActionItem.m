//
//  LKActionItem.m
//  LemonKit
//
//  Created by 1em0nsOft on 2016/9/20.
//  Copyright © 2016年 1em0nsOft. All rights reserved.
//

#import "LKActionItem.h"

#define DEFAULT_HEIGHT 50

@implementation LKActionItem

- (instancetype)initWithTitle: (NSString *)title height: (CGFloat)height textColor: (UIColor *)textColor{
    if (self = [super init]) {
        UILabel *titleView = [[UILabel alloc] initWithFrame: CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, height)];
        titleView.text = title;
        titleView.textColor = textColor;
        titleView.textAlignment = NSTextAlignmentCenter;
        UIView *line = [[UIView alloc] initWithFrame: CGRectMake(0, height, [UIScreen mainScreen].bounds.size.width, 0.5)];
        line.backgroundColor = [UIColor colorWithRed: 0.85 green:0.85 blue:0.85 alpha:1];
        [titleView addSubview: line];
        self.contentView = titleView;
        self.height = height;
    }
    return self;
}

- (instancetype)initWithTitle: (NSString *)title height: (CGFloat)height textColor: (UIColor *)textColor onTouchEvent: (LK_ACION_SHEET_ON_ITEM_TOUCH)onTouchEvent{
    if ([self initWithTitle: title height:height textColor: textColor]) {
        self.action = onTouchEvent;
    }
    return self;
}

- (instancetype)initWithTitle: (NSString *)title height: (CGFloat)height textColor: (UIColor *)textColor onTouchEvent: (SEL)onTouchEvent withObject: (NSObject *)obj{
    if ([self initWithTitle: title height:height textColor: textColor]) {
        self.action = ^(LKActionItem *item){
            [obj performSelector: onTouchEvent withObject: obj];
        };
    }
    return self;
}

- (instancetype)initWithTitle: (NSString *)title height: (CGFloat)height{
    return [self initWithTitle: title  height:height textColor: [UIColor blackColor]];
}

- (instancetype)initWithTitle: (NSString *)title textColor: (UIColor *)textColor{
    return [self initWithTitle: title height: DEFAULT_HEIGHT textColor: textColor];
}

- (instancetype)initWithTitle: (NSString *)title{
    return [self initWithTitle: title height: DEFAULT_HEIGHT];
}

- (instancetype)initWithTitle: (NSString *)title textColor: (UIColor *)textColor onTouchBlock: (LK_ACION_SHEET_ON_ITEM_TOUCH)onTouchBlock{
    return [self initWithTitle: title height: DEFAULT_HEIGHT textColor: textColor onTouchEvent: onTouchBlock];
}

- (instancetype)initWithTitle: (NSString *)title onTouchBlock: (LK_ACION_SHEET_ON_ITEM_TOUCH)onTouchBlock{
    return [self initWithTitle: title height: DEFAULT_HEIGHT textColor: [UIColor blackColor] onTouchEvent: onTouchBlock];
}

- (instancetype)initWithCustomView: (UIView *)customView height: (CGFloat)height{
    if (self = [super init]) {
        self.contentView = customView;
        self.height = height;
    }
    return self;
}

- (instancetype)initWithCustomView: (UIView *)customView height: (CGFloat)height onTouchBlock: (LK_ACION_SHEET_ON_ITEM_TOUCH)onTouchBlock{
    if (self = [super init]) {
        self.contentView = customView;
        self.height = height;
        self.action = onTouchBlock;
    }
    return self;
}

@end
