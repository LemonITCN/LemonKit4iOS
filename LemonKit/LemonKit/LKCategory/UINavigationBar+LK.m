//
//  UINavigationBar+LK.m
//  LemonKit
//
//  Created by 1em0nsOft on 2017/2/8.
//  Copyright © 2017年 Lemonsoft. All rights reserved.
//

#import "UINavigationBar+LK.h"
#import <objc/runtime.h>

static const void *titleColorKey = &titleColorKey;
static const void *renderingColorKey = &renderingColorKey;

@implementation UINavigationBar (LK)

- (UIColor *)titleColor{
    return objc_getAssociatedObject(self, titleColorKey);
}

- (void)setTitleColor:(UIColor *)titleColor{
    objc_setAssociatedObject(self, titleColorKey, titleColor, OBJC_ASSOCIATION_COPY_NONATOMIC);
    NSDictionary *titleAttribute = @{NSForegroundColorAttributeName : titleColor};//实例化标题文字样式描述字典
    self.titleTextAttributes = titleAttribute;//设置导航栏的标题文字样式
}

- (UIColor *)renderingColor{
    return objc_getAssociatedObject(self, renderingColorKey);
}

- (void)setRenderingColor:(UIColor *)renderingColor{
    self.tintColor = renderingColor;
    self.titleColor = renderingColor;
    objc_setAssociatedObject(self, renderingColorKey, renderingColor, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

@end
