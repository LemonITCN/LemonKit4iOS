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

- (void)firstViewDidAppear:(BOOL)animated{
    [LKFreeCtrl presentViewController: [LKInstance findViewControllerWithKey: @"m_tabRoot"]];
}

@end
