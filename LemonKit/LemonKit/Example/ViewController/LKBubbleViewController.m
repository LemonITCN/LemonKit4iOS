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

@end
