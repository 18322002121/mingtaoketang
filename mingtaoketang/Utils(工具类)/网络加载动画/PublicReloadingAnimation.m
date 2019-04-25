//
//  PublicReloadingAnimation.m
//  mingtaohangkong
//
//  Created by Linlin Ge on 2019/4/15.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "PublicReloadingAnimation.h"
#import "UIView+Extension.h"

@implementation PublicReloadingAnimation
/****************加载动画*****************/
static UIView *animationView;

+ (UIView *)animationView{
    if (!animationView) {
        animationView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 40, 30)];
    }
    return animationView;
}

+ (void)showLoadingAnimation{
    dispatch_async(dispatch_get_main_queue(), ^{
        animationView = [PublicReloadingAnimation animationView];
        [animationView.layer addSublayer:[PublicReloadingAnimation replicatorLayer_Shake]];
        
        UIWindow *window=[UIApplication sharedApplication].keyWindow;
        UIViewController *vc = [PublicReloadingAnimation currentViewController];
        [vc.view addSubview:animationView];
        CGPoint center = [vc.view convertPoint:vc.view.center toView:window];
        animationView.centerX = vc.view.center.x-(center.x-window.center.x);
        animationView.centerY = vc.view.center.y-(center.y-window.center.y);
        
    });
    
}

+ (void)removeLoadingAnimation{
    [animationView removeFromSuperview];
    animationView = nil;
}
// 震动条动画
+ (CALayer *)replicatorLayer_Shake{
    
    CALayer *layer = [[CALayer alloc]init];
    layer.frame = CGRectMake(0, 0, 3, 3);
    layer.backgroundColor = [UIColor redColor].CGColor;
    layer.anchorPoint = CGPointMake(0.5, 0.5);
    // 添加一个基本动画
    [layer addAnimation:[self scaleYAnimation] forKey:@"scaleAnimation"];
    
    CAReplicatorLayer *replicatorLayer = [CAReplicatorLayer layer];
    replicatorLayer.frame = CGRectMake(0, 0, 40, 30);
    
    replicatorLayer.instanceCount = 5;
    replicatorLayer.instanceTransform =  CATransform3DMakeTranslation(8, 0, 0);
    replicatorLayer.instanceDelay = 0.2;
    //replicatorLayer.instanceGreenOffset = -0.3;
    [replicatorLayer addSublayer:layer];
    return replicatorLayer;
}
+ (CABasicAnimation *)scaleYAnimation{
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"transform.scale.y"];
    anim.toValue = @10;
    anim.duration = 0.5;
    anim.autoreverses = YES;//往返都有动画
    anim.repeatCount = MAXFLOAT;//执行次数
    //    anim.removedOnCompletion = NO;
    //    anim.fillMode = kCAFillModeForwards;
    return anim;
}

+ (UIViewController*)currentViewController{
    //获得当前活动窗口的根视图
    UIViewController* vc = [UIApplication sharedApplication].keyWindow.rootViewController;
    while (1)
    {
        //根据不同的页面切换方式，逐步取得最上层的viewController
        if ([vc isKindOfClass:[UITabBarController class]]) {
            vc = ((UITabBarController*)vc).selectedViewController;
        }
        if ([vc isKindOfClass:[UINavigationController class]]) {
            vc = ((UINavigationController*)vc).visibleViewController;
        }
        if (vc.presentedViewController) {
            vc = vc.presentedViewController;
        }else{
            break;
        }
    }
    return vc;
}
@end
