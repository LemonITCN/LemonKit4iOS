//
//  LKActionLineView.m
//  LemonKit
//
//  Created by 1em0nsOft on 2016/9/20.
//  Copyright © 2016年 1em0nsOft. All rights reserved.
//

#import "LKActionLineView.h"

@implementation LKActionLineView

- (instancetype)initWithFrame:(CGRect)frame actionItem: (LKActionItem *)item{
    if (self = [super initWithFrame: frame]) {
        self->_item = item;
        [self addGestureRecognizer: [[UITapGestureRecognizer alloc] initWithTarget: self action: @selector(onTouchUpInside)]];
    }
    return self;
}

- (void)onTouchUpInside{
    if (self->_item.action) {
        self->_item.action(self->_item);
    }
}

@end
