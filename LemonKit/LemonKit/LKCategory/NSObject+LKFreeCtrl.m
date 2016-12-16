//
//  NSObject+LKFreeCtrl.m
//  LemonKit
//
//  Created by 1em0nsOft on 2016/12/2.
//  Copyright © 2016年 Lemonsoft. All rights reserved.
//

#import "NSObject+LKFreeCtrl.h"

@implementation NSObject (LKFreeCtrl)

/**
 LK自由控制 - 在指定的NavigationController中push一个新的ViewController
 
 @param viewController 要push出的viewController对象
 @param inNavigationController 要push新ViewController的NavigationController
 @param animated 是否使用动画
 */
- (void)lkFreeCtrlPushViewController:(UIViewController *)viewController inNavigationController: (UINavigationController *)inNavigationController animated:(BOOL)animated{
    LKInfoLog(@"使用LKFreeCtrl进行了push操作： %@ - into - %@" , viewController, inNavigationController);
    if ([[self lkFreeCtrlGetTopViewController] isEqual: viewController]){
        LKInfoLog(@"要push的viewController与当前正在显示的viewController为同一对象！自动忽略操作并调用ViewDidAppear函数！");
        [viewController viewDidAppear: animated];
        return;
    }
    [inNavigationController pushViewController: viewController animated: animated];
}


/**
 LK自由控制 - 在指定的ViewController基础上present一个新的ViewController
 
 @param viewController 要present出的ViewController对象
 @param onViewController 基础viewController
 @param animated 是否使用动画
 @param completion 在present之后的回调block
 */
- (void)lkFreeCtrlPresent: (UIViewController *)viewController onViewController: (UIViewController *)onViewController animated:(BOOL)animated completion:(void (^)(void))completion{
    LKInfoLog(@"使用LKFreeCtrl进行了prersent操作： %@ - on - %@" , viewController, onViewController);
    if ([[self lkFreeCtrlGetTopViewController] isEqual: viewController]){
        LKInfoLog(@"要present的viewController与当前正在显示的viewController为同一对象！自动忽略操作并调用ViewDidAppear函数！");
        [viewController viewDidAppear: animated];
        return;
    }
    [onViewController presentViewController: viewController animated: animated completion: completion];
}

/**
 LK自由控制 - 在当前应用的顶层ViewController基础上push一个新的ViewController
 
 @param viewController 要push出的viewController对象
 @param animated 是否使用动画
 */
- (void)lkFreeCtrlPushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    [self lkFreeCtrlPushViewController: viewController inNavigationController: [self lkFreeCtrlGetTopViewController].navigationController animated: animated];
}

/**
 LK自由控制 - 在当前应用的顶层ViewController基础上present一个新的ViewController
 
 @param viewController 要present出的ViewController对象
 @param animated 是否使用动画
 @param completion 在present之后的回调block
 */
- (void)lkFreeCtrlPresent: (UIViewController *)viewController animated:(BOOL)animated completion:(void (^)(void))completion{
    [self lkFreeCtrlPresent: viewController onViewController: [self lkFreeCtrlGetTopViewController] animated:animated completion: completion];
}

/**
 LK自由控制 - 在当前应用的顶层ViewController基础上使用动画push一个新的ViewController
 
 @param viewController 要push出的viewController对象
 */
- (void)lkFreeCtrlPushViewController:(UIViewController *)viewController{
    [self lkFreeCtrlPushViewController: viewController animated: YES];
}

/**
 LK自由控制 - 在当前应用的顶层ViewController基础上使用动画present一个新的ViewController
 
 @param viewController 要present出的ViewController对象
 @param completion 在present之后的回调block
 */
- (void)lkFreeCtrlPresent: (UIViewController *)viewController completion:(void (^)(void))completion{
    [self lkFreeCtrlPresent: viewController animated: YES completion: completion];
}

/**
 LK自由控制 - 在当前应用的顶层ViewController基础上使用动画present一个新的ViewController
 
 @param viewController 要present出的ViewController对象
 */
- (void)lkFreeCtrlPresent: (UIViewController *)viewController{
    [self lkFreeCtrlPresent: viewController completion: nil];
}

/**
 获取当前应用中最顶层显示的ViewController
 
 @return 顶层的ViewController对象
 */
- (UIViewController *)lkFreeCtrlGetTopViewController{
    UIViewController *resultViewController;
    resultViewController = [self _topViewController:[[UIApplication sharedApplication].keyWindow rootViewController]];
    while (resultViewController.presentedViewController) {
        resultViewController = [self _topViewController:resultViewController.presentedViewController];
    }
    return resultViewController;
}


/**
 递归获取视图控制器

 @param viewController 递归获取视图控制器
 @return 最终获取到的顶层视图控制器
 */
- (UIViewController *)_topViewController:(UIViewController *)viewController {
    if ([viewController isKindOfClass:[UINavigationController class]]) {
        return [self _topViewController:[(UINavigationController *)viewController topViewController]];
    } else if ([viewController isKindOfClass:[UITabBarController class]]) {
        return [self _topViewController:[(UITabBarController *)viewController selectedViewController]];
    } else {
        return viewController;
    }
    return nil;
}

@end
