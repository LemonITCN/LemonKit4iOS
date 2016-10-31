//
//  LKBubbleInfo.m
//  LemonKit
//
//  Created by 1em0nsOft on 16/9/12.
//  Copyright © 2016年 1em0nsOft. All rights reserved.
//

#import "LKBubbleInfo.h"

@implementation LKBubbleInfo

- (instancetype)init{
    self = [super init];
    if (self) {
        self.bubbleSize = CGSizeMake(180, 120);
        self.cornerRadius = 8;
        self.layoutStyle = BUBBLE_LAYOUT_STYLE_ICON_TOP_TITLE_BOTTOM;
        self.iconAnimation = nil;
        self.onProgressChanged = nil;
        self->_iconArray = nil;
        self->_title = @"LKBubble";
        self.frameAnimationTime = 0.1;
        self.proportionOfIcon = 0.675;
        self.proportionOfSpace = 0.1;
        self.proportionOfPadding = CGPointMake(0.1, 0.1);
        self.locationStyle = BUBBLE_LOCATION_STYLE_CENTER;
        self.proportionOfDeviation = 0;
        self.isShowMaskView = YES;
        self->_maskColor = [UIColor colorWithRed: 0.1 green: 0.1 blue:0.1 alpha:0.2];
        self->_backgroundColor = [UIColor colorWithRed: 0  green: 0 blue: 0 alpha: 0.8];
        self->_iconColor = [UIColor whiteColor];
        self->_titleColor = [UIColor whiteColor];
        self.titleFontSize = 13;
        
        // 生成随机的key
        self->_key = arc4random();
    }
    return self;
}

- (instancetype)initWithTitle: (NSString *)title icon: (UIImage *)icon{
    self = [self init];
    if (self) {
        self->_title = title;
        self->_iconArray = @[icon];
    }
    return self;
}

- (CGRect)calBubbleViewFrame{
    CGFloat y;
    switch (self.locationStyle) {
        case BUBBLE_LOCATION_STYLE_TOP:
            y = 0;
            break;
        case BUBBLE_LOCATION_STYLE_CENTER:
            y = ([UIScreen mainScreen].bounds.size.height - self.bubbleSize.height) / 2;
            break;
        default:
            y = [UIScreen mainScreen].bounds.size.height - self.bubbleSize.height;
            break;
    }
    y += (self.locationStyle != BUBBLE_LOCATION_STYLE_BOTTOM ? 1 : -1) * (self.proportionOfDeviation * [UIScreen mainScreen].bounds.size.height);
    return CGRectMake(([UIScreen mainScreen].bounds.size.width - self.bubbleSize.width) / 2, y, self.bubbleSize.width, self.bubbleSize.height);
}

- (CGRect)calIconViewFrame{
    CGSize bubbleContentSize = CGSizeMake(self.bubbleSize.width * (1 - self.proportionOfPadding.x * 2),
                                          self.bubbleSize.height * (1 - self.proportionOfPadding.y * 2));
    CGFloat baseX = self.bubbleSize.width * self.proportionOfPadding.x;
    CGFloat baseY = self.bubbleSize.height * self.proportionOfPadding.y;
    CGFloat iconWidth = self.layoutStyle == BUBBLE_LAYOUT_STYLE_ICON_TOP_TITLE_BOTTOM || self.layoutStyle == BUBBLE_LAYOUT_STYLE_ICON_ONLY || self.layoutStyle == BUBBLE_LAYOUT_STYLE_ICON_BOTTOM_TITLE_TOP ?
    bubbleContentSize.height * self.proportionOfIcon :
    bubbleContentSize.height * self.proportionOfIcon;
    CGRect iconFrame = CGRectMake(baseX, baseY+ (bubbleContentSize.height - iconWidth) / 2, iconWidth, iconWidth);
    switch (self.layoutStyle) {
        case BUBBLE_LAYOUT_STYLE_ICON_TOP_TITLE_BOTTOM:
            iconFrame.origin.x += (bubbleContentSize.width - iconWidth) / 2;
            iconFrame.origin.y = baseY;
            break;
        case BUBBLE_LAYOUT_STYLE_ICON_BOTTOM_TITLE_TOP:
            iconFrame.origin.x += (bubbleContentSize.width - iconWidth) / 2;
            iconFrame.origin.y = baseY + bubbleContentSize.height - iconWidth;
            break;
        case BUBBLE_LAYOUT_STYLE_ICON_RIGHT_TITLE_LEFT:
            iconFrame.origin.x += bubbleContentSize.width - iconWidth;
            break;
        case BUBBLE_LAYOUT_STYLE_TITLE_ONLY:
            iconFrame = CGRectMake(0, 0, 0, 0);
            break;
        case BUBBLE_LAYOUT_STYLE_ICON_ONLY:
            iconFrame.origin.x += (bubbleContentSize.width - iconWidth) / 2;
            break;
        default:
            break;
    }
    return iconFrame;
}

- (CGRect)calTitleViewFrame{
    CGRect iconFrame = [self calIconViewFrame];
    CGSize bubbleContentSize = CGSizeMake(self.bubbleSize.width * (1 - self.proportionOfPadding.x * 2),
                                          self.bubbleSize.height * (1 - self.proportionOfPadding.y * 2));
    CGFloat baseX = self.bubbleSize.width * self.proportionOfPadding.x;
    CGFloat baseY = self.bubbleSize.height * self.proportionOfPadding.y;
    CGFloat titleWidth = self.layoutStyle == BUBBLE_LAYOUT_STYLE_ICON_TOP_TITLE_BOTTOM || self.layoutStyle == BUBBLE_LAYOUT_STYLE_ICON_BOTTOM_TITLE_TOP || self.layoutStyle == BUBBLE_LAYOUT_STYLE_TITLE_ONLY ?
    bubbleContentSize.width:
    bubbleContentSize.width * (1 - self.proportionOfSpace) - iconFrame.size.width;
    CGFloat titleHeight = [self.title sizeWithAttributes: @{NSFontAttributeName : [UIFont systemFontOfSize: self.titleFontSize]}].height;
    CGRect titleFrame = CGRectMake(baseX, baseY + (bubbleContentSize.height - titleHeight) / 2, titleWidth, titleHeight);
    switch (self.layoutStyle) {
        case BUBBLE_LAYOUT_STYLE_ICON_TOP_TITLE_BOTTOM:
            titleFrame.origin.y = iconFrame.origin.y + iconFrame.size.height + bubbleContentSize.height * self.proportionOfSpace;
            break;
        case BUBBLE_LAYOUT_STYLE_ICON_LEFT_TITLE_RIGHT:
            titleFrame.origin.x = iconFrame.origin.x + iconFrame.size.width + bubbleContentSize.width * self.proportionOfSpace;
            break;
        case BUBBLE_LAYOUT_STYLE_ICON_ONLY:
            titleFrame = CGRectMake(0, 0, 0, 0);
            break;
        case BUBBLE_LAYOUT_STYLE_ICON_BOTTOM_TITLE_TOP:
            titleFrame.origin.y = baseY + (bubbleContentSize.height * (1 - self.proportionOfIcon - self.proportionOfSpace) - titleHeight) / 2;
            break;
        default:
            break;
    }
    return titleFrame;
}

@end
