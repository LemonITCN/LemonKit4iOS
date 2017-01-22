//
//  LKInstance.m
//  LemonKit
//
//  Created by Lemonsoft on 2017/1/22.
//  Copyright © 2017年 Lemonsoft. All rights reserved.
//

#import "LKInstance.h"
#import "NSDictionary+LK.h"

@implementation LKInstance

static NSDictionary *_lk_viewControllerMap;

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
