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
        self->_infoDic = [[NSMutableDictionary alloc] init];
        
        self.clipsToBounds = YES;
        self->_iconImageView = [[UIImageView alloc] init];
        self->_iconImageView.clipsToBounds = YES;
        self->_titleLabel = [[UILabel alloc] init];
        self->_titleLabel.textAlignment = NSTextAlignmentCenter;
        self->_titleLabel.lineBreakMode = NSLineBreakByCharWrapping;
        [self->_titleLabel setNumberOfLines: 0];
        
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
    if (self->_currentDrawLayer) {
        [self->_currentDrawLayer removeFromSuperlayer];
    }
    self.frame = [info calBubbleViewFrame];
    self->_iconImageView.frame = [info calIconViewFrame];
    self->_titleLabel.frame = [info calTitleViewFrame];
    self->_titleLabel.text = info.title;
    self->_titleLabel.textColor = info.titleColor;
    self->_titleLabel.font = [UIFont systemFontOfSize: info.titleFontSize];
    [self setBackgroundColor: info.backgroundColor];
    self.layer.cornerRadius = info.cornerRadius;
    
    
    if (info.iconArray == nil || info.iconArray.count == 0) {
        // 显示显示自定义动画
        _currentDrawLayer = [CAShapeLayer layer];
        _currentDrawLayer.fillColor = [UIColor clearColor].CGColor;
        _currentDrawLayer.strokeColor = info.iconColor.CGColor;
        _currentDrawLayer.frame = self->_iconImageView.bounds;
        [self->_iconImageView.layer addSublayer: _currentDrawLayer];
        [[UIApplication sharedApplication].keyWindow addSubview: self];
        dispatch_async(dispatch_get_main_queue(), ^{
            info.iconAnimation(_currentDrawLayer);
        });
    }
    else if (info.iconArray.count == 1){
        self->_iconImageView.image = info.iconArray[0];
    }
    else{
        __block int index = 0;
        self->_currentTimer = [NSTimer scheduledTimerWithTimeInterval: info.frameAnimationTime repeats: YES block:^(NSTimer * _Nonnull timer) {
            self->_iconImageView.image = info.iconArray[index];
            index = (index + 1) % info.iconArray.count;
        }];
    }
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
- (void)showWithInfo: (LKBubbleInfo *)info autoCloseTime: (NSInteger)time{
    
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
- (void)showWithInfoKey: (NSString *)infoKey autoCloseTime: (NSInteger)time{
    
}

/**
 *  @author 1em0nsOft LiuRi
 *  @date 2016-08-30 16:08:40
 *
 *  @brief 隐藏当前泡泡控件
 */
- (void)hide{
    
}

- (void)setProgress:(CGFloat)progress{
    self->_progress = progress;
    if (self->_currentInfo.onProgressChanged != nil){
        dispatch_async(dispatch_get_main_queue(), ^{
            self->_currentInfo.onProgressChanged(self->_currentDrawLayer, progress);
        });
    }
}

//// 显示泡泡控件
//- (void)show{
//    self->_isShowing = YES;
//    for (CALayer *layer in self->_iconImageView.layer.sublayers){
//        [layer removeFromSuperlayer];
//    }
//    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
//    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
//    self.frame = CGRectMake(screenWidth / 2, screenHeight / 2, 0, 0);
//    self->_iconImageView.frame = CGRectMake(0, 0, 0, 0);
//    self->_titleLabel.frame = CGRectMake(bubble_padding, self->_iconImageView.frame.origin.y + self->_iconImageView.frame.size.height + bubble_icon_title_space, bubble_width - bubble_padding * 2, 24);
//    self->_titleLabel.center = self.bounds.origin;
//    self.backgroundColor = LKUIColorMake(0, 0, 0, 0);
//    self.alpha = 0;
//    
//    [UIView animateWithDuration: 0.4 delay: 0 usingSpringWithDamping: 0.8 initialSpringVelocity:0.5 options: UIViewAnimationOptionCurveLinear animations:^{
//        self.frame = CGRectMake((screenWidth - bubble_width) / 2, (screenHeight - bubble_width) / 2, bubble_width, bubble_height);
//        self->_iconImageView.frame = CGRectMake((bubble_width - bubble_icon_width) / 2, bubble_padding, bubble_icon_width, bubble_icon_width);
//        self->_titleLabel.frame = CGRectMake(bubble_padding, self->_iconImageView.frame.origin.y + self->_iconImageView.frame.size.height + bubble_icon_title_space, bubble_width - bubble_padding * 2, 24);
//        self.backgroundColor = LKUIColorMake(0, 0, 0, 0.8);
//        self.alpha = 1;
//    } completion:^(BOOL finished) {
//        
//        
//        
//    }];
//    
//    CALayer *drawLayer = [CALayer layer];
//    drawLayer.frame = _iconImageView.bounds;
//    [self->_iconImageView.layer addSublayer: drawLayer];
//    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
//    shapeLayer.fillColor = [UIColor clearColor].CGColor;
//    shapeLayer.strokeColor = [UIColor whiteColor].CGColor;
//    shapeLayer.lineCap = kCALineCapRound;
//    shapeLayer.lineWidth = 3;
//    UIBezierPath *path = [UIBezierPath bezierPath];
//    [path moveToPoint: CGPointMake(10, 28)];
//    [path addLineToPoint: CGPointMake(22, 40)];
//    [path addLineToPoint: CGPointMake(50, 12)];
//    shapeLayer.path = path.CGPath;
//    [drawLayer addSublayer: shapeLayer];
//    
//    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath: @"strokeEnd"];
//    animation.duration = 0.35;
//    animation.fromValue = [NSNumber numberWithInt: 0];
//    animation.toValue = [NSNumber numberWithInt: 1];
//    [shapeLayer addAnimation: animation forKey: @"ss"];
//    
//    [[[UIApplication sharedApplication] keyWindow] addSubview: self];
//}
//
//// 显示泡泡控件并指定的时间后隐藏
//- (void)showAndWaitInterval: (float)waitInterval{
//    
//}
//
//// 隐藏当前的泡泡控件
//- (void)hide{
//    self->_isShowing = NO;
//}
//
//// 设置泡泡控件的标题
//- (void)setTitle: (NSString *)title{
//    self->_titleLabel.text = title;
//}


@end
