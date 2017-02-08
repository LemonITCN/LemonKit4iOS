//
//  LKLinkageColumn.m
//  LemonKit
//
//  Created by 1em0nsOft on 2017/2/8.
//  Copyright © 2017年 Lemonsoft. All rights reserved.
//

#import "LKLinkageColumn.h"
#import "LKLinkageView.h"
#import "LKLinkageCell.h"
#import "LKLinkageItem.h"

@interface LKLinkageColumn(){
    LKLinkageView *_belongLinkageView;
}

@end

@implementation LKLinkageColumn
    
- (instancetype)init{
    if (self = [super init]) {
        self->_items = [NSMutableArray new];
    }
    return self;
}

- (instancetype)initWithLinkageView: (LKLinkageView *)linkageView{
    if (self = [super init]){
        self->_items = [NSMutableArray new];
        self->_belongLinkageView = linkageView;
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *IDENTIFIER = @"LK_LINKAGE_CELL";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: IDENTIFIER];
    if (!cell)
        cell = [[LKLinkageCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier: IDENTIFIER];
    return cell;
}

@end
