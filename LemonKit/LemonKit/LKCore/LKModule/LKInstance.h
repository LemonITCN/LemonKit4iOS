//
//  LKInstance.h
//  LemonKit
//
//  Created by Lemonsoft on 2017/1/22.
//  Copyright © 2017年 Lemonsoft. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 实例对象池，可以通过key,value的形式把对象放入此弱引用池中，并通过key可以从池中取出对象
 */
@interface LKInstancePool : NSObject

/**
 获取默认的实例对象池
 实际指向的是[LKInstance pool];

 @return 默认的实例对象池
 */
+ (LKInstancePool *)defaultPool;

/**
 放置实例对象到实例对象池中

 @param key 键
 @param value 对应的实例对象
 */
- (void)putWithKey: (NSString *)key value: (id)value;

/**
 通过字典批量放置实例对象到实例对象池中

 @param dictionary 要放置到实例对象池中的多个字典
 */
- (void)putWithDictionary: (NSDictionary<NSString *,id> *)dictionary;

/**
 从实例对象池中移除指定的键值对

 @param key 要移除的实例对象的键
 */
- (void)removeWithKey: (NSString *)key;

/**
 通过数组批量从实例对象池中移除

 @param keysArray 键数组
 */
- (void)removeWithKeysArray: (NSArray<NSString *> *)keysArray;

/**
 根据键从实例对象池中取出实例·

 @param key 要取出的键
 @return 对应的实例对象
 */
- (id)objectForKey: (NSString *)key;

/**
 移除所有的实例对象键值对
 */
- (void)clear;

@end


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
 实例对象池，这是一个公共若引用对象池，可以通过key，value形式放入池中，通过key可以取出value
 */
+ (LKInstancePool *)pool;

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
