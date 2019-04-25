//
//  BaseNavigationBar.h
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/4/25.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseNavigationBar : UIView
/** 导航栏类方法 */
+ (instancetype)navigationBar;
/** 搜索框被点击 */
@property (nonatomic,strong) void(^SearchClickBlock)(UITextField *sender);
@end

NS_ASSUME_NONNULL_END
