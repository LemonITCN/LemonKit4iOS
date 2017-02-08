//
//  UIColor+LKColor.m
//  LemonKit
//
//  Created by 1em0nsOft on 2016/12/8.
//  Copyright © 2016年 Lemonsoft. All rights reserved.
//

#import "UIColor+LKColor.h"
#import "LKConfigTool.h"
#import "LKNameConst.h"

@implementation UIColor (LKColor)

+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha {
    // 删除字符串中的空格
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    // 字符串必须要6或者8位
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    //如果是0x开头的，那么截取字符串，字符串从索引为2的位置开始，一直到末尾
    if ([cString hasPrefix:@"0X"]) {
        cString = [cString substringFromIndex:2];
    }
    //如果是#开头的，那么截取字符串，字符串从索引为1的位置开始，一直到末尾
    if ([cString hasPrefix:@"#"]) {
        cString = [cString substringFromIndex:1];
    }
    if ([cString length] != 6) {
        return [UIColor clearColor];
    }
    // 截断字符串
    NSRange range;
    range.location = 0;
    range.length = 2;
    // 红色
    NSString *rString = [cString substringWithRange:range];
    // 绿色
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    // 蓝色
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((float)r / 255.0f) green:((float)g / 255.0f) blue:((float)b / 255.0f) alpha:alpha];
}

//默认alpha值为1
+ (UIColor *)colorWithHexString:(NSString *)color {
    return [self colorWithHexString:color alpha:1.0f];
}

// 生成随机颜色
+ (UIColor *)randomColor{
    return [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0];
}


/**
 返回主题色
 若使用此功能必须配置了LKApp.plist文件并设置了ThemeColor字段
 否则返回白色

 @return 主题色对象
 */
+ (UIColor *)themeColor{
    return [UIColor colorWithHexString: [LKConfigTool lkApp][LK_THEME_COLOR]];
}

@end
