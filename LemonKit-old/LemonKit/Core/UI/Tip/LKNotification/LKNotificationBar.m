//
//  LKNotificationBar.m
//  LemonKit
//
//  Created by 1em0nsOft on 16/8/29.
//  Copyright © 2016年 1em0nsOft. All rights reserved.
//

#import "LKNotificationBar.h"

@implementation LKNotificationBar{
    UIVisualEffectView *_containerEffectView;// 模糊背景
    UIImageView *_iconImageView;// 图标
    UILabel *_titleLabel;// 标题
    UILabel *_contentLabel;// 内容
    NSString *_id;// 通知栏的ID，用于存取通知栏的高度
    UIView *_bottomLine;// 底部的边框线控件
}

static UIWindow *_defaultWindow;// 默认的UIWindow，当通知的UIWindow使用完毕之后需要重新将原有的默认UIWindow设置makeKey

static UIWindow *_navigationWindow;// 通知栏的容器window
static NSMutableDictionary<NSString *, NSNumber *> *_navigationHeightDic;// 通知高度存储字典，用于设置window高度

- (instancetype)initWithTitle: (NSString *)title content: (NSString *)content icon: (UIImage *)icon style: (LKNotificationBarStyle)style{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _defaultWindow = [UIApplication sharedApplication].keyWindow;// 保存默认的UIWindow
    });
    if (self = [super initWithFrame: CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 100)]) {
        if (!_navigationWindow) {
            _navigationWindow = [[UIWindow alloc] init];
            _navigationWindow.windowLevel = UIWindowLevelStatusBar;// 覆盖状态栏
            _navigationWindow.backgroundColor = [UIColor clearColor];
            _navigationWindow.frame = CGRectMake(0, 0, self.frame.size.width,  0);// 初始无大小
            _navigationWindow.userInteractionEnabled = YES;
            
            _navigationHeightDic = [[NSMutableDictionary alloc] init];
        }
        CGFloat padding = 10;
        self->_id = [NSString stringWithFormat: @"%u" , arc4random()];
        self->_isShowing = NO;
        self->_autoCloseTime = 3;
        
        self.backgroundColor = [UIColor colorWithRed: 1 green:1 blue:1 alpha:0.6];
        UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle: (style == LK_NOTIFICATION_BAR_STYLE_LIGHT) ? UIBlurEffectStyleLight : UIBlurEffectStyleDark];
        _containerEffectView = [[UIVisualEffectView alloc] initWithEffect: blurEffect];
        
        UIColor *textColor = (style == LK_NOTIFICATION_BAR_STYLE_LIGHT) ? [UIColor blackColor] : [UIColor whiteColor];// 根据主题生成文本颜色
        self->_iconImageView = [[UIImageView alloc] initWithFrame: CGRectMake(padding, padding, 50, 50)];
        self->_iconImageView.layer.cornerRadius = 8;
        self->_iconImageView.clipsToBounds = YES;
        CGFloat titleX = self->_iconImageView.frame.origin.x + self->_iconImageView.frame.size.width + 10;
        self->_titleLabel = [[UILabel alloc] initWithFrame: CGRectMake(titleX, self->_iconImageView.frame.origin.y + 6, self.frame.size.width - titleX - padding, 14)];
        self->_titleLabel.font = [UIFont systemFontOfSize: 14];
        self->_titleLabel.text = title;
        self->_titleLabel.textColor = textColor;
        CGFloat contentY = self->_titleLabel.frame.origin.y + self->_titleLabel.frame.size.height + 12;
        self->_contentLabel = [[UILabel alloc] initWithFrame: CGRectMake(self->_titleLabel.frame.origin.x, contentY , self->_titleLabel.frame.size.width, 0)];
        self->_contentLabel.textColor = textColor;
        self->_contentLabel.font = [UIFont systemFontOfSize: 12];
        
        self->_contentLabel.lineBreakMode = NSLineBreakByCharWrapping;
        [self->_contentLabel setNumberOfLines: 0];
        
        self->_bottomLine = [[UIView alloc] initWithFrame: CGRectMake(0, 0, self.frame.size.width, 1)];
        self->_bottomLine.backgroundColor = [UIColor colorWithRed: 230 / 255.0 green:230 /255.0 blue: 230 /255.0 alpha:0.3];
        
        [self addSubview: self->_containerEffectView];
        [self addSubview: self->_iconImageView];
        [self addSubview: self->_titleLabel];
        [self addSubview: self->_contentLabel];
        [self addSubview: self->_bottomLine];
        [self startAction];// 初始化事件
        
        [self setTitle: title];
        [self setContent: content];
        [self setIcon: icon];
    }
    return self;
}

