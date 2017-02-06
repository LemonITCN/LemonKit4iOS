//
//  NSDictionary+LK.m
//  LemonKit
//
//  Created by Lemonsoft on 2017/1/22.
//  Copyright © 2017年 Lemonsoft. All rights reserved.
//

#import "NSDictionary+LK.h"
#import "LKNameConst.h"
#import "LKLogConst.h"

@implementation NSDictionary (LK)

+ (NSDictionary *)dictionaryWithMainBundlePlistName: (NSString *)plistName{
    NSString *file = [[NSBundle mainBundle] pathForResource: plistName ofType: @"plist"];
    if (file == nil){
        LKInfoLog(@"Sorry, the file [%@.plist] not found in main bundle!", plistName);
        return nil;
    }
    return [[NSDictionary alloc] initWithContentsOfFile: file];
}

@end
