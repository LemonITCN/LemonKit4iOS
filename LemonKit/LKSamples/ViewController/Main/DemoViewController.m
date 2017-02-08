//
//  DemoViewController.m
//  LemonKit
//
//  Created by 1em0nsOft on 2017/2/8.
//  Copyright © 2017年 Lemonsoft. All rights reserved.
//

#import "DemoViewController.h"

@interface DemoViewController (){
    LKLinkageView *_rootLinkageView;
}

@end

@implementation DemoViewController

- (void)initBaseInfo{
    self.title = LKLocalStr(@"m_tabDemo");
}

- (void)initView{
    // 计算控件的位置
    self->_rootLinkageView = [[LKLinkageView alloc] initWithFrame: CGRectMake(0, NAVIGATION_BAR_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT - NAVIGATION_BAR_HEIGHT - TAB_BAR_HEIGHT)];
    [self addSubview: self->_rootLinkageView];
    // 读取本地demo目录plist
    NSDictionary *linkageInfo = [NSDictionary dictionaryWithMainBundlePlistName: @"LKDemoLinkageInfo"];
    // 遍历，根据dictionary生成对象
    for (NSDictionary *dic in linkageInfo[@"rootItems"]) 
        [self->_rootLinkageView.rootItems addObject: [[LKLinkageItem alloc] initWithStandardDictionary: dic]];
    [self->_rootLinkageView refresh];// 刷新，应用内容
}

@end
