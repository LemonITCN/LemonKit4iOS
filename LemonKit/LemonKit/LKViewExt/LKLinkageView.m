//
//  LKLinkageView.m
//  LemonKit
//
//  Created by 1em0nsOft on 2017/2/7.
//  Copyright © 2017年 Lemonsoft. All rights reserved.
//

#import "LKLinkageView.h"
#import "LKLinkageItem.h"
#import "LKLinkageColumn.h"

@interface LKLinkageView()

@end

@implementation LKLinkageView

- (instancetype)init{
    if (self = [super init]) {
        [self _init];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame: frame]) {
        [self _init];
    }
    return self;
}

- (void)_init{
    self->_rootItems = [NSMutableArray new];
    self->_columns = [NSMutableArray new];
}

- (void)refresh{
    // 根据深度处理columns
    [self autoDealColumns];
}

- (void)autoDealColumns{
    NSInteger maxDeepth = 0;
    // 遍历计算深度
    for (LKLinkageItem *item in self->_rootItems)
        maxDeepth = MAX(maxDeepth, [item calculateDepth]);
    if (self->_columns.count > maxDeepth)
        // 有多余的column
        [self->_columns removeObjectsInRange: NSMakeRange(maxDeepth, self->_columns.count - maxDeepth)];
    else if (self->_columns.count < maxDeepth)
        // column不够用，补足缺少的
        for (NSInteger i = 0 ; i < maxDeepth - self->_columns.count ; i ++)
            [self->_columns addObject: [[LKLinkageColumn alloc] init]];
    // 接下来，根据当前的状态重新摆放column
    
}

@end
