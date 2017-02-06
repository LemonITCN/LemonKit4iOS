//
//  NSString+LKLocalStr.m
//  LemonKit
//
//  Created by Lemonsoft on 2017/1/22.
//  Copyright © 2017年 Lemonsoft. All rights reserved.
//

#import "NSString+LKLocalStr.h"
#import "NSDictionary+LK.h"
#import "LKNameConst.h"
#import "LKLogConst.h"

@implementation NSString (LKLocalStr)

static NSDictionary *_lk_stringsFileMap;

+ (NSString *)stringWithLKLocalString: (NSString *)stringKey{
    if (!_lk_stringsFileMap) {
        _lk_stringsFileMap = [NSDictionary dictionaryWithMainBundlePlistName: LK_NAME_STRINGS_FILE_MAPPING];
        if (!_lk_stringsFileMap)
            return nil;
    }
    NSArray *stringKeyComponents = [stringKey componentsSeparatedByString: @"_"];
    if (stringKeyComponents.count < 2) {// 按照下划线拆分后，得到的数组小于2，说明格式不正确
        LKInfoLog(@"Sorry, your incoming key does not conform to the specification.");
        return nil;
    }
    NSString *fileKey = stringKeyComponents[0];// 根据下划线分割，取第一部分
    NSString *fileName = _lk_stringsFileMap[fileKey];
    if (!fileName) {// mapping plist文件里面没有配置这个key对应的strings文件
        LKInfoLog(@"Sorry, your mapping plist file does not contain the file key!");
        return nil;
    }
    return NSLocalizedStringFromTable(stringKey, fileName, nil);
}

@end
