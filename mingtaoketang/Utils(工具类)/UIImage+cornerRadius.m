//
//  UIImage+cornerRadius.m
//  mingtaohangkong
//
//  Created by Linlin Ge on 2019/4/13.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "UIImage+cornerRadius.h"

@implementation UIImage (cornerRadius)

- (UIImage *)image_drawRectWithRoundedCorner:(CGFloat)radius size:(CGSize)size{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, false, [UIScreen mainScreen].scale);
    CGContextAddPath(UIGraphicsGetCurrentContext(), [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(radius, radius)].CGPath);
    CGContextClip(UIGraphicsGetCurrentContext());
    [self drawInRect:rect];
    CGContextDrawPath(UIGraphicsGetCurrentContext(), kCGPathFillStroke);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
