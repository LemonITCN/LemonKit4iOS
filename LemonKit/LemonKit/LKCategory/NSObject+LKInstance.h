//
//  NSObject+LKInstance.h
//  LemonKit
//
//  Created by 1em0nsOft on 2016/11/30.
//  Copyright © 2016年 Lemonsoft. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 根据指定的类名称字符串获取类
 
 @param className 类名称的字符串
 @return 类的信息对象
 */
#define LKFindClass(n) [self lkFindClass: n]

/**
 根据指定的类名称字符串生成对应类的实例对象
 
 @param className 类名称的字符串
 @return 类的实例化对象
 */
#define LKFindClassInstance(n) [self lkFindClassInstance: n]

/**
 根据视图控制器的名称直接获取视图控制器对象
 注意，自动实例化的构造方法都是调用的无参数构造方法
 
 @param viewControllerClasName 视图控制器的类的名称字符串
 @return 视图控制器的实例对象
 */
#define LKFindViewController(vn) [self lkFindViewController: vn]

/**
 根据视图控制器的key直接获取视图控制器对象
 注意，自动实例化的构造方法都是调用的无参数构造方法
 特别要求：本方法为使用LKViewControllerMapping.plist文件做映射关系时候使用，无此文件可能会引起错误
 
 @param keyString 视图控制器的类的key字符串
 @return 视图控制器的实例对象
 */
#define LKFindViewControllerWithKey(k) [self lkFindViewControllerWithKey: k]

/**
 快速获取指定对象的实例的扩展类别
 */
@interface NSObject (LKInstance)

/**
 根据指定的类名称字符串获取类

 @param className 类名称的字符串
 @return 类的信息对象
 */
- (Class)lkFindClass: (NSString *)className;

/**
 根据指定的类名称字符串生成对应类的实例对象
 注意，自动实例化的构造方法都是调用的无参数构造方法

 @param className 类名称的字符串
 @return 类的实例化对象
 */
- (id)lkFindClassInstance: (NSString *)className;

/**
 根据视图控制器的名称直接获取视图控制器对象
 注意，自动实例化的构造方法都是调用的无参数构造方法

 @param viewControllerClasName 视图控制器的类的名称字符串
 @return 视图控制器的实例对象
 */
- (UIViewController *)lkFindViewController: (NSString *)viewControllerClasName;

/**
 根据视图控制器的key直接获取视图控制器对象
 注意，自动实例化的构造方法都是调用的无参数构造方法
 特别要求：本方法为使用LKViewControllerMapping.plist文件做映射关系时候使用，无此文件可能会引起错误
 
 @param keyString 视图控制器的类的key字符串
 @return 视图控制器的实例对象
 */
- (UIViewController *)lkFindViewControllerWithKey: (NSString *)keyString;

@end
