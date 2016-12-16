//
//  NSObject+LKFreeCtrl.h
//  LemonKit
//
//  Created by 1em0nsOft on 2016/12/2.
//  Copyright © 2016年 Lemonsoft. All rights reserved.
//

#import <UIKit/UIKit.h>

// LK自由控制 - 在指定的NavigationController中push一个新的ViewController
#define LKFreeCtrlPushIn(vc,nav,a) [self lkFreeCtrlPushViewController: vc inNavigationController: nav animated: a]
// LK自由控制 - 在指定的ViewController基础上present一个新的ViewController
#define LKFreeCtrlPresentOn(vc,onVc,a,c) [self lkFreeCtrlPresent: vc onViewController: onVc animated: a completion: c]
// LK自由控制 - 在当前应用的顶层ViewController基础上push一个新的ViewController
#define LKFreeCtrlPush(vc,a) [self lkFreeCtrlPushViewController: vc animated: a]
// LK自由控制 - 在当前应用的顶层ViewController基础上present一个新的ViewController
#define LKFreeCtrlPressent(vc,a,c) [self lkFreeCtrlPresent: vc animated: a completion: c]
// LK自由控制 - 在当前应用的顶层ViewController基础上使用动画push一个新的ViewController
#define LKFreeCtrlAnimatePush(vc) [self lkFreeCtrlPushViewController: vc]
// LK自由控制 - 在当前应用的顶层ViewController基础上使用动画present一个新的ViewController，需要传入结束回调函数
#define LKFreeCtrlAnimatePresentWithComplete(vc,complete) [self lkFreeCtrlPresent: vc completion: c]
// LK自由控制 - 在当前应用的顶层ViewController基础上使用动画present一个新的ViewController
#define LKFreeCtrlAnimatePresent(vc) [self lkFreeCtrlPresent: vc]
// LK自由控制 - 获取当前应用中最顶层显示的ViewController
#define LKFreeCtrlGetTopVC() [self lkFreeCtrlGetTopViewController]

@interface NSObject (LKFreeCtrl)

/**
 LK自由控制 - 在指定的NavigationController中push一个新的ViewController
 
 @param viewController 要push出的viewController对象
 @param inNavigationController 要push新ViewController的NavigationController
 @param animated 是否使用动画
 */
- (void)lkFreeCtrlPushViewController:(UIViewController *)viewController inNavigationController: (UINavigationController *)inNavigationController animated:(BOOL)animated;


/**
 LK自由控制 - 在指定的ViewController基础上present一个新的ViewController

 @param viewController 要present出的ViewController对象
 @param onViewController 基础viewController
 @param animated 是否使用动画
 @param completion 在present之后的回调block
 */
- (void)lkFreeCtrlPresent: (UIViewController *)viewController onViewController: (UIViewController *)onViewController animated:(BOOL)animated completion:(void (^)(void))completion;

/**
 LK自由控制 - 在当前应用的顶层ViewController基础上push一个新的ViewController
 
 @param viewController 要push出的viewController对象
 @param animated 是否使用动画
 */
- (void)lkFreeCtrlPushViewController:(UIViewController *)viewController animated:(BOOL)animated;

/**
 LK自由控制 - 在当前应用的顶层ViewController基础上present一个新的ViewController
 
 @param viewController 要present出的ViewController对象
 @param animated 是否使用动画
 @param completion 在present之后的回调block
 */
- (void)lkFreeCtrlPresent: (UIViewController *)viewController animated:(BOOL)animated completion:(void (^)(void))completion;

/**
 LK自由控制 - 在当前应用的顶层ViewController基础上使用动画push一个新的ViewController
 
 @param viewController 要push出的viewController对象
 */
- (void)lkFreeCtrlPushViewController:(UIViewController *)viewController;

/**
 LK自由控制 - 在当前应用的顶层ViewController基础上使用动画present一个新的ViewController
 
 @param viewController 要present出的ViewController对象
 @param completion 在present之后的回调block
 */
- (void)lkFreeCtrlPresent: (UIViewController *)viewController completion:(void (^)(void))completion;

/**
 LK自由控制 - 在当前应用的顶层ViewController基础上使用动画present一个新的ViewController
 
 @param viewController 要present出的ViewController对象
 */
- (void)lkFreeCtrlPresent: (UIViewController *)viewController;

/**
 LK自由控制 - 获取当前应用中最顶层显示的ViewController

 @return 顶层的ViewController对象
 */
- (UIViewController *)lkFreeCtrlGetTopViewController;

@end
