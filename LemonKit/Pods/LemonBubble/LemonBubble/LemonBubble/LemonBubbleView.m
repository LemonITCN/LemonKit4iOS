//
//  LemonBubbleView.m
//  LemonKit
//
//  Created by 1em0nsOft on 16/8/30.
//  Copyright © 2016年 1em0nsOft. All rights reserved.
//

#import "LemonBubbleView.h"

#define bubble_width 180 // 泡泡控件的宽度
#define bubble_height 120// 泡泡控件的高度
#define bubble_icon_width 60 // 泡泡控件中的图标边长
#define bubble_padding 17 // 泡泡控件的顶部内边距，即图标距离顶部的长度
#define bubble_icon_title_space 0 // 泡泡控件中图标和标题的空隙

@interface LemonBubbleView()

@property(nonatomic, strong) UIImageView *iconImageView;
@property(nonatomic, strong) UILabel *titleLabel;
@property(nonatomic, assign) BOOL *isShowing;// 是否正在显示中
@property(nonatomic, strong) NSMutableDictionary<NSString*, LemonBubbleInfo*> *infoDic;
/// @brief 当前正在显示的泡泡信息对象
@property(nonatomic, strong) LemonBubbleInfo *currentInfo;
/// @brief 当前自定义动画绘图的图层
@property(nonatomic, strong) CAShapeLayer *currentDrawLayer;
/// @brief 当前使用的图片帧动画计时器
@property(nonatomic, strong) NSTimer *currentTimer;
/// @brief 蒙版view
@property(nonatomic, strong) UIView *maskView;

@property(nonatomic, assign) CGFloat closeKey;// 关闭验证key，用来做关闭时候的延迟验证，当设置自动关闭之后，若在关闭之前出发了显示其他info的bubble，通过修改这个值保证不关闭其他样式的infoBubble
@property(nonatomic, assign) NSInteger frameAnimationPlayIndex;// 帧动画播放的下标索引

@end

@implementation LemonBubbleView
	
+ (LemonBubbleView *)defaultBubbleView {
	static LemonBubbleView *defaultBubbleView = nil;
	static dispatch_once_t onceToken;
	
	dispatch_once(&onceToken, ^{
		if (defaultBubbleView == nil) {
			defaultBubbleView = [[LemonBubbleView alloc] init];
		}
	});
	return defaultBubbleView;
}

- (instancetype)init{
    if (self = [super init]) {
        UIWindow *keyWindow = [[[UIApplication sharedApplication] delegate] window];
        self.frame = CGRectMake(keyWindow.center.x, keyWindow.center.y, 0, 0);
        self.infoDic = [[NSMutableDictionary alloc] init];
        
        self.clipsToBounds = YES;
        self.iconImageView = [[UIImageView alloc] init];
        _iconImageView.clipsToBounds = YES;
        self.titleLabel = [[UILabel alloc] init];
		_titleLabel.adjustsFontSizeToFitWidth = YES;
		_titleLabel.minimumScaleFactor = 0.5;
		_titleLabel.lineBreakMode = NSLineBreakByCharWrapping;
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        [_titleLabel setNumberOfLines: 0];
        // 初始化蒙版控件
        self.maskView = [[UIView alloc] initWithFrame: [UIScreen mainScreen].bounds];
        _maskView.hidden = YES;
        
        [self addSubview: _iconImageView];
        [self addSubview: _titleLabel];
    }
    return self;
}

- (void)registerInfo: (LemonBubbleInfo *)info forKey: (NSString *)key{
    self.infoDic[key] = info;
}

/**
 *  @author 1em0nsOft LiuRi
 *  @date 2016-08-30 16:08:53
 *
 *  @brief 显示指定的信息模型对应的泡泡控件
 */
