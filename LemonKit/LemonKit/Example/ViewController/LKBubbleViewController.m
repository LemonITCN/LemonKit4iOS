//
//  LKBubbleViewController.m
//  LemonKit
//
//  Created by 1em0nsOft on 16/9/8.
//  Copyright © 2016年 1em0nsOft. All rights reserved.
//

#import "LKBubbleViewController.h"

@interface LKBubbleViewController ()

@end

@implementation LKBubbleViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (IBAction)showSuccessBubble:(UIButton *)sender {
    [self showRightWithTitle: @"添加成功" autoCloseTime: 2];
}

- (IBAction)showProgressBubble:(UIButton *)sender {
    [self showRoundProgressWithTitle: @"加载中"];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self showRightWithTitle: @"加载完毕" autoCloseTime: 2];
    });
}

- (IBAction)showErrorBubble:(UIButton *)sender {
    [self showErrorWithTitle: @"下载失败" autoCloseTime: 2];
}

- (IBAction)showFrameAnimationBubble:(UIButton *)sender {
    LKBubbleInfo *frameInfo = [[LKBubbleInfo alloc] init];
    NSMutableArray<UIImage *> *icons = [[NSMutableArray alloc] init];
    for (int i = 1 ; i <= 8; i ++) {
        [icons addObject: [UIImage imageNamed: [NSString stringWithFormat: @"lkbubble%d.jpg" , i]]];
    }
    frameInfo.iconArray = icons;
    // 在数组中依次放入多张图片即可实现多图循环播放
    frameInfo.backgroundColor = [UIColor colorWithRed: 238 / 255.0 green:238 / 255.0 blue:238 / 255.0 alpha:1];
    // 动画的帧动画播放间隔
    frameInfo.frameAnimationTime = 0.15;
    frameInfo.title = @"正在加载中...";
    frameInfo.titleColor = [UIColor darkGrayColor];
    [[LKBubbleView defaultBubbleView] showWithInfo: frameInfo];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self showSingleIconBubble: sender];
    });
}

- (IBAction)showSingleIconBubble:(UIButton *)sender {
    LKBubbleInfo *iconInfo = [[LKBubbleInfo alloc] init];
    // 把图标数组里面设置只有一张图片即可单图固定图标
    iconInfo.iconArray = @[[UIImage imageNamed: @"lkbubble-warning"]];
    iconInfo.backgroundColor = [UIColor colorWithRed: 0.95 green:0.95 blue:0.95 alpha:1];
    iconInfo.titleColor = [UIColor darkGrayColor];
    iconInfo.locationStyle = BUBBLE_LOCATION_STYLE_BOTTOM;
    iconInfo.layoutStyle = BUBBLE_LAYOUT_STYLE_ICON_LEFT_TITLE_RIGHT;
    iconInfo.title = @"这是一个警告的泡泡控件";
    iconInfo.proportionOfDeviation = 0.05;
    iconInfo.bubbleSize = CGSizeMake(300, 60);
    [[LKBubbleView defaultBubbleView] showWithInfo: iconInfo autoCloseTime: 2];
}

@end
