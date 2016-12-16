//
//  LKUIViewController.m
//  LemonKit
//
//  Created by 1em0nsOft on 2016/11/25.
//  Copyright © 2016年 Lemonsoft. All rights reserved.
//

#import "LKUIViewController.h"

@interface LKUIViewController ()

@end

@implementation LKUIViewController{
    BOOL _beFirst;
}

// 系统的返回按钮图片存放静态变量
static UIImage *_lk_sys_backIndicatorImage;

- (instancetype)init{
    self = [super init];
    if (self) {
        self->_beFirst = YES;// 初始化设置为yes，表示当时还没有第一次显示
        self->_lkNavigationBar = [[UINavigationBar alloc] initWithFrame: CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, LK_NAVIGATION_BAR_HEIGHT)];
        self->_lkNavigationItem = [[UINavigationItem alloc] init];
        self->_lkNavigationBar.items = @[self->_lkNavigationItem];
        self.view.backgroundColor = [UIColor whiteColor];// 设置LKViewController默认背景颜色是白色
        [self.view addSubview: self->_lkNavigationBar];
        
        [self initBaseInfo];
    }
    return self;
}

- (void)initBaseInfo{};
- (void)firstViewDidAppear: (BOOL)animated{}
- (void)initView{};
- (void)initData{};
- (void)initEvent{};

- (void)viewDidLoad{
    [super viewDidLoad];
    [self initView];
    [self initData];
    [self initEvent];
}

/**
 获取系统的返回按钮图片

 @return 系统的返回按钮图片
 */
- (UIImage *)getSystemBarBackIndicatorImage{
    if (_lk_sys_backIndicatorImage == nil){
        for (UIView *view in self.navigationController.navigationBar.subviews) {
            if ([[[view class] description] isEqualToString: @"_UINavigationBarBackIndicatorView"]){
                _lk_sys_backIndicatorImage = [((UIImageView *) view).image copy];
            }
        }
    }
    return _lk_sys_backIndicatorImage;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear: animated];
    if (self.navigationController && self.navigationController.viewControllers.count > 1) {
        //缩减左侧距离，让返回按钮向左偏移
        UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithImage: [self getSystemBarBackIndicatorImage] style: UIBarButtonItemStylePlain target: self action: @selector(_lk_back)];
        UIBarButtonItem *nagetiveSpacer = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
        nagetiveSpacer.width = -10;// 向左的偏移值
        self.lkNavigationItem.leftBarButtonItems = @[nagetiveSpacer, backItem];
        self.lkNavigationBar.tintColor = [UIColor blackColor];
    }
}

- (void)_lk_back{
    [self.navigationController popViewControllerAnimated: YES];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    if (_beFirst) {
        [self firstViewDidAppear: animated];
        self->_beFirst = NO;
        // 让全屏能够侧滑返回
        id target = self.navigationController.interactivePopGestureRecognizer.delegate;
        UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:target action:@selector(handleNavigationTransition:)];// 初始化手势，传入系统侧滑API
        panGesture.delegate = self; // 设置手势代理，拦截手势触发
        [self.view addGestureRecognizer:panGesture];
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;// 禁止系统自带的滑动手势
    }
}

- (void)setTitle:(NSString *)title{
    [super setTitle:title];
    self->_lkNavigationItem.title = title;
}

- (void)presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion{
    [super presentViewController: viewControllerToPresent animated: flag completion: completion];
    LKInfoLog(@"Present ViewController success!");
}

// 作用：拦截手势触发
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    // 根视图控制器，不可以侧滑返回，所以不能使其触发手势
    if(self.navigationController.childViewControllers.count == 1){
        return NO;
    }
    return YES;
}

@end
