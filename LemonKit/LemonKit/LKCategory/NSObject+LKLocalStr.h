//
//  NSObject+LKLocalStr.h
//  LemonKit
//
//  Created by 1em0nsOft on 2016/12/6.
//  Copyright © 2016年 Lemonsoft. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 快速拾取本地的国际化字符串

 @param strKey 字符串的key（需要按照fileKey_strName的方式命名）
 @return 本地国际化的结果字符串
 */
#define LKLocalStr(strKey) [self getLKLocalString: strKey]

/**
 从本地化字符串文件中中查询指定的字符串
 使用本类来快速拾取字符串必须要配置LKStringsFileMapping.plist文件
 LKStringFileMapping.plist里面需要按照：key: fileTag value: fileName的形式配置文件映射关系
 使用本类来拾取的字符串的key必须要按照指定格式来编写：fileTag_strName
 
 举例：
 文件名：MainTab.strings
 LKStringFileMapping.plist 里面添加键值对：   key: mt  value: MainTab
 strings文件中添加字符串键值对：       mt_tab1
 */
@interface NSObject (LKLocalStr)

/**
 拾取指定Key对应的字符串

 @param stringKey 字符串的key
 @return 对应的本地化字符串
 */
- (NSString *)getLKLocalString: (NSString *)stringKey;

@end
