//
//  LKLinkageItem.m
//  LemonKit
//
//  Created by 1em0nsOft on 2017/2/7.
//  Copyright © 2017年 Lemonsoft. All rights reserved.
//

#import "LKLinkageItem.h"
#import "NSString+LKLocalStr.h"

@implementation LKLinkageItem

- (instancetype)init{
    if (self = [super init]) {
        self.title = @"";
        self.code = [NSString stringWithFormat: @"%d", arc4random()];
        self->_children = [NSMutableArray new];
    }
    return self;
}

- (instancetype)initWithTitle: (NSString *)title
                         code: (NSString *)code{
    if (self = [super init]) {
        self.title = title;
        self.code = code;
        self->_children = [NSMutableArray new];
    }
    return self;
}

- (instancetype)initWithStandardDictionary: (NSDictionary *)dataDictionary{
    if (self = [self initWithCustomDictionary: dataDictionary
                                     titleKey: @"title"
                                      codeKey: @"code"
                                  childrenKey: @"children"]) {
    }
    return self;
}

- (instancetype)initWithCustomDictionary: (NSDictionary *)dataDictionary
                                titleKey: (NSString *)titleKey
                                 codeKey: (NSString *)codeKey
                             childrenKey: (NSString *)childrenKey{
    if (self = [super init]) {
        self.title = dataDictionary[titleKey];
        self.code = dataDictionary[codeKey];
        self->_children = [NSMutableArray new];
        for (NSDictionary *dic in dataDictionary[childrenKey]) {
            [self.children addObject:
             [[LKLinkageItem alloc] initWithCustomDictionary: dic
                                                    titleKey: titleKey
                                                     codeKey: codeKey
                                                 childrenKey: childrenKey]];
        }
    }
    return self;
}

- (void)setTitle:(NSString *)title{
    self->_title = LKLocalStr(title);
}

// 递归调用计算深度
- (NSInteger)calculateDepth{
    NSInteger depth = self.children.count > 0 ? 2 : 1;
    for (LKLinkageItem *item in self->_children) {
        depth = MAX(depth, [item calculateDepth] + 1);
    }
    return depth;
}

@end
