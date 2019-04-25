//
//  UIView+Animations.m
//  mingtaohangkong
//
//  Created by Linlin Ge on 2019/4/13.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "UIView+Animations.h"

@implementation UIView (Animations)
- (CABasicAnimation *)rotationAnimation {
    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.fromValue = @0;
    rotationAnimation.toValue = @(M_PI * 2.0);
    rotationAnimation.duration = 2;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = MAXFLOAT;
    [self.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
    return rotationAnimation;
}
- (void)stopRotationAnimation {
    
    if ([self.layer animationForKey:@"rotationAnimation"]) {
        [self.layer removeAnimationForKey:@"rotationAnimation"];
    }
}
@end
