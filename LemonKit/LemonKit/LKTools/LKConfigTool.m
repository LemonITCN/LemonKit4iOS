//
//  LKConfigTool.m
//  LemonKit
//
//  Created by 1em0nsOft on 2017/2/8.
//  Copyright © 2017年 Lemonsoft. All rights reserved.
//

#import "LKConfigTool.h"
#import "NSDictionary+LK.h"
#import "LKNameConst.h"

static NSDictionary *lkAppDic;

@implementation LKConfigTool

+ (NSDictionary *)lkApp{
    if (!lkAppDic)
        lkAppDic = [NSDictionary dictionaryWithMainBundlePlistName: LK_NAME_APP];
    return lkAppDic ? lkAppDic : @[];
}

@end
