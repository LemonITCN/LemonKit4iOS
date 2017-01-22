//
//  StarterViewController.m
//  LemonKit
//
//  Created by 1em0nsOft on 2016/12/16.
//  Copyright © 2016年 Lemonsoft. All rights reserved.
//

#import "StarterViewController.h"
#import "NSString+LKLocalStr.h"

@interface StarterViewController ()

@end

@implementation StarterViewController

- (void)initBaseInfo{
    self.title = @"Starter";
}

- (void)initView{
    UIView *view = [[UIView alloc] initWithFrame: CGRectMake(50,50, 100, 100)];
    view.backgroundColor = [UIColor themeColor];
    view.onTap = ^(UIView *view){
        [LKFreeCtrl pushViewController: LKFindViewController(@"MainViewController")];
    };
    [self.view addSubview: view];
}

@end
