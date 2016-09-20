//
//  LKActionSheetView.h
//  LemonKit
//
//  Created by 1em0nsOft on 2016/9/20.
//  Copyright © 2016年 1em0nsOft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LKActionLineView.h"

@interface LKActionSheetView : NSObject

@property CGFloat groupHeightSpace;
@property CGFloat headViewHeight;
@property UILabel *headView;
@property(nonatomic) NSString *title;

+ (LKActionSheetView *)defaultActionSheetView;
/// @brief 显示ActionSheet
- (void)show;
/// @brief 隐藏ActionSheet
- (void)hide;
/// @brief 添加一个事件组
- (void)addActionGroup;
/// @brief 移除一个指定索引的事件组
- (void)removeActionGroupAtIndex: (NSInteger)index;
/// @breif 移除所有的组并新建一个空的组
- (void)clear;
/// @brief 在指定的事件组中追加一个事件
- (void)addAction: (LKActionItem *)action groupIndex: (NSInteger)index;
/// @brief 在指定的事件组中的指定位置插入一个事件
- (void)insertAction: (LKActionItem *)action groupIndex: (NSInteger)index location: (NSInteger)location;
/// @brief 移除指定事件组的指定位置的事件
- (void)removeActionAtIndex: (NSInteger)index location: (NSInteger)location;

@end
