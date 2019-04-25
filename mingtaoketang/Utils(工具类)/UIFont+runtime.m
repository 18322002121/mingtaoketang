//
//  UIFont+runtime.m
//  mingtaohangkong
//
//  Created by Linlin Ge on 2019/3/8.
//  Copyright © 2019年 hcy. All rights reserved.
//
#define MyUIScreen  375 // UI设计原型图的手机尺寸宽度(6), 6p的--414
#import "UIFont+runtime.h"

@implementation UIFont (runtime)
+ (void)load {
    // 获取替换后的类方法
    Method newMethod = class_getClassMethod([self class], @selector(adjustFont:));
    // 获取替换前的类方法
    Method method = class_getClassMethod([self class], @selector(systemFontOfSize:));
    // 然后交换类方法，交换两个方法的IMP指针，(IMP代表了方法的具体的实现）
    method_exchangeImplementations(newMethod, method);
}

+ (UIFont *)adjustFont:(CGFloat)fontSize {
    UIFont *newFont = nil;
    newFont = [UIFont adjustFont:fontSize * [UIScreen mainScreen].bounds.size.width/MyUIScreen];
    return newFont;
}

@end
