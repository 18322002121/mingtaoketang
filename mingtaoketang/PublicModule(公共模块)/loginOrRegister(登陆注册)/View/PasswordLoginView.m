//
//  PasswordLoginView.m
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/5/7.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "PasswordLoginView.h"

@interface PasswordLoginView ()
/** 程序icon */
@property (nonatomic,strong) UIImageView *iconImage;
/** 程序描述 */
@property (nonatomic,strong) PublicLabel *descriptions;
/** 手机号view */
@property (nonatomic,strong) UIView *phoneView;
/** 手机号icon */
@property (nonatomic,strong) UIImageView *phoneIcon;
/** 手机号输入框 */
@property (nonatomic,strong) PublicTextfield *phoneTextfield;
/** 验证码view */
@property (nonatomic,strong) UIView *verificationView;
/** 验证码icon */
@property (nonatomic,strong) UIImageView *verificationIcon;
/** 密码输入框 */
@property (nonatomic,strong) PublicTextfield *passwordTextfield;
/** 密码展示与隐藏按钮回调 */
@property (nonatomic,strong) PublicButton *hideOrShowButton;
/** 登陆按钮 */
@property (nonatomic,strong) PublicButton *loginButton;
/** 注册按钮 */
@property (nonatomic,strong) PublicButton *registerButton;
/** 短信按钮按钮 */
@property (nonatomic,strong) PublicButton *messageLoginButton;
/** 院校登陆按钮 */
@property (nonatomic,strong) PublicButton *educationalLoginButton;
/** 区县登陆按钮 */
@property (nonatomic,strong) PublicButton *countyLoginButton;
@end

@implementation PasswordLoginView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor colorWithHexString:@"#2393EE"];
        [self iconImage];
        [self description];
        [self phoneView];
        [self phoneIcon];
        [self verificationView];
        [self verificationIcon];
        [self loginButton];
        [self registerButton];
        [self messageLoginButton];
        [self educationalLoginButton];
        [self countyLoginButton];
        [self phoneTextfield];
        [self passwordTextfield];
        [self hideOrShowButton];
    }
    return self;
}

- (UIImageView *)iconImage{
    if (!_iconImage) {
        _iconImage = [[UIImageView alloc]init];
        _iconImage.layer.cornerRadius = 25;
        _iconImage.backgroundColor = kRandomColor;
        [self addSubview:_iconImage];
    }
    return _iconImage;
}

- (PublicLabel *)descriptions{
    if (!_descriptions) {
        _descriptions = [PublicLabel labelWithText:@"NEW  YOUTH    NEW  SKILLS    NEW  FUTURE" textColor:[UIColor colorWithHexString:@"#FEFEFE"] font:[UIFont systemFontOfSize:8] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self addSubview:_descriptions];
    }
    return _descriptions;
}

- (UIView *)phoneView{
    if (!_phoneView) {
        _phoneView = [[UIView alloc]init];
        _phoneView.layer.cornerRadius = 27;
        _phoneView.backgroundColor = [UIColor colorWithRed:0.47 green:0.74 blue:0.95 alpha:1.00];
        [self addSubview:_phoneView];
    }
    return _phoneView;
}

- (UIImageView *)phoneIcon{
    if (!_phoneIcon) {
        _phoneIcon = [[UIImageView alloc]init];
        _phoneIcon.backgroundColor = kRandomColor;
        [self.phoneView addSubview:_phoneIcon];
    }
    return _phoneIcon;
}

- (PublicTextfield *)phoneTextfield{
    if (!_phoneTextfield) {
        _phoneTextfield = [PublicTextfield textFieldBackground:[UIImage imageNamed:@""] secureTextEntry:NO placeholder:@"" clearsOnBeginEditing:NO];
        [self.phoneView addSubview:_phoneTextfield];
        NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:@"手机号" attributes:
                                                 @{NSForegroundColorAttributeName:[UIColor whiteColor],
                                                   NSFontAttributeName:[UIFont boldSystemFontOfSize:12]}
                                                 ];
        [_phoneTextfield addTarget:self action:@selector(phoneTextfieldClick:) forControlEvents:UIControlEventEditingChanged];
        _phoneTextfield.attributedPlaceholder = attrString;
    }
    return _phoneTextfield;
}

- (UIView *)verificationView{
    if (!_verificationView) {
        _verificationView = [[UIView alloc]init];
        _verificationView.layer.cornerRadius = 27;
        _verificationView.backgroundColor = [UIColor colorWithRed:0.47 green:0.74 blue:0.95 alpha:1.00];
        [self addSubview:_verificationView];
    }
    return _verificationView;
}

