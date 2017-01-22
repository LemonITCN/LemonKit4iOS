//
//  LKInstance.h
//  LemonKit
//
//  Created by Lemonsoft on 2017/1/22.
//  Copyright © 2017年 Lemonsoft. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 根据指定的类名称字符串获取类
 
 @param className 类名称的字符串
 @return 类的信息对象
 */
#define LKInstanceFindClass(n) [LKInstance findClass: n]

/**
 根据指定的类名称字符串生成对应类的实例对象
 
 @param className 类名称的字符串
 @return 类的实例化对象
 */
#define LKInstanceFindClassInstance(n) [LKInstance findClassInstance: n]

/**
 根据视图控制器的名称直接获取视图控制器对象
 注意，自动实例化的构造方法都是调用的无参数构造方法
 
 @param viewControllerClasName 视图控制器的类的名称字符串
 @return 视图控制器的实例对象
 */
#define LKInstanceFindViewController(vn) [LKInstance findViewController: vn]

/**
 根据视图控制器的key直接获取视图控制器对象
 注意，自动实例化的构造方法都是调用的无参数构造方法
 特别要求：本方法为使用LKViewControllerMapping.plist文件做映射关系时候使用，无此文件可能会引起错误
 
 @param keyString 视图控制器的类的key字符串
 @return 视图控制器的实例对象
 */
#define LKInstanceFindViewControllerWithKey(k) [LKInstance findViewControllerWithKey: k]

/**
 快速获取指定对象的实例的扩展类别
 */
@interface LKInstance : NSObject

/**
 根据指定的类名称字符串获取类
 
 @param className 类名称的字符串
 @return 类的信息对象
 */
+ (Class)findClass: (NSString *)className;

/**
 根据指定的类名称字符串生成对应类的实例对象
 注意，自动实例化的构造方法都是调用的无参数构造方法
 
 @param className 类名称的字符串
 @return 类的实例化对象
 */
+ (id)findClassInstance: (NSString *)className;

/**
 根据视图控制器的名称直接获取视图控制器对象
 注意，自动实例化的构造方法都是调用的无参数构造方法
 
 @param viewControllerClasName 视图控制器的类的名称字符串
 @return 视图控制器的实例对象
 */
+ (UIViewController *)findViewController: (NSString *)viewControllerClasName;

/**
 根据视图控制器的key直接获取视图控制器对象
 注意，自动实例化的构造方法都是调用的无参数构造方法
 特别要求：本方法为使用LKViewControllerMapping.plist文件做映射关系时候使用，无此文件可能会引起错误
 
 @param keyString 视图控制器的类的key字符串
 @return 视图控制器的实例对象
 */
+ (UIViewController *)findViewControllerWithKey: (NSString *)keyString;

@end
