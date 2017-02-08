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
    NSDictionary *linkageInfo = [NSDictionary dictionaryWithMainBundlePlistName: @"LKDemoLinkageInfo"];
    LKLog(@"rootitems count : %lu", (unsigned long)((NSArray *)linkageInfo[@"rootItems"]).count);
    for (NSDictionary *dic in linkageInfo[@"rootItems"]) {
        [self->_rootLinkageView.rootItems addObject: [[LKLinkageItem alloc] initWithStandardDictionary: dic]];
    }
    [self->_rootLinkageView refresh];// 刷新，应用内容
}

@end
