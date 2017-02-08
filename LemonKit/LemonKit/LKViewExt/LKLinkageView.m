//
//  LKLinkageView.m
//  LemonKit
//
//  Created by 1em0nsOft on 2017/2/7.
//  Copyright © 2017年 Lemonsoft. All rights reserved.
//

#import "LKLinkageView.h"
#import "LKLinkageItem.h"

@implementation LKLinkageView

- (instancetype)init{
    if (self = [super init]) {
        self->_rootItems = [NSMutableArray new];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame: frame]) {
        self->_rootItems = [NSMutableArray new];
    }
    return self;
}

- (void)refresh{
    
}

@end
