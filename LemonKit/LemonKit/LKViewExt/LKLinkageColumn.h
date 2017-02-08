//
//  LKLinkageColumn.h
//  LemonKit
//
//  Created by 1em0nsOft on 2017/2/8.
//  Copyright © 2017年 Lemonsoft. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LKLinkageItem;

@interface LKLinkageColumn : UITableView <UITableViewDelegate, UITableViewDataSource>

/**
 存储项目item的数组
 */
@property (nonatomic,strong,readonly) NSMutableArray<LKLinkageItem *> *items;

@end
