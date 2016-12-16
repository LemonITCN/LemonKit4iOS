//
//  LKColorConst.h
//  LemonKit
//
//  Created by 1em0nsOft on 16/8/29.
//  Copyright © 2016年 1em0nsOft. All rights reserved.
//

#ifndef LKColorConst_h
#define LKColorConst_h

/**
 *  @author 1em0nsOft LiuRi
 *  @date 2016-08-29 17:08:21
 *
 *  @brief 快速的创建颜色对象UIColor
 *
 *  @param r 红色
 *  @param g 绿色
 *  @param b 蓝色
 *  @param a 透明度
 *
 *  @return 创建出的UIColor
 */
#define LKUIColorMake(r, g, b, a) [UIColor colorWithRed:r%255/255.0 green:g%255/255.0 blue:b%255/255.0 alpha:a]

#endif /* LKColorConst_h */
