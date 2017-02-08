//
//  NSString+LK.m
//  LemonKit
//
//  Created by 1em0nsOft on 2017/2/8.
//  Copyright © 2017年 Lemonsoft. All rights reserved.
//

#import "NSString+LK.h"
#import "LKUUIDTool.h"

@implementation NSString (LK)

+ (NSString *)UUID{
    return [LKUUIDTool random];
}

@end