- (void)showWithInfo: (LemonBubbleInfo *)info{
    self.currentInfo = info;
    self.closeKey = _currentInfo.key;// 保存当前要关闭的key，防止关闭不需要关闭的bubble
    UIWindow *mWindow = [[[UIApplication sharedApplication] delegate] window];// 防止使用Storyboard的时候keywindow为nil
    if (info.isShowMaskView)
        [mWindow addSubview: _maskView];
    [mWindow addSubview: self];
    
    // 弹簧动画改变外观
    [UIView animateWithDuration: 0.45
                          delay:0
         usingSpringWithDamping: 0.8
          initialSpringVelocity:0.9
                        options: UIViewAnimationOptionCurveEaseInOut
                     animations:^{
        self.transform = CGAffineTransformMakeScale(1, 1);
        if (_currentDrawLayer) {
            [_currentDrawLayer removeFromSuperlayer];
        }
        self.frame = [info calBubbleViewFrame];
        _titleLabel.text = info.title;
        _titleLabel.font = [UIFont systemFontOfSize: info.titleFontSize];
		[info calIconView: _iconImageView andTitleView: _titleLabel];
        self.layer.cornerRadius = info.cornerRadius;
        
        if (info.iconArray == nil || info.iconArray.count == 0) {
            // 显示显示自定义动画
			if (info.iconAnimation) {
				_iconImageView.image = [[UIImage alloc] init];
				self.currentDrawLayer = [CAShapeLayer layer];
				_currentDrawLayer.fillColor = [UIColor clearColor].CGColor;
				_currentDrawLayer.frame = _iconImageView.bounds;
				[_iconImageView.layer addSublayer: _currentDrawLayer];
				[_currentTimer invalidate];
				dispatch_async(dispatch_get_main_queue(), ^{
					info.iconAnimation(_currentDrawLayer);
				});
			}
        }
        else if (info.iconArray.count == 1){// 显示单张图片
            [_currentTimer invalidate];
            self.iconImageView.image = info.iconArray[0];
        }
        else{// 逐帧连环动画
            self.frameAnimationPlayIndex = 0;// 帧动画播放索引归零
            self.iconImageView.image = _currentInfo.iconArray[0];
            self.currentTimer =
            [NSTimer scheduledTimerWithTimeInterval: info.frameAnimationTime
                                             target: self
                                           selector: @selector(frameAnimationPlayer)
                                           userInfo: nil
                                            repeats: YES];
        }
        // maskView
        if (_currentInfo.isShowMaskView && _maskView.hidden) {
            // 本次需要显示，但是之前已经隐藏
            _maskView.alpha = 0;
            _maskView.hidden = NO;
        }
        _maskView.alpha = _currentInfo.isShowMaskView ? 1 : 0;
    } completion:^(BOOL finished) {
        if(!_currentInfo.isShowMaskView){
            _maskView.hidden = YES;
            [_maskView removeFromSuperview];
        }
    }];
    
    [UIView animateWithDuration: 0.45
                          delay:0
                        options:UIViewAnimationOptionTransitionCurlUp
                     animations:^{
        _titleLabel.textColor = info.titleColor;
        [self setBackgroundColor: info.backgroundColor];
        _currentDrawLayer.strokeColor = info.iconColor.CGColor;
        _maskView.backgroundColor = _currentInfo.maskColor;
        self.alpha = 1;
    } completion:^(BOOL finished) {
        
    }];
}


/**
 帧动画播放器 - NSTimer调用
 */
- (void)frameAnimationPlayer{
    self.iconImageView.image = _currentInfo.iconArray[_frameAnimationPlayIndex];
    self.frameAnimationPlayIndex = (_frameAnimationPlayIndex + 1) % _currentInfo.iconArray.count;
}

/**
 *  @author 1em0nsOft LiuRi
 *  @date 2016-08-30 16:08:53
 *
 *  @brief 通过传入键来显示已经注册的指定样式泡泡控件
 */
- (void)showWithInfoKey: (NSString *)infoKey{
    if ([self.infoDic.allKeys containsObject: infoKey]){
        [self showWithInfo: self.infoDic[infoKey]];
    }
}

/**
 *  @author 1em0nsOft LiuRi
 *  @date 2016-08-30 16:08:53
 *
 *  @brief 显示指定的信息模型对应的泡泡控件，并指定的时间后隐藏
 *
 *  @param info          样式信息模型
 *  @param time 指定时间后隐藏泡泡控件的秒数
 */
- (void)showWithInfo: (LemonBubbleInfo *)info autoCloseTime: (CGFloat)time{
    [self showWithInfo: info];
    [self performSelector: @selector(hide)
               withObject: self
               afterDelay: time + 0.2];
}

/**
 *  @author 1em0nsOft LiuRi
 *  @date 2016-08-30 16:08:53
 *
 *  @brief 显示指定的信息模型对应的泡泡控件，并指定的时间后隐藏
 *
 *  @param infoKey          已注册的样式信息模型的键
 *  @param time 指定时间后隐藏泡泡控件的秒数
 */
- (void)showWithInfoKey: (NSString *)infoKey autoCloseTime: (CGFloat)time{
    if ([self.infoDic.allKeys containsObject: infoKey]){
        [self showWithInfo: _infoDic[infoKey]
             autoCloseTime: time];
    }
}

/**
 *  @author chenjunsheng
 *  @date 2016-12-18 16:08:40
 *
 *  @brief 隐藏当前泡泡控件
 */
- (void)hideWithCloseTime: (CGFloat)time {
	[self performSelector: @selector(hide)
               withObject: self
               afterDelay: time];
}

/**
 *  @author 1em0nsOft LiuRi
 *  @date 2016-08-30 16:08:40
 *
 *  @brief 隐藏当前泡泡控件
 */
- (void)hide{
    if (self.closeKey == _currentInfo.key){// 要关闭的key没有变化，可以关闭
        // 动画缩放，更改透明度使其动画隐藏
        [UIView animateWithDuration: 0.2
                              delay: 0
                            options: UIViewAnimationOptionCurveEaseOut
                         animations:^{
            self.transform = CGAffineTransformMakeScale(0.5f, 0.5f);
            _maskView.alpha = 0;
            self.alpha = 0;
			// 记得把定时器停了
			[_currentTimer invalidate];
        } completion:^(BOOL finished) {
            // 从父层控件中移除
            [self removeFromSuperview];
            [_maskView removeFromSuperview];
        }];
    }
}

- (void)setProgress:(CGFloat)progress{
    self.progress = progress;
    if (_currentInfo.onProgressChanged != nil){
        dispatch_async(dispatch_get_main_queue(), ^{
            _currentInfo.onProgressChanged(_currentDrawLayer, progress);
        });
    }
}

@end