- (void)startAction{
    [self addGestureRecognizer: [[UITapGestureRecognizer alloc] initWithTarget: self action: @selector(selfTap)]];
}

- (void)selfTap{
    [self.delegate onNavigationBarTouchUpInside: self];// 调用代理函数
    [self hideWithAnimated: YES];
}

- (void)setBarAlpha: (CGFloat)alpha{
    self->_containerEffectView.alpha = alpha;
}

- (void)setTitle:(NSString *)title{
    self->_title = title;
    self->_titleLabel.text = title;
}

- (void)setContent:(NSString *)content{
    self->_content = content;
    self->_contentLabel.text = content;
    [self->_contentLabel sizeToFit];
    self.frame = CGRectMake(0, 0, self.frame.size.width, self->_contentLabel.frame.origin.y + self->_contentLabel.frame.size.height + 15);// 根据内容大小计算整体通知栏高度
    self->_bottomLine.frame = CGRectMake(0, self.frame.size.height - 1, self.frame.size.width, 1);
}

- (void)setIcon:(UIImage *)icon{
    self->_iconImageView.image = icon;
}

- (void)showWithAnimated:(BOOL)animated{
    if (!self->_isShowing) {
        [_navigationWindow makeKeyAndVisible];// 把navigation用的window设置为keyWindow
    }
    self->_isShowing = YES;
    _navigationWindow.frame = self.bounds;// 设置通知栏window的大小
    [_navigationHeightDic setObject: [NSNumber numberWithFloat: self.frame.size.height] forKey: self->_id];
    [_navigationWindow addSubview: self];// 加到通知栏window中
    self->_containerEffectView.frame = self.bounds;// 设置模糊控件的大小
    self.frame = CGRectMake(0, - self.frame.size.height, self.frame.size.width, self.frame.size.height);
    [UIView animateWithDuration: 0.6 delay: 0 options: UIViewAnimationOptionCurveEaseInOut animations:^{
        self.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    } completion:^(BOOL finished) {
        _navigationWindow.frame = self.bounds;// 设置通知栏window的大小
        [self performSelector: @selector(_hide) withObject: self afterDelay: self->_autoCloseTime];
    }];
}

// 定时器触发
- (void)_hide{
    [self hideWithAnimated: YES];
}

- (void)hideWithAnimated:(BOOL)animated{
    [_navigationHeightDic removeObjectForKey: self->_id];
    if (_navigationHeightDic.count == 0) {
        _navigationWindow.frame = CGRectMake(0, 0, self.frame.size.width, 0);
    }
    else{
        CGFloat minHeight = [UIScreen mainScreen].bounds.size.height;
        for (NSNumber *height in _navigationHeightDic.allValues) {
            if ([height floatValue] < minHeight) {
                minHeight = [height floatValue];
            }
        }
        _navigationWindow.frame = CGRectMake(0, 0, self.frame.size.width, minHeight);
    }
    [UIView animateWithDuration: 0.6 delay: 0 options: UIViewAnimationOptionCurveEaseInOut animations:^{
        self.frame = CGRectMake(0, - self.frame.size.height, self.frame.size.width, self.frame.size.height);
    } completion:^(BOOL finished) {
        self->_isShowing = NO;
        [self removeFromSuperview];
        if (!self->_isShowing){
            [_defaultWindow makeKeyWindow];// 重新恢复默认的UIWindow为keyWindow
        }
    }];
}

@end
