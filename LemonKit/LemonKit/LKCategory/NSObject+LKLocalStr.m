//
//  NSObject+LKLocalStr.m
//  LemonKit
//
//  Created by 1em0nsOft on 2016/12/6.
//  Copyright © 2016年 Lemonsoft. All rights reserved.
//

#import "NSObject+LKLocalStr.h"

@implementation NSObject (LKLocalStr)

static NSDictionary *_lk_stringsFileMap;


- (NSString *)getLKLocalString: (NSString *)stringKey{
    if (!_lk_stringsFileMap) {
        NSString *keyMapPath = [[NSBundle mainBundle] pathForResource: @"LKStringsFileMapping" ofType: @"plist"];
        if (keyMapPath == nil) {
            LKInfoLog(@"Sorry, the ‘LKStringsFileMapping.plist’ not found in main bundle!");
            return nil;
        }
        _lk_stringsFileMap = [[NSDictionary alloc] initWithContentsOfFile: keyMapPath];
    }
    NSArray *stringKeyComponents = [stringKey componentsSeparatedByString: @"_"];
    if (stringKeyComponents < 2) {// 按照下划线拆分后，得到的数组小于2，说明格式不正确
        LKInfoLog(@"Sorry, your incoming key does not conform to the specification.");
        return nil;
    }
    NSString *fileKey = stringKeyComponents[0];// 根据下划线分割，取第一部分
    NSString *fileName = _lk_stringsFileMap[fileKey];
    if (!fileName) {// mapping plist文件里面没有配置这个key对应的strings文件
        LKInfoLog(@"Sorry, your mapping plist file does not contain the file key!");
        return nil;
    }
    NSLog(@"%@ >>> %@" , stringKey , fileName);
    return NSLocalizedStringFromTable(stringKey, fileName, nil);
}

- (void)initStringsFileMap{
    
}

@end