- (UIImageView *)verificationIcon{
    if (!_verificationIcon) {
        _verificationIcon = [[UIImageView alloc]init];
        _verificationIcon.backgroundColor = kRandomColor;
        [self.verificationView addSubview:_verificationIcon];
    }
    return _verificationIcon;
}

- (PublicTextfield *)passwordTextfield{
    if (!_passwordTextfield) {
        _passwordTextfield = [PublicTextfield textFieldBackground:[UIImage imageNamed:@""] secureTextEntry:YES placeholder:@"" clearsOnBeginEditing:NO];
        NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:@"密码" attributes:
                                                 @{NSForegroundColorAttributeName:[UIColor whiteColor],
                                                   NSFontAttributeName:[UIFont boldSystemFontOfSize:12]}
                                                 ];
        _passwordTextfield.attributedPlaceholder = attrString;
        [_passwordTextfield addTarget:self action:@selector(passwordTextfieldClick:) forControlEvents:UIControlEventEditingChanged];
        [self.verificationView addSubview:_passwordTextfield];
    }
    return _passwordTextfield;
}

- (PublicButton *)hideOrShowButton{
    if (!_hideOrShowButton) {
        _hideOrShowButton = [PublicButton buttonWithImage:@"" backgroundImageImage:@"" title:@"" titleColor:[UIColor colorWithHexString:@"#FFFFFF"] textFont:[UIFont systemFontOfSize:12] backgroundColor:kRandomColor addView:self target:self action:@selector(hideOrShowButtonClick:)];
    }
    return _hideOrShowButton;
}

- (PublicButton *)loginButton{
    if (!_loginButton) {
        _loginButton = [PublicButton buttonWithImage:@"" backgroundImageImage:@"" title:@"登录" titleColor:[UIColor colorWithHexString:@"#2393EE"] textFont:[UIFont systemFontOfSize:18] backgroundColor:[UIColor colorWithHexString:@"#FFFFFF"] addView:self target:self action:@selector(loginButtonClick:)];
        _loginButton.layer.cornerRadius = 27;
    }
    return _loginButton;
}

- (PublicButton *)registerButton{
    if (!_registerButton) {
        _registerButton = [PublicButton buttonWithImage:@"" backgroundImageImage:@"" title:@"立即注册" titleColor:[UIColor colorWithHexString:@"#FFFFFF"] textFont:[UIFont systemFontOfSize:15] backgroundColor:[UIColor clearColor] addView:self target:self action:@selector(registerButtonClick:)];
    }
    return _registerButton;
}

- (PublicButton *)messageLoginButton{
    if (!_messageLoginButton) {
        _messageLoginButton = [PublicButton buttonWithImage:@"" backgroundImageImage:@"" title:@"短信登录" titleColor:[UIColor colorWithHexString:@"#FFFFFF"] textFont:[UIFont systemFontOfSize:15] backgroundColor:[UIColor clearColor] addView:self target:self action:@selector(messageLoginButtonClick:)];
    }
    return _messageLoginButton;
}

- (PublicButton *)educationalLoginButton{
    if (!_educationalLoginButton) {
        _educationalLoginButton = [PublicButton buttonWithFrame:CGRectMake(0, 0, 0, 0) buttonEdgeInsetsStyle:(UIButtonEdgeInsetsStyleBottom) image:@"" backgroundImageImage:@"" title:@"院校登录" titleColor:[UIColor colorWithHexString:@"#FFFFFF"] textFont:[UIFont systemFontOfSize:13] backgroundColor:[UIColor greenColor] addView:self target:self action:@selector(educationalLoginButtonClick:)];
    }
    return _educationalLoginButton;
}

