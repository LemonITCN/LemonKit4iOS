//
//  DemoViewController.m
//  LemonKit
//
//  Created by 1em0nsOft on 2017/2/8.
//  Copyright © 2017年 Lemonsoft. All rights reserved.
//

#import "DemoViewController.h"

@interface DemoViewController (){
    LKLinkageView *rootLinkageView;
}

@end

@implementation DemoViewController

- (void)initView{
    self->rootLinkageView = [[LKLinkageView alloc] initWithFrame: self.view.bounds];
}

@end
