//
//  PublicButton.m
//  mingtaohangkong
//
//  Created by Linlin Ge on 2019/3/8.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "PublicButton.h"

@implementation PublicButton

+(PublicButton *)buttonWithImage:(NSString *)image
            backgroundImageImage:(NSString *)backgroundImageimage
                           title:(NSString *)title
                      titleColor:(UIColor *)titleColor
                        textFont:(UIFont *)font
                 backgroundColor:(UIColor *)backgroundColor
                         addView:(UIView *)view
                          target:(id)target
                          action:(SEL)action
{
    PublicButton *btn = [[PublicButton alloc] init];
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:backgroundImageimage] forState:UIControlStateNormal];
    [btn setTitle:title forState:(UIControlStateNormal)];
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    btn.titleLabel.font = font;
    btn.backgroundColor = backgroundColor;
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:btn];
    return btn;
}

@end
