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
    LKBubbleInfo *info = [[LKBubbleInfo alloc] init];
    info.iconAnimation = ^(CAShapeLayer *layer){
        
        layer.fillColor = [UIColor clearColor].CGColor;
        layer.strokeColor = [UIColor whiteColor].CGColor;
        layer.lineCap = kCALineCapRound;
        layer.lineWidth = 3;
        
//        __block int step = -60;
//        [NSTimer scheduledTimerWithTimeInterval: 0.5 repeats: YES block:^(NSTimer * _Nonnull timer) {
//
//            step += 1;
//            if (step > 60) {
//                step = -60;
//            }
//        }];
//        UIBezierPath *path = [UIBezierPath bezierPath];
//        [path addArcWithCenter: CGPointMake(layer.frame.size.width / 2, layer.frame.size.height / 2) radius:layer.frame.size.width / 2 - 5 startAngle:0 endAngle:-1 clockwise: YES];
//        layer.path = path.CGPath;
//        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath: @"strokeEnd"];
//        animation.duration = 0.35;
//        animation.fromValue = [NSNumber numberWithInt: 0];
//        animation.toValue = [NSNumber numberWithInt: 1];
////        animation.autoreverses = YES;
//        [layer addAnimation: animation forKey: @""];

        
        
    };
    info.title = @"添加成功";
//    info.bubbleSize = CGSizeMake(180, 60);
//    info.layoutStyle = BUBBLE_LAYOUT_STYLE_ICON_LEFT_TITLE_RIGHT;
//    info.bubbleSize = CGSizeMake(100, 100);
//    info.layoutStyle = BUBBLE_LAYOUT_STYLE_ICON_ONLY;
//    info.layoutStyle = BUBBLE_LAYOUT_STYLE_ICON_BOTTOM_TITLE_TOP;
//    info.bubbleSize = CGSizeMake(180, 60);
//    info.layoutStyle = BUBBLE_LAYOUT_STYLE_ICON_RIGHT_TITLE_LEFT;
//    info.layoutStyle = BUBBLE_LAYOUT_STYLE_TITLE_ONLY;
    [[LKBubbleView defaultBubbleView] showWithInfo: info];
}


@end
