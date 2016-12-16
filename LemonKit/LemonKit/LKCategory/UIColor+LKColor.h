//
//  UIColor+LKColor.h
//  LemonKit
//
//  Created by 1em0nsOft on 2016/12/8.
//  Copyright © 2016年 Lemonsoft. All rights reserved.
//

#import <UIKit/UIKit.h>


/**
 根据颜色值来创建颜色，颜色值范围为0-255，透明度为0-1的小数

 @param red 红色颜色值
 @param green 绿色颜色值
 @param blue 蓝色颜色值
 @param alpha 透明度值
 @return 生成的颜色对象
 */
#define LKColorMake(red , green , blue , alpha) [UIColor colorWithRed: red / 255.0 green: green / 255.0 blue: blue / 255.0 alpha: alpha]

/**
 根据颜色值来创建颜色，颜色值和透明度的范围都是0-1的小数

 @param red 红色的颜色值
 @param green 绿色的颜色值
 @param blue 蓝色的颜色值
 @param alpha 透明度值
 @return 生成的颜色对象
 */
#define LKColorMakeWithFloat(red , green , blue , alpha) [UIColor colorWithRed: red green: green blue: blue alpha: alpha]

/**
 根据颜色值来生成不透明的颜色，颜色值范围为0-255

 @param red 红色的颜色值
 @param green 绿色的颜色值
 @param blue 蓝色的颜色值
 @return 生成的颜色对象
 */
#define LKColorMakeNoTransprant(red , green , blue) [UIColor colorWithRed: red / 255.0 green: green / 255.0 blue: blue / 255.0 alpha: 1]


/**
 根据十六进制的字符串来生成颜色对象
 支持@“#123456”、 @“0X123456”、 @“123456”三种格式
 颜色值范围0-1的小数

 @param hexString 十六进制颜色值字符串
 @param alpha 透明度的值
 @return 生成的颜色对象
 */
#define LKColorMakeWithHexString(hexString , alpha) [UIColor colorWithHexString: hexString alpha: alpha]

/**
 根据十六进制的字符串来生成不透明的颜色对象
 支持@“#123456”、 @“0X123456”、 @“123456”三种格式

 @param hexString 十六进制颜色值字符串
 @return 生成的颜色对象
 */
#define LKColorMakeWithHexStringNoTransparent(hexString) [UIColor colorWithHexString: hexString]

@interface UIColor (LKColor)

/**
 从十六进制字符串生成颜色，透明度保持1

 @param color 颜色值字符串
 @return 颜色对象
 */
+ (UIColor *)colorWithHexString:(NSString *)color;

/**
 从十六进制字符串获取颜色
 支持@“#123456”、 @“0X123456”、 @“123456”三种格式

 @param color 颜色值字符串
 @param alpha 透明度
 @return 颜色对象
 */
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

@end