- (PublicButton *)countyLoginButton{
    if (!_countyLoginButton) {
        _countyLoginButton = [PublicButton buttonWithFrame:CGRectMake(0, 0, 0, 0) buttonEdgeInsetsStyle:(UIButtonEdgeInsetsStyleBottom) image:@"" backgroundImageImage:@"" title:@"区县登陆" titleColor:[UIColor colorWithHexString:@"#FFFFFF"] textFont:[UIFont systemFontOfSize:13] backgroundColor:[UIColor greenColor] addView:self target:self action:@selector(countyLoginButtonClick:)];
    }
    return _countyLoginButton;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [_iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).offset(112);
        make.centerX.mas_equalTo(self.mas_centerX).offset(0);
        make.size.mas_equalTo(CGSizeMake(80, 80));
    }];
    
    [_descriptions mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.mas_centerX).offset(0);
        make.top.mas_equalTo(self.iconImage.mas_bottom).offset(23);
    }];
    
    [_phoneView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.descriptions.mas_bottom).offset(54);
        make.left.mas_equalTo(self.mas_left).offset(39);
        make.right.mas_equalTo(self.mas_right).offset(-39);
        make.height.mas_offset(@55);
    }];
    
    [_verificationView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.phoneView.mas_bottom).offset(9);
        make.left.mas_equalTo(self.mas_left).offset(39);
        make.right.mas_equalTo(self.mas_right).offset(-39);
        make.height.mas_offset(@55);
    }];
    
    [_loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.verificationView.mas_bottom).offset(17);
        make.left.mas_equalTo(self.mas_left).offset(39);
        make.right.mas_equalTo(self.mas_right).offset(-39);
        make.height.mas_offset(@55);
    }];
    
    [_registerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.loginButton.mas_left).offset(29);
        make.top.mas_equalTo(self.loginButton.mas_bottom).offset(12);
        make.size.mas_equalTo(CGSizeMake(60, 15));
    }];
    
    [_messageLoginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.loginButton.mas_right).offset(-29);
        make.top.mas_equalTo(self.loginButton.mas_bottom).offset(12);
        make.size.mas_equalTo(CGSizeMake(60, 15));
    }];
    
    [_educationalLoginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.registerButton.mas_bottom).offset(68);
        make.left.mas_equalTo(self.loginButton.mas_left).offset(48);
        make.size.mas_equalTo(CGSizeMake(60, 60));
    }];
    
    [_countyLoginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.registerButton.mas_bottom).offset(68);
        make.right.mas_equalTo(self.loginButton.mas_right).offset(-48);
        make.size.mas_equalTo(CGSizeMake(60, 60));
    }];
    
    [_phoneIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.phoneView.mas_left).offset(27);
        make.centerY.mas_equalTo(self.phoneView.mas_centerY).offset(0);
        make.size.mas_equalTo(CGSizeMake(12, 15));
    }];
    
    [_verificationIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.verificationView.mas_left).offset(27);
        make.centerY.mas_equalTo(self.verificationView.mas_centerY).offset(0);
        make.size.mas_equalTo(CGSizeMake(13, 15));
    }];
    
    [_phoneTextfield mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.phoneIcon.mas_right).offset(7);
        make.centerY.mas_equalTo(self.phoneView.mas_centerY).offset(0);
        make.right.mas_equalTo(self.phoneView.mas_right).offset(-10);
        make.height.mas_offset(@30);
    }];
    
    [_passwordTextfield mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.verificationIcon.mas_right).offset(7);
        make.centerY.mas_equalTo(self.verificationView.mas_centerY).offset(0);
        make.right.mas_equalTo(self.hideOrShowButton.mas_left).offset(-10);
        make.height.mas_offset(@30);
    }];
    
    [_hideOrShowButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.verificationView.mas_right).offset(-22);
        make.centerY.mas_equalTo(self.verificationView.mas_centerY).offset(0);
        make.size.mas_equalTo(CGSizeMake(15, 11));
    }];
    
}

- (void)loginButtonClick:(UIButton *)sender{
    !_loginButtonClickBlock ? : _loginButtonClickBlock(sender);
}

- (void)registerButtonClick:(UIButton *)sender{
    !_registerButtonClickBlock ? : _registerButtonClickBlock(sender);
}

- (void)messageLoginButtonClick:(UIButton *)sender{
    !_messageLoginButtonClickBlock ? : _messageLoginButtonClickBlock(sender);
}

- (void)educationalLoginButtonClick:(UIButton *)sender{
    !_educationalLoginButtonClickBlock ? : _educationalLoginButtonClickBlock(sender);
}

- (void)countyLoginButtonClick:(UIButton *)sender{
    !_countyLoginButtonClickBlock ? : _countyLoginButtonClickBlock(sender);
}

- (void)hideOrShowButtonClick:(UIButton *)sender{
    !_hideOrShowButtonClickBlock ? : _hideOrShowButtonClickBlock(sender);
}

- (void)phoneTextfieldClick:(UITextField *)textFields{
    !_phoneTextfieldClickBlock ? : _phoneTextfieldClickBlock(textFields);
}

- (void)passwordTextfieldClick:(UITextField *)textFields{
    !_passwordTextfieldClickBlock ? : _passwordTextfieldClickBlock(textFields);
}

@end
