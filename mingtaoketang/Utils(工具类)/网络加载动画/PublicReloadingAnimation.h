//
//  PublicReloadingAnimation.h
//  mingtaohangkong
//
//  Created by Linlin Ge on 2019/4/15.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PublicReloadingAnimation : NSObject
/**
 展示加载动画
 */
+ (void)showLoadingAnimation;

/**
 移除加载动画
 */
+ (void)removeLoadingAnimation;
@end

NS_ASSUME_NONNULL_END
