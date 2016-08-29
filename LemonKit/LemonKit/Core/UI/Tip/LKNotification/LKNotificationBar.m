//
//  LKNotificationBar.m
//  LemonKit
//
//  Created by 1em0nsOft on 16/8/29.
//  Copyright © 2016年 1em0nsOft. All rights reserved.
//

#import "LKNotificationBar.h"

@implementation LKNotificationBar{
    UIVisualEffectView *_containerEffectView;
    UIImageView *_iconImageView;
    UILabel *_titleLabel;
    UILabel *_contentLabel;
}

static UIWindow *_navigationWindow;

- (instancetype)initWithTitle: (NSString *)title content: (NSString *)content icon: (UIImage *)icon style: (LKNotificationBarStyle)style{
    if (self = [super initWithFrame: CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 100)]) {
        if (!_navigationWindow) {
            _navigationWindow = [[UIWindow alloc] init];
            _navigationWindow.windowLevel = UIWindowLevelStatusBar;
            _navigationWindow.backgroundColor = [UIColor clearColor];
            [_navigationWindow makeKeyAndVisible];
        }
        CGFloat padding = 10;
        self->_isShowing = NO;
        self->_actionTitleArray = [[NSMutableArray alloc] init];
        
        UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle: (style == LK_NOTIFICATION_BAR_STYLE_LIGHT) ? UIBlurEffectStyleLight : UIBlurEffectStyleDark];
        _containerEffectView = [[UIVisualEffectView alloc] initWithEffect: blurEffect];
        
        UIColor *textColor = (style == LK_NOTIFICATION_BAR_STYLE_LIGHT) ? [UIColor blackColor] : [UIColor whiteColor];
        self->_iconImageView = [[UIImageView alloc] initWithFrame: CGRectMake(padding, padding, 50, 50)];
        self->_iconImageView.image = icon;
        self->_iconImageView.layer.cornerRadius = 8;
        self->_iconImageView.clipsToBounds = YES;
        CGFloat titleX = self->_iconImageView.frame.origin.x + self->_iconImageView.frame.size.width + 10;
        self->_titleLabel = [[UILabel alloc] initWithFrame: CGRectMake(titleX, self->_iconImageView.frame.origin.y, self.frame.size.width - titleX - padding, 14)];
        self->_titleLabel.text = title;
        self->_titleLabel.textColor = textColor;
        CGFloat contentY = self->_titleLabel.frame.origin.y + self->_titleLabel.frame.size.height + 10;
        self->_contentLabel = [[UILabel alloc] initWithFrame: CGRectMake(self->_titleLabel.frame.origin.x, contentY , self->_titleLabel.frame.size.width, 0)];
        self->_contentLabel.text = content;
        self->_contentLabel.lineBreakMode = NSLineBreakByCharWrapping;
        [self->_contentLabel setNumberOfLines: 0];
        [self->_contentLabel sizeToFit];
        
        [self addSubview: self->_containerEffectView];
        self->_containerEffectView.backgroundColor = [UIColor redColor];
        [self addSubview: self->_iconImageView];
        [self addSubview: self->_titleLabel];
        [self addSubview: self->_contentLabel];
    }
    return self;
}

- (void)setBarAlpha: (CGFloat)alpha{
    self->_containerEffectView.alpha = alpha;
}

- (void)showWithAnimated:(BOOL)animated{
    self->_containerEffectView.frame = self.bounds;
    self.frame = CGRectMake(0, - self.frame.size.height, self.frame.size.width, self.frame.size.height);
    [_navigationWindow addSubview: self];
    [UIView animateWithDuration: 0.8 animations:^{
        self.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    } completion:^(BOOL finished) {
        
    }];
}

- (void)hideWithAnimated:(BOOL)animated{
    
}

@end
