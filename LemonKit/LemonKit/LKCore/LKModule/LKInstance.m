//
//  LKInstance.m
//  LemonKit
//
//  Created by Lemonsoft on 2017/1/22.
//  Copyright © 2017年 Lemonsoft. All rights reserved.
//

#import "LKInstance.h"
#import "NSDictionary+LK.h"
#import "LKNameConst.h"

#pragma LKInstancePool area

@interface LKInstancePool(){
    NSMapTable<NSString *,id> *_instancePool;
}

@end

@implementation LKInstancePool

- (instancetype)init{
    if (self = [super init]) {
        self->_instancePool = [NSMapTable strongToWeakObjectsMapTable];
    }
    return self;
}

+ (LKInstancePool *)defaultPool{
    return [LKInstance pool];
}

// 增、改
- (void)putWithKey: (NSString *)key value: (id)value{
    [self->_instancePool setObject: value forKey: key];
}

// 增、改，通过字典批量操作
- (void)putWithDictionary: (NSDictionary<NSString *,id> *)dictionary{
    for (NSString *key in dictionary.allKeys)
        [self->_instancePool setObject: dictionary[key] forKey:key];
}

// 删
- (void)removeWithKey: (NSString *)key{
    [self->_instancePool removeObjectForKey: key];
}

// 删，通过数组批量删除
- (void)removeWithKeysArray: (NSArray<NSString *> *)keysArray{
    for (NSString *key in keysArray)
        [self->_instancePool removeObjectForKey: key];
}

// 查
- (id)objectForKey: (NSString *)key{
    return [self->_instancePool objectForKey: key];
}

// 清空
- (void)clear{
    [self->_instancePool removeAllObjects];
}

@end

#pragma LKInstance area

@implementation LKInstance

static NSDictionary *_lk_viewControllerMap;
static LKInstancePool *_lk_insPool;

+ (LKInstancePool *)pool{
    if (!_lk_insPool) {
        _lk_insPool = [[LKInstancePool alloc] init];
    }
    return _lk_insPool;
}

+ (Class)findClass: (NSString *)className{
    return NSClassFromString(className);
}

+ (id)findClassInstance: (NSString *)className{
    return [[NSClassFromString(className) alloc] init];
}

+ (UIViewController *)findViewController: (NSString *)viewControllerClasName{
    return (UIViewController *)[self findClassInstance: viewControllerClasName];
}

+ (UIViewController *)findViewControllerWithKey: (NSString *)keyString{
    if (!_lk_viewControllerMap) {// 映射关系字典还没有被创建，开始创建
        _lk_viewControllerMap = [NSDictionary dictionaryWithMainBundlePlistName: LK_NAME_VIEW_CONTROLLER_MAPPING];
        if (!_lk_viewControllerMap)
            return nil;
    }
    NSString *vcClassName = _lk_viewControllerMap[keyString];
    if (vcClassName == nil) {
        NSLog(@"Sorry, the viewController key not found -> %@" , keyString);
        return nil;
    }
    return LKInstanceFindViewController(vcClassName);
}

@end
