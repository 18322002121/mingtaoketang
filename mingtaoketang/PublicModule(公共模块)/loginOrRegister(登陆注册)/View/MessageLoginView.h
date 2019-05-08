//
//  MessageLoginView.h
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/5/8.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MessageLoginView : UIView
/** 登陆按钮回调 */
@property (nonatomic,strong) void (^loginButtonClickBlock)(UIButton *sender);
/** 注册按钮回调 */
@property (nonatomic,strong) void (^registerButtonClickBlock)(UIButton *sender);
/** 密码登录按钮回调 */
@property (nonatomic,strong) void (^passwordLoginButtonClickBlock)(UIButton *sender);
/** 院校登录按钮回调 */
@property (nonatomic,strong) void (^educationalLoginButtonClickBlock)(UIButton *sender);
/** 区县登录按钮回调 */
@property (nonatomic,strong) void (^countyLoginButtonClickBlock)(UIButton *sender);
/** 发送验证码按钮回调 */
@property (nonatomic,strong) void (^sendVerificationButtonClickBlock)(UIButton *sender);
@end

NS_ASSUME_NONNULL_END
