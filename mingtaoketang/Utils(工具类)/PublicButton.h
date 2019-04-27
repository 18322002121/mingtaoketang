//
//  PublicButton.h
//  mingtaohangkong
//
//  Created by Linlin Ge on 2019/3/8.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef  NS_ENUM(NSInteger,UIButtonEdgeInsetsStyle){
    UIButtonEdgeInsetsStyleNormal,
    UIButtonEdgeInsetsStyleLeft,
    UIButtonEdgeInsetsStyleRight,
    UIButtonEdgeInsetsStyleTop,
    UIButtonEdgeInsetsStyleBottom
};
NS_ASSUME_NONNULL_BEGIN

@interface PublicButton : UIButton
@property (nonatomic, assign) UIButtonEdgeInsetsStyle btnStyle;

+(PublicButton *)buttonWithImage:(NSString *)image
            backgroundImageImage:(NSString *)backgroundImageimage
                           title:(NSString *)title
                      titleColor:(UIColor *)titleColor
                        textFont:(UIFont *)font
                 backgroundColor:(UIColor *)backgroundColor
                         addView:(UIView *)view
                          target:(id)target
                          action:(SEL)action;

/** 可自由定制button */
+ (PublicButton *)buttonWithFrame:(CGRect)frame buttonEdgeInsetsStyle:(UIButtonEdgeInsetsStyle)buttonEdgeInsetsStyle image:(NSString *)image backgroundImageImage:(NSString *)backgroundImageimage title:(NSString *)title titleColor:(UIColor *)titleColor textFont:(UIFont *)font backgroundColor:(UIColor *)backgroundColor addView:(UIView *)view target:(id)target action:(SEL)action;

@end

NS_ASSUME_NONNULL_END
