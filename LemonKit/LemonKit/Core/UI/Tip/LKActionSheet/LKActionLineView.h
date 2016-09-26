//
//  LKActionLineView.h
//  LemonKit
//
//  Created by 1em0nsOft on 2016/9/20.
//  Copyright © 2016年 1em0nsOft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LKActionItem.h"

@interface LKActionLineView : UIView

@property LKActionItem *item;

/**
 通过事件行的frame和事件行对象初始化事件行控件

 @param frame frame对象
 @param item  事件行信息对象

 @return 事件行控件
 */
- (instancetype)initWithFrame:(CGRect)frame actionItem: (LKActionItem *)item;

@end
