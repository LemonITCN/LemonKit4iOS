//
//  NSObject+LKInstance.m
//  LemonKit
//
//  Created by 1em0nsOft on 2016/11/30.
//  Copyright © 2016年 Lemonsoft. All rights reserved.
//

#import "NSObject+LKInstance.h"
#import "LKLogConst.h"

@implementation NSObject (LKInstance)

static NSDictionary *_lk_viewControllerMap;

- (Class)lkFindClass: (NSString *)className{
    return NSClassFromString(className);
}

- (id)lkFindClassInstance: (NSString *)className{
    return [[NSClassFromString(className) alloc] init];
}

- (UIViewController *)lkFindViewController: (NSString *)viewControllerClasName{
    return (UIViewController *)[self lkFindClassInstance: viewControllerClasName];
}

- (UIViewController *)lkFindViewControllerWithKey: (NSString *)keyString{
    if (!_lk_viewControllerMap) {// 映射关系字典还没有被创建，开始创建
        NSString *keyMapPath = [[NSBundle mainBundle] pathForResource: @"LKViewControllerMapping" ofType: @"plist"];
        if (keyMapPath == nil) {
            NSLog(@"Sorry, the ‘LKViewControllerMapping.plist’ not found in main bundle!");
            return nil;
        }
        _lk_viewControllerMap = [[NSDictionary alloc] initWithContentsOfFile: keyMapPath];
    }
    NSString *vcClassName = _lk_viewControllerMap[keyString];
    if (vcClassName == nil) {
        NSLog(@"Sorry, the viewController key not found -> %@" , keyString);
        return nil;
    }
    return LKFindViewController(vcClassName);
}

@end
