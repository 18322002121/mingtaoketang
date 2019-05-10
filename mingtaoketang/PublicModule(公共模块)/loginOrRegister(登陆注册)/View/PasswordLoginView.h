//
//  PasswordLoginView.h
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/5/7.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PasswordLoginView : UIView
/** 登陆按钮回调 */
@property (nonatomic,strong) void (^loginButtonClickBlock)(UIButton *sender);
/** 注册按钮回调 */
@property (nonatomic,strong) void (^registerButtonClickBlock)(UIButton *sender);
/** 短信登录按钮回调 */
@property (nonatomic,strong) void (^messageLoginButtonClickBlock)(UIButton *sender);
/** 院校登录按钮回调 */
@property (nonatomic,strong) void (^educationalLoginButtonClickBlock)(UIButton *sender);
/** 区县登录按钮回调 */
@property (nonatomic,strong) void (^countyLoginButtonClickBlock)(UIButton *sender);
/** 密码展示与隐藏按钮回调 */
@property (nonatomic,strong) void (^hideOrShowButtonClickBlock)(UIButton *sender);
/** 手机号输入框回调 */
@property (nonatomic,strong) void (^phoneTextfieldClickBlock)(UITextField *sender);
/** 密码输入框回调 */
@property (nonatomic,strong) void (^passwordTextfieldClickBlock)(UITextField *sender);
@end

NS_ASSUME_NONNULL_END
