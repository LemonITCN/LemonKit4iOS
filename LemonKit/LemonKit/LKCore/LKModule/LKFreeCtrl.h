//
//  LKFreeCtrl.h
//  LemonKit
//
//  Created by 1em0nsOft on 2016/12/20.
//  Copyright © 2016年 Lemonsoft. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface LKFreeCtrl : NSObject

/**
 LK自由控制 - 在指定的NavigationController中push一个新的ViewController
 
 @param viewController 要push出的viewController对象
 @param inNavigationController 要push新ViewController的NavigationController
 @param animated 是否使用动画
 */
+ (void) pushViewController: (UIViewController *)viewController
     inNavigationController: (UINavigationController *)inNavigationController
                   animated: (BOOL)animated;


/**
 LK自由控制 - 在指定的ViewController基础上present一个新的ViewController
 
 @param viewController 要present出的ViewController对象
 @param onViewController 基础viewController
 @param animated 是否使用动画
 @param completion 在present之后的回调block
 */
+ (void)presentViewController: (UIViewController *)viewController
             onViewController: (UIViewController *)onViewController
                     animated: (BOOL)animated
                   completion: (void (^)(void))completion;

/**
 LK自由控制 - 在当前应用的顶层ViewController基础上push一个新的ViewController
 
 @param viewController 要push出的viewController对象
 @param animated 是否使用动画
 */
+ (void)pushViewController: (UIViewController *)viewController
                            animated: (BOOL)animated;

/**
 LK自由控制 - 在当前应用的顶层ViewController基础上present一个新的ViewController
 
 @param viewController 要present出的ViewController对象
 @param animated 是否使用动画
 @param completion 在present之后的回调block
 */
+ (void)presentViewController: (UIViewController *)viewController
                     animated: (BOOL)animated
                   completion: (void (^)(void))completion;

/**
 LK自由控制 - 在当前应用的顶层ViewController基础上使用动画push一个新的ViewController
 
 @param viewController 要push出的viewController对象
 */
+ (void)pushViewController: (UIViewController *)viewController;

/**
 LK自由控制 - 在当前应用的顶层ViewController基础上使用动画present一个新的ViewController
 
 @param viewController 要present出的ViewController对象
 @param completion 在present之后的回调block
 */
+ (void)presentViewController: (UIViewController *)viewController
                   completion: (void (^)(void))completion;

/**
 LK自由控制 - 在当前应用的顶层ViewController基础上使用动画present一个新的ViewController
 
 @param viewController 要present出的ViewController对象
 */
+ (void)presentViewController: (UIViewController *)viewController;

/**
 LK自由控制 调用顶层ViewController的pop，返回上一层
 
 @param animated 是否使用动画
 */
+ (void)popViewControllerAnimated: (BOOL)animated;

/**
 LK自由控制 使用动画pop到上一层
 */
+ (void)popViewController;

/**
 LK自由控制 调用顶层ViewController的popToRoot，回到层
 
 @param animated 是否使用动画
 */
+ (void)popToRootViewControllerAnimated: (BOOL)animated;

/**
 LK自由控制 使用动画pop到root层
 */
+ (void)popToRootViewController;

/**
 LK自由控制 - 获取当前应用中最顶层显示的ViewController
 
 @return 顶层的ViewController对象
 */
+ (UIViewController *)getTopViewController;

@end
