//
//  LKLinkageView.h
//  LemonKit
//
//  Created by 1em0nsOft on 2017/2/7.
//  Copyright © 2017年 Lemonsoft. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LKLinkageItem;
@class LKLinkageCell;
@class LKLinkageView;
@class LKLinkageColumn;

@protocol LKLinkageViewDelegate <NSObject>

- (void)customCellWithLKLinkageView: (nonnull LKLinkageView *)linkageView
                        linkageCell: (nonnull LKLinkageCell *)linkageCell
                        linkageItem: (nonnull LKLinkageItem *)linkageitem;

@end

@interface LKLinkageView : UIView

/**
 根节点数组
 */
@property (readonly,nonnull,nonatomic,strong)NSMutableArray<LKLinkageItem *> *rootItems;
/**
 正常时标题颜色
 */
@property (nonnull,nonatomic,strong)UIColor *cellTitleColor;
/**
 正常时背景颜色
 */
@property (nonnull,nonatomic,strong)UIColor *cellBackgroundColor;
/**
 选中时标题颜色
 */
@property (nonnull,nonatomic,strong)UIColor *cellSelectedTitleColor;
/**
 选中时背景颜色
 */
@property (nonnull,nonatomic,strong)UIColor *cellSelectedBackgroundColor;
/**
 触摸时的标题颜色
 */
@property (nonnull,nonatomic,strong)UIColor *cellTouchedTitleColor;
/**
 触摸时的背景颜色
 */
@property (nonnull,nonatomic,strong)UIColor *cellTouchedBackgroundColor;
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

/**
 列视图存储数组
 */
@property (nonnull,nonatomic,strong,readonly)NSMutableArray<LKLinkageColumn *> *columns;
/**
 选择路径
 */
@property (nonnull,nonatomic,strong,readonly)NSMutableArray<NSValue *> *path;

- (void)refresh;

@end
