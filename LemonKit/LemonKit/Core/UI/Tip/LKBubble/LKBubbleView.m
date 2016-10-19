//
//  LKBubbleView.m
//  LemonKit
//
//  Created by 1em0nsOft on 16/8/30.
//  Copyright © 2016年 1em0nsOft. All rights reserved.
//

#import "LKBubbleView.h"

#define bubble_width 180 // 泡泡控件的宽度
#define bubble_height 120// 泡泡控件的高度
#define bubble_icon_width 60 // 泡泡控件中的图标边长
#define bubble_padding 17 // 泡泡控件的顶部内边距，即图标距离顶部的长度
#define bubble_icon_title_space 0 // 泡泡控件中图标和标题的空隙

@implementation LKBubbleView{
    UIImageView *_iconImageView;
    UILabel *_titleLabel;
    BOOL _isShowing;// 是否正在显示中
    NSMutableDictionary<NSString * , LKBubbleInfo *> *_infoDic;
    /// @brief 当前正在显示的泡泡信息对象
    LKBubbleInfo *_currentInfo;
    /// @brief 当前自定义动画绘图的图层
    CAShapeLayer *_currentDrawLayer;
    /// @brief 当前使用的图片帧动画计时器
    NSTimer *_currentTimer;
    /// @brief 蒙版view
    UIView *_maskView;
    
    CGFloat closeKey;// 关闭验证key，用来做关闭时候的延迟验证，当设置自动关闭之后，若在关闭之前出发了显示其他info的bubble，通过修改这个值保证不关闭其他样式的infoBubble
    NSInteger frameAnimationPlayIndex;// 帧动画播放的下标索引
}

static LKBubbleView *defaultBubbleView;

+ (LKBubbleView *)defaultBubbleView{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        defaultBubbleView = [[LKBubbleView alloc] init];
    });
    return defaultBubbleView;
}

- (instancetype)init{
    if (self = [super init]) {
        UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
        self.frame = CGRectMake(keyWindow.center.x, keyWindow.center.y, 0, 0);
        self->_infoDic = [[NSMutableDictionary alloc] init];
        
        self.clipsToBounds = YES;
        self->_iconImageView = [[UIImageView alloc] init];
        self->_iconImageView.clipsToBounds = YES;
        self->_titleLabel = [[UILabel alloc] init];
        self->_titleLabel.textAlignment = NSTextAlignmentCenter;
        self->_titleLabel.lineBreakMode = NSLineBreakByCharWrapping;
        [self->_titleLabel setNumberOfLines: 0];
        // 初始化蒙版控件
        self->_maskView = [[UIView alloc] initWithFrame: [UIScreen mainScreen].bounds];
        self->_maskView.hidden = YES;
        
        [self addSubview: self->_iconImageView];
        [self addSubview: self->_titleLabel];
    }
    return self;
}

- (void)registerInfo: (LKBubbleInfo *)info forKey: (NSString *)key{
    self->_infoDic[key] = info;
}

/**
 *  @author 1em0nsOft LiuRi
 *  @date 2016-08-30 16:08:53
 *
 *  @brief 显示指定的信息模型对应的泡泡控件
 */
