//
//  LKActionSheetView.m
//  LemonKit
//
//  Created by 1em0nsOft on 2016/9/20.
//  Copyright © 2016年 1em0nsOft. All rights reserved.
//

#import "LKActionSheetView.h"
#define LKScreen [UIScreen mainScreen].bounds.size
#define HEAD_VIEW_HEIGHT 40

@implementation LKActionSheetView{
    NSMutableArray<NSMutableArray<LKActionItem *> *> *actionItems;
    UIView *_maskView;
    UIView *_contentView;
    UIScrollView *_bodyView;
    UIWindow *_mainWindow;
}

static UIWindow *_defaultActionSheetWindow;

- (instancetype)init{
    if (self = [super init]) {
        if (!_defaultActionSheetWindow) {
            _defaultActionSheetWindow = [[UIWindow alloc] initWithFrame: CGRectMake(0, 0, LKScreen.width, 0)];
            _defaultActionSheetWindow.clipsToBounds = YES;
        }
        self.maxHeightInScreen = 1;
        [self clear];
        self.groupHeightSpace = 7;
        self.backViewControllerScale = 0.8;// 默认的后边viewController的缩放比例为0.8
        
        self->_maskView = [[UIView alloc] initWithFrame: CGRectMake(0, 0, LKScreen.width, LKScreen.height)];
        self->_maskView.backgroundColor = [UIColor colorWithRed: 0  green: 0  blue: 0  alpha: 0.4];
        self->_maskView.alpha = 0;
        [self->_maskView addGestureRecognizer: [[UITapGestureRecognizer alloc] initWithTarget: self  action: @selector(hide)]];
        self->_contentView = [[UIView alloc] init];
        self->_contentView.backgroundColor = [UIColor colorWithRed: 0.9 green:0.9 blue:0.9 alpha:1];
        
        self->_headView = [[UILabel alloc] init];
        self->_headView.layer.borderColor = [UIColor colorWithRed:0.84 green:0.84 blue:0.84 alpha:1].CGColor;
        self->_headView.backgroundColor = [UIColor colorWithRed: 0.95 green:0.95 blue:0.95 alpha:1];
        self->_headView.font = [UIFont systemFontOfSize: 13];
        self->_headView.textAlignment = NSTextAlignmentCenter;
        self->_headView.layer.borderWidth = 1;
        self->_bodyView = [[UIScrollView alloc] init];
        
        [_defaultActionSheetWindow addSubview: self->_maskView];
        [_defaultActionSheetWindow addSubview: self->_contentView];
        
        [self->_contentView addSubview: self->_bodyView];
        [self->_contentView addSubview: self->_headView];
    }
    return self;
}

static BOOL isShowing = NO;
static LKActionSheetView *defaultActionSheetView;

/// @brief 单例方法
+ (LKActionSheetView *)defaultActionSheetView{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        defaultActionSheetView = [[LKActionSheetView alloc] init];
    });
    return defaultActionSheetView;
}

- (void)show{
    if (!isShowing && self->actionItems.count > 0) {
        // 当前还没有显示出来
        isShowing = YES;
        _mainWindow = [UIApplication sharedApplication].keyWindow;
        _defaultActionSheetWindow.frame = CGRectMake(0, 0, LKScreen.width, LKScreen.height);
        _contentView.frame = CGRectMake(0, LKScreen.height, LKScreen.width, [self calViewHeight]);
        [self initHeadView];
        [self initBodyView];
        [UIView animateWithDuration: 0.5 delay: 0 options: UIViewAnimationOptionCurveEaseInOut animations:^{
            [UIApplication sharedApplication].keyWindow.transform = CGAffineTransformMakeScale(self.backViewControllerScale, self.backViewControllerScale);
            [_defaultActionSheetWindow makeKeyAndVisible];
            self->_maskView.alpha = 1;
            self->_contentView.frame = CGRectMake(0, LKScreen.height - [self calViewHeight] - self.headViewHeight, LKScreen.width, [self calViewHeight]);
        } completion:^(BOOL finished) {
            
        }];
    }
}

- (void)hide{
    if (isShowing) {
        // 已经显示了
        [UIView animateWithDuration: 0.5 delay: 0 options: UIViewAnimationOptionCurveEaseInOut animations:^{
            self->_maskView.alpha = 0;
            self->_mainWindow.transform = CGAffineTransformMakeScale(1, 1);
            self->_contentView.frame = CGRectMake(0, LKScreen.height, LKScreen.width, [self calViewHeight]);
        } completion:^(BOOL finished) {
            _defaultActionSheetWindow.frame = CGRectMake(0, 0, LKScreen.width, 0);
            isShowing = NO;
            [self->_mainWindow makeKeyAndVisible];
        }];
    }
}

- (void)addActionGroup{
    [self->actionItems addObject: [[NSMutableArray alloc] init]];
}

- (void)removeActionGroupAtIndex: (NSInteger)index{
    if (index >= 0 && index < self->actionItems.count){
        [self->actionItems removeObjectAtIndex: index];
    }
}

- (void)clear{
    self->actionItems = [[NSMutableArray alloc] init];
    [self->actionItems addObject: [[NSMutableArray alloc] init]];
}

- (void)addAction: (LKActionItem *)action groupIndex: (NSInteger)index{
    [self->actionItems[index] addObject: action];
}

- (void)insertAction: (LKActionItem *)action groupIndex: (NSInteger)index location: (NSInteger)location{
    [self->actionItems[index] insertObject: action atIndex: location < self->actionItems[index].count ? location : self->actionItems[index].count];
}

- (void)removeActionAtIndex: (NSInteger)index location: (NSInteger)location{
    if (index < self->actionItems.count && location < self->actionItems[index].count) {
        [self->actionItems[index] removeObjectAtIndex: location];
    }
}

- (void)setTitle:(NSString *)title{
    self->_title = title;
    self->_headView.text = title;
}

- (CGFloat)calContentHeight{
    CGFloat height = self->_groupHeightSpace * (self->actionItems.count - 1);
    for (NSMutableArray<LKActionItem *> *group in self->actionItems) {
        for (LKActionItem *item in group) {
            height += item.height;
        }
    }
    return height;
}

- (CGFloat)calViewHeight{
    CGFloat contentHeight = [self calContentHeight];
    CGFloat maxHeight = self.maxHeightInScreen * LKScreen.height;
    return contentHeight > maxHeight ? maxHeight : contentHeight;
}

- (void)initHeadView{
    self->_headView.frame = CGRectMake(-1, -1, LKScreen.width + 2, self.headViewHeight);
}

- (void)initBodyView{
    self->_bodyView.frame = CGRectMake(0, self->_headView.frame.size.height, LKScreen.width, [self calViewHeight]);
    CGFloat pointer = [self calContentHeight];
    self->_bodyView.contentSize = CGSizeMake(0, pointer);
    for (UIView *view in [self->_bodyView subviews]) {
        [view removeFromSuperview];
    }
    for (NSMutableArray<LKActionItem *> *group in self->actionItems) {
        for (LKActionItem *item in group) {
            pointer -= item.height;
            LKActionLineView *lineView= [[LKActionLineView alloc] initWithFrame: CGRectMake(0, pointer, LKScreen.width, item.height) actionItem: item];
            lineView.backgroundColor = [UIColor colorWithRed: 0.93 green:0.93 blue:0.93 alpha:1];
            [lineView addSubview: item.contentView];
            [self->_bodyView addSubview:lineView];
        }
        pointer -= self->_groupHeightSpace;
    }
}

@end
