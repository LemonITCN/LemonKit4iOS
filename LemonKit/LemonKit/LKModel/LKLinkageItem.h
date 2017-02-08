//
//  LKLinkageItem.h
//  LemonKit
//
//  Created by 1em0nsOft on 2017/2/7.
//  Copyright © 2017年 Lemonsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LKLinkageItem : NSObject

/**
 标题文字
 */
@property (nonnull,nonatomic,strong)NSString *title;
/**
 对应的编码，通常该值用来表示当前行的代码
 该值通常全局唯一
 */
@property (nonnull,nonatomic,strong)NSString *code;
/**
 当前节点的子节点数组
 */
@property (readonly,nonnull,nonatomic,strong)NSMutableArray<LKLinkageItem *> *children;

- (nonnull instancetype)initWithTitle: (nonnull NSString *)title
                                 code: (nonnull NSString *)code;

- (nonnull instancetype)initWithStandardDictionary: (nonnull NSDictionary *)dataDictionary;

- (nonnull instancetype)initWithCustomDictionary: (nonnull NSDictionary *)dataDictionary
                                titleKey: (nonnull NSString *)titleKey
                                 codeKey: (nonnull NSString *)codeKey
                             childrenKey: (nonnull NSString *)childrenKey;

/**
 计算当前树分支的最深深度
 计算深度的时候包含当前父节点所在层，因此最小值为1
 @return 大于等于1的深度层次数值
 */
- (NSInteger)calculateDepth;

@end
