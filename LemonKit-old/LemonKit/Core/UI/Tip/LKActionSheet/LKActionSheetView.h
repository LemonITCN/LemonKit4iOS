//
//  LKActionSheetView.h
//  LemonKit
//
//  Created by 1em0nsOft on 2016/9/20.
//  Copyright © 2016年 1em0nsOft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LKActionLineView.h"


/**
 ActionSheet选择控件
 */
@interface LKActionSheetView : NSObject


/**
 事件组之间的缝隙的高度数值
 */
@property CGFloat groupHeightSpace;
/**
 头部控件的高度
 */
@property CGFloat headViewHeight;
/**
 头部标题控件
 */
@property UILabel *headView;
/**
 顶部显示的标题
 */
@property(nonatomic) NSString *title;

/**
 当actionSheet弹出的时候，后面的viewController的缩放比例
 */
@property(nonatomic) CGFloat backViewControllerScale;


/**
 在屏幕中占用的最大高度比例，0-1之间，默认是1
 */
@property(nonatomic) CGFloat maxHeightInScreen;

/**
 获取默认的选择控件 - 单例方法

 @return 默认的选择控件
 */
+ (LKActionSheetView *)defaultActionSheetView;

/**
 显示ActionSheet
 */
- (void)show;

/**
 隐藏ActionSheet
 */
- (void)hide;

/**
 添加一个事件组
 */
- (void)addActionGroup;

/**
 移除一个指定索引的事件组

 @param index 移除指定的事件组
 */
- (void)removeActionGroupAtIndex: (NSInteger)index;

/**
 移除所有的组并新建一个空的组
 */
- (void)clear;

/**
 在指定的事件组中追加一个事件

 @param action 要追加的事件对象
 @param index  要插入的事件组的位置
 */
- (void)addAction: (LKActionItem *)action groupIndex: (NSInteger)index;

/**
 在指定的事件组中的指定位置插入一个事件

 @param action   要插入的事件对象
 @param index    要把事件插入的事件组索引
 @param location 插入的事件组的位置
 */
- (void)insertAction: (LKActionItem *)action groupIndex: (NSInteger)index location: (NSInteger)location;

/**
 移除指定事件组的指定位置的事件

 @param index    移除事件的事件组的索引下标
 @param location 要移除的事件位置下标
 */
- (void)removeActionAtIndex: (NSInteger)index location: (NSInteger)location;

@end
