//
//  RegisterView.h
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/5/7.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RegisterView : UIView
/** 发送验证码按钮回调 */
@property (nonatomic,strong) void (^sendVerificationButtonClickBlock)(UIButton *sender);
/** 注册按钮回调 */
@property (nonatomic,strong) void (^registerButtonClickBlock)(UIButton *sender);
/** 密码显示与隐藏按钮回调 */
@property (nonatomic,strong) void (^hideOrShowButtonClickBlock)(UIButton *sender);
/** 手机号输入框回调 */
@property (nonatomic,strong) void (^phoneTextfieldClickBlock)(UITextField *sender);
/** 验证码输入框回调 */
@property (nonatomic,strong) void (^verificationTextfieldClickBlock)(UITextField *sender);
/** 密码输入框回调 */
@property (nonatomic,strong) void (^passwordTextfieldClickBlock)(UITextField *sender);

@end

NS_ASSUME_NONNULL_END
