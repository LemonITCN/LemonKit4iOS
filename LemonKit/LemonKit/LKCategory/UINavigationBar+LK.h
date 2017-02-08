//
//  UINavigationBar+LK.h
//  LemonKit
//
//  Created by 1em0nsOft on 2017/2/8.
//  Copyright © 2017年 Lemonsoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationBar (LK)

/**
 标题label的文字颜色
 */
@property (nonatomic,strong) UIColor *titleColor;
/**
 导航栏的渲染颜色，修改的是标题颜色和item渲染颜色
 */
@property (nonatomic,strong) UIColor *renderingColor;

@end
