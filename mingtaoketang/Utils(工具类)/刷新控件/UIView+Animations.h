//
//  UIView+Animations.h
//  mingtaohangkong
//
//  Created by Linlin Ge on 2019/4/13.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Animations)
- (CABasicAnimation *)rotationAnimation;
- (void)stopRotationAnimation;
@end

NS_ASSUME_NONNULL_END
