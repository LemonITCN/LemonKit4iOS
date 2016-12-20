//
//  LKUIViewController.h
//  LemonKit
//
//  Created by 1em0nsOft on 2016/11/25.
//  Copyright © 2016年 Lemonsoft. All rights reserved.
//

#import <UIKit/UIKit.h>


/// @brief 默认的LK导航栏的高度为 64
#define LK_NAVIGATION_BAR_HEIGHT 64

/**
 自定义的视图控制器LKUIViewController
 对视图控制器的生命周期进行了相关扩展，并对增加了部分工具函数
 */
@interface LKUIViewController : UIViewController <UIGestureRecognizerDelegate>

/**
 LK自定义 - 导航栏
 */
@property (nonatomic , readonly) UINavigationBar *lkNavigationBar;

/**
 LK自定义 - 导航栏Item
 */
@property (nonatomic , readonly) UINavigationItem *lkNavigationItem;


/**
 LK生命周期 - 视图被第一次显示出来时候调用

 @param animated 是否使用了动画
 */
- (void)firstViewDidAppear: (BOOL)animated;

/**
 LK生命周期，该生命周期在init过程中最后调用，用于初始化界面中的一些基础信息，如设置ViewController的title等
 */
- (void)initBaseInfo;

/**
 LK生命周期，该生命周期在viewDidLoad中最先调用，用于初始化界面中所预先需要的数据，如调用业务层从数据库中读取一些用于即将要显示的数据
 */
- (void)initData;

/**
 LK生命周期，该生命周期紧跟initData之后调用，用于初始化界面中控件的样式以及初始化ViewController中自带控件（如NavigationItem）
 */
- (void)initView;

/**
 LK生命周期，该生命周期紧跟initView之后调用，用于初始化界面中所需要的所有的事件，以及处理KVC/KVO相关观察者操作
 */
- (void)initEvent;

@end
