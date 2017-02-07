//
//  LKLinkageView.h
//  LemonKit
//
//  Created by 1em0nsOft on 2017/2/7.
//  Copyright © 2017年 Lemonsoft. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LKLinkageItem;

@interface LKLinkageView : UIView

/**
 根节点数组
 */
@property (readonly,nonnull,nonatomic,strong)NSMutableArray<LKLinkageItem *> *rootItems;
/**
 正常时标题颜色
 */
@property (nonnull,nonatomic,strong)UIColor *titleColor;
/**
 正常时背景颜色
 */
@property (nonnull,nonatomic,strong)UIColor *backgroundColor;
/**
 选中时标题颜色
 */
@property (nonnull,nonatomic,strong)UIColor *selectedTitleColor;
/**
 选中时背景颜色
 */
@property (nonnull,nonatomic,strong)UIColor *selectedBackgroundColor;
/**
 触摸时的标题颜色
 */
@property (nonnull,nonatomic,strong)UIColor *touchedTitleColor;
/**
 触摸时的背景颜色
 */
@property (nonnull,nonatomic,strong)UIColor *touchedBackgroundColor;
/**
 行分割线颜色
 */
@property (nonnull,nonatomic,strong)UIColor *lineDivisionColor;
/**
 列分割线颜色
 */
@property (nonnull,nonatomic,strong)UIColor *columnDivisionColor;
/**
 选择行的行高
 */
@property (assign)CGFloat lineHeight;

@end
