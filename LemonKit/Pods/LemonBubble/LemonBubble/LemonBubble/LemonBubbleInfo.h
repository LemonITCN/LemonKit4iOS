//
//  LemonBubbleInfo.h
//  LemonKit
//
//  Created by 1em0nsOft on 16/9/12.
//  Copyright © 2016年 1em0nsOft. All rights reserved.
//

#import <UIKit/UIKit.h>

/// @brief 自定义动画Block
typedef void(^BLOCK_LK_BUBBLE_CUSTOM_ANIMATION) (CAShapeLayer *layer);
/// @brief 进度被改变的Block，通常用于自定义进度动画
typedef void(^BLOCK_LK_BUBBLE_ON_PROGRESS_CHANGED) (CAShapeLayer *layer , CGFloat progress);

/// @brief 图文布局枚举
typedef enum{
    /// @brief 图上文下
    BUBBLE_LAYOUT_STYLE_ICON_TOP_TITLE_BOTTOM = 0,
    /// @brief 图下文上
    BUBBLE_LAYOUT_STYLE_ICON_BOTTOM_TITLE_TOP = 3,
    /// @brief 图左文右
    BUBBLE_LAYOUT_STYLE_ICON_LEFT_TITLE_RIGHT = 1,
    /// @brief 图右文左
    BUBBLE_LAYOUT_STYLE_ICON_RIGHT_TITLE_LEFT = 4,
    /// @brief 只显示图
    BUBBLE_LAYOUT_STYLE_ICON_ONLY = 2,
    /// @brief 只显示文
    BUBBLE_LAYOUT_STYLE_TITLE_ONLY = 5
}BUBBLE_LAYOUT_STYLE;

/// @brief LK泡泡控件位置枚举
typedef enum{
    /// @brief 位于屏幕顶部
    BUBBLE_LOCATION_STYLE_TOP = 0,
    /// @brief 位于屏幕中间
    BUBBLE_LOCATION_STYLE_CENTER,
    /// @breif 位于屏幕底部
    BUBBLE_LOCATION_STYLE_BOTTOM
}BUBBLE_LOCATION_STYLE;

/**
 泡泡控件的信息描述对象，该类详细描述了泡泡对象的左右外观信息，控件可以根据泡泡信息对象来进行设置泡泡控件的外观属性
 */
@interface LemonBubbleInfo : NSObject

/// @breif 泡泡控件的大小
@property (nonatomic, assign) CGSize bubbleSize;
/// @brief 泡泡控件的圆角半径
@property (nonatomic, assign) CGFloat cornerRadius;
/// @brief 图文布局属性
@property (nonatomic, assign) BUBBLE_LAYOUT_STYLE layoutStyle;
/// @brief 图标动画
@property (nonatomic, assign) BLOCK_LK_BUBBLE_CUSTOM_ANIMATION iconAnimation;
/// @brief 进度被改变的回调block
@property (nonatomic, assign) BLOCK_LK_BUBBLE_ON_PROGRESS_CHANGED onProgressChanged;
/// @brief 图标数组，如果该数组为空或者该对象为nil，那么显示自定义动画，如果图标为一张，那么固定显示那个图标，大于一张的时候显示图片帧动画
@property (nonatomic, strong) NSArray<UIImage *> *iconArray;
/// @brief 要显示的标题
@property (nonatomic, strong) NSString *title;
/// @brief 帧动画时间间隔
@property (nonatomic, assign) CGFloat frameAnimationTime;
/// @brief 图标占比 0 - 1，图标控件的边长占高度的比例
@property (nonatomic, assign) CGFloat proportionOfIcon;
/// @brief 间距占比 0 - 1，图标控件和标题控件之间距离占整个控件的比例（如果横向布局那么就相当于宽度，纵向布局相当于高度）
@property (nonatomic, assign) CGFloat proportionOfSpace;
/// @brief 内边距占比 0 - 1，整个泡泡控件的内边距，x最终为左右的内边距，y最终为上下的内边距（左右内边距以宽度算最终的像素值，上下边距以高度算最终的像素值）
@property (nonatomic, assign) CGPoint proportionOfPadding;
/// @brief 位置样式
@property (nonatomic, assign) BUBBLE_LOCATION_STYLE locationStyle;
/// @brief 泡泡控件显示时偏移，当位置样式为上中的时候，偏移值是向下移动，当位置样式为底部时候，偏移值是向上移动
@property (nonatomic, assign) CGFloat proportionOfDeviation;
/// @brief 是否展示蒙版，展示蒙版后，显示泡泡控件时会产生一个蒙版层来拦截所有其他控件的点击事件
@property (nonatomic, assign) BOOL isShowMaskView;
/// @brief 蒙版颜色
@property (nonatomic, strong) UIColor *maskColor;
/// @brief 背景色
@property (nonatomic, strong) UIColor *backgroundColor;
/// @brief 图标渲染色
@property (nonatomic, strong) UIColor *iconColor;
/// @brief 标题文字颜色
@property (nonatomic, strong) UIColor *titleColor;
/// @brief 标题字体大小
@property (nonatomic, assign) CGFloat titleFontSize;
/// @breif key，随机数，用于标志一个info的唯一性，关闭时候会通过这个验证
@property (nonatomic, readonly) CGFloat key;

/**
 计算泡泡控件的整体frame

 @return 计算出的泡控件的frame
 */
- (CGRect)calBubbleViewFrame;

/**
 计算并设置图标控件和标题控件的frame

 @param iconView 要设置的图标控件
 @param titleView 要设置的标题控件
 */
- (void)calIconView:(UIImageView *)iconView andTitleView:(UILabel *)titleView;

@end
