//
//  LKLogConst.h
//  LemonKit
//
//  Created by 1em0nsOft on 16/8/29.
//  Copyright © 2016年 Lemonsoft. All rights reserved.
//

#ifndef LKLogConst_h
#define LKLogConst_h

#import <Foundation/Foundation.h>

#ifdef DEBUG
/**
 *  @author 1em0nsOft LiuRi
 *  @date 2016-08-29 17:08:41
 *
 *  @brief 能够打印输出信息的Log函数
 *
 *  @param format 输出的字符串格式
 *  @param ...    附加的参数
 */
#define LKLog(format, ...) do {fprintf(stderr, "🍋");fprintf(stderr, "<%s : %d> %s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String],__LINE__, __func__);(NSLog)((format), ##__VA_ARGS__);fprintf(stderr, "\n");} while (0)
#else
#define LKLog(...)
#endif

#ifdef DEBUG
/**
 *  @author 1em0nsOft LiuRi
 *  @date 2016-08-29 17:08:41
 *
 *  @brief LemonKit内部调用的log函数，通常只是输出信息，而不带有方法和代码行数等信息
 *
 *  @param format 输出的字符串格式
 *  @param ...    附加的参数
 */
#define LKInfoLog(format, ...) do {fprintf(stderr, "🍋");(NSLog)((format), ##__VA_ARGS__);fprintf(stderr, "\n");} while (0)
#else
#define LKInfoLog(...)
#endif

/**
 *  @author 1em0nsOft LiuRi
 *  @date 2016-08-29 17:08:55
 *
 *  @brief 控制台输出CGRect的信息
 *
 *  @param rect 要输出信息的CGRect
 */
#define LKLog_cgRect(rect) LKLog(@"%s W:%.4f, Y:%.4f, W:%.4f, H:%.4f", #rect, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height)

/**
 *  @author 1em0nsOft LiuRi
 *  @date 2016-08-29 17:08:55
 *
 *  @brief 控制台输出CGSize的信息
 *
 *  @param rect 要输出信息的CGSize
 */
#define LKLog_cgSize(size) LKLog(@"%s W:%.4f, H:%.4f", #size, size.width, size.height)

/**
 *  @author 1em0nsOft LiuRi
 *  @date 2016-08-29 17:08:55
 *
 *  @brief 控制台输出CGPoint的信息
 *
 *  @param rect 要输出信息的CGPoint
 */
#define LKLog_cgPoint(point) LKLog(@"%s X:%.4f, Y:%.4f", #point, point.x, point.y)

#endif /* LKLogConst_h */
