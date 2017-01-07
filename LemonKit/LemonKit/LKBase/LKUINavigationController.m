//
//  LKUINavigationController.m
//  LemonKit
//
//  Created by 1em0nsOft on 2016/11/30.
//  Copyright © 2016年 Lemonsoft. All rights reserved.
//

#import "LKUINavigationController.h"

@interface LKUINavigationController ()

@end

@implementation LKUINavigationController{
    BOOL _beFirst;
}


- (instancetype)init{
    self = [super init];
    if (self) {
        self.navigationBarHidden = YES;
        [self initBaseInfo];
    }
    return self;
}

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController{
    self = [super initWithRootViewController:rootViewController];
    if (self) {
        self.navigationBarHidden = YES;
        [self initBaseInfo];
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    [self initView];
    [self initData];
    [self initEvent];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    if (_beFirst) {
        [self firstViewDidAppear: animated];
        self->_beFirst = NO;
    }
}

- (void)initBaseInfo{};
- (void)firstViewDidAppear: (BOOL)animated{}
- (void)initView{};
- (void)initData{};
- (void)initEvent{}

@end
