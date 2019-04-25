//
//  UIImage+cornerRadius.h
//  mingtaohangkong
//
//  Created by Linlin Ge on 2019/4/13.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (cornerRadius)
- (UIImage *)image_drawRectWithRoundedCorner:(CGFloat)radius size:(CGSize)size;
@end

NS_ASSUME_NONNULL_END