- (void)showWithInfo: (LKBubbleInfo *)info{
    self->_currentInfo = info;
    self->closeKey = self->_currentInfo.key;// 保存当前要关闭的key，防止关闭不需要关闭的bubble
    if (info.isShowMaskView)
        [[UIApplication sharedApplication].keyWindow addSubview: _maskView];
    [[UIApplication sharedApplication].keyWindow addSubview: self];
    
    // 弹簧动画改变外观
    [UIView animateWithDuration: 0.4 delay:0 usingSpringWithDamping: 0.5 initialSpringVelocity:0.5 options: UIViewAnimationOptionCurveEaseInOut animations:^{
        self.transform = CGAffineTransformMakeScale(1, 1);
        self.alpha = 1;
        if (self->_currentDrawLayer) {
            [self->_currentDrawLayer removeFromSuperlayer];
        }
        self.frame = [info calBubbleViewFrame];
        self->_iconImageView.frame = [info calIconViewFrame];
        self->_titleLabel.frame = [info calTitleViewFrame];
        self->_titleLabel.text = info.title;
        self->_titleLabel.font = [UIFont systemFontOfSize: info.titleFontSize];
        self.layer.cornerRadius = info.cornerRadius;
        
        if (info.iconArray == nil || info.iconArray.count == 0) {
            // 显示显示自定义动画
            _iconImageView.image = [[UIImage alloc] init];
            _currentDrawLayer = [CAShapeLayer layer];
            _currentDrawLayer.fillColor = [UIColor clearColor].CGColor;
            _currentDrawLayer.frame = self->_iconImageView.bounds;
            [self->_iconImageView.layer addSublayer: _currentDrawLayer];
            [_currentTimer invalidate];
            dispatch_async(dispatch_get_main_queue(), ^{
                info.iconAnimation(_currentDrawLayer);
            });
        }
        else if (info.iconArray.count == 1){// 显示单张图片
            [_currentTimer invalidate];
            self->_iconImageView.image = info.iconArray[0];
        }
        else{// 逐帧连环动画
            frameAnimationPlayIndex = 0;// 帧动画播放索引归零
            self->_iconImageView.image = _currentInfo.iconArray[0];
            self->_currentTimer = [NSTimer scheduledTimerWithTimeInterval: info.frameAnimationTime target: self selector: @selector(frameAnimationPlayer) userInfo: nil repeats: YES];
        }
        // maskView
        if (_currentInfo.isShowMaskView && _maskView.hidden) {
            // 本次需要显示，但是之前已经隐藏
            _maskView.alpha = 0;
            _maskView.hidden = NO;
        }
        self->_maskView.alpha = self->_currentInfo.isShowMaskView ? 1 : 0;
    } completion:^(BOOL finished) {
        if(!_currentInfo.isShowMaskView){
            _maskView.hidden = YES;
            [_maskView removeFromSuperview];
        }
    }];
    
    [UIView animateWithDuration: 0.4 delay:0 options:UIViewAnimationOptionTransitionCurlUp animations:^{
        self->_titleLabel.textColor = info.titleColor;
        [self setBackgroundColor: info.backgroundColor];
        _currentDrawLayer.strokeColor = info.iconColor.CGColor;
        self->_maskView.backgroundColor = self->_currentInfo.maskColor;
    } completion:^(BOOL finished) {
        
    }];
}


/**
 帧动画播放器 - NSTimer调用
 */
- (void)frameAnimationPlayer{
    self->_iconImageView.image = _currentInfo.iconArray[frameAnimationPlayIndex];
    frameAnimationPlayIndex = (frameAnimationPlayIndex + 1) % _currentInfo.iconArray.count;
}

/**
 *  @author 1em0nsOft LiuRi
 *  @date 2016-08-30 16:08:53
 *
 *  @brief 通过传入键来显示已经注册的指定样式泡泡控件
 */
- (void)showWithInfoKey: (NSString *)infoKey{
    if ([self->_infoDic.allKeys containsObject: infoKey]){
        [self showWithInfo: self->_infoDic[infoKey]];
    }
}

/**
 *  @author 1em0nsOft LiuRi
 *  @date 2016-08-30 16:08:53
 *
 *  @brief 显示指定的信息模型对应的泡泡控件，并指定的时间后隐藏
 *
 *  @param info          样式信息模型
 *  @param autoCloseTime 指定时间后隐藏泡泡控件的秒数
 */
- (void)showWithInfo: (LKBubbleInfo *)info autoCloseTime: (CGFloat)time{
    [self showWithInfo: info];
    [self performSelector: @selector(hide) withObject: self afterDelay: time + 0.2];
}

/**
 *  @author 1em0nsOft LiuRi
 *  @date 2016-08-30 16:08:53
 *
 *  @brief 显示指定的信息模型对应的泡泡控件，并指定的时间后隐藏
 *
 *  @param info          已注册的样式信息模型的键
 *  @param autoCloseTime 指定时间后隐藏泡泡控件的秒数
 */
- (void)showWithInfoKey: (NSString *)infoKey autoCloseTime: (CGFloat)time{
    if ([self->_infoDic.allKeys containsObject: infoKey]){
        [self showWithInfo: self->_infoDic[infoKey] autoCloseTime: time];
    }
}

/**
 *  @author 1em0nsOft LiuRi
 *  @date 2016-08-30 16:08:40
 *
 *  @brief 隐藏当前泡泡控件
 */
- (void)hide{
    if (self->closeKey == self->_currentInfo.key){// 要关闭的key没有变化，可以关闭
        // 动画缩放，更改透明度使其动画隐藏
        [UIView animateWithDuration: 0.2 delay: 0 options: UIViewAnimationOptionCurveEaseOut animations:^{
            self.transform = CGAffineTransformMakeScale(0.5f, 0.5f);
            self->_maskView.alpha = 0;
            self.alpha = 0;
        } completion:^(BOOL finished) {
            // 从父层控件中移除
            [self removeFromSuperview];
            [self->_maskView removeFromSuperview];
        }];
    }
}

- (void)setProgress:(CGFloat)progress{
    self->_progress = progress;
    if (self->_currentInfo.onProgressChanged != nil){
        dispatch_async(dispatch_get_main_queue(), ^{
            self->_currentInfo.onProgressChanged(self->_currentDrawLayer, progress);
        });
    }
}

@end
