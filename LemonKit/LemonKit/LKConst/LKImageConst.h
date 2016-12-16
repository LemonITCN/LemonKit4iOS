//
//  LKImageConst.h
//  LemonKit
//
//  Created by 1em0nsOft on 2016/12/8.
//  Copyright © 2016年 Lemonsoft. All rights reserved.
//

#ifndef LKImageConst_h
#define LKImageConst_h

/**
 根据图片的名称获取图片对象

 @param name 图片的名称
 @return 图片对象
 */
#define LKImageNamed(name) [UIImage imageNamed: name]

/**
 根据图片的名称获取不渲染TintColor的图片对象

 @param name 图片的名称
 @return 图片对象
 */
#define LKImageNamedNoRenderTintColor(name) [[UIImage imageNamed: name] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]

#endif /* LKImageConst_h */
