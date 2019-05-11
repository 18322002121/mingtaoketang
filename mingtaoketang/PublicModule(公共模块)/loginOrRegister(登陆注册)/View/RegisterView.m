//
//  RegisterView.m
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/5/7.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "RegisterView.h"

@interface RegisterView ()
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
/** 验证码输入框 */
@property (nonatomic,strong) PublicTextfield *verificationTextfield;
/** 发送验证码按钮 */
@property (nonatomic,strong) PublicButton *sendVerificationButton;
/** 密码view */
@property (nonatomic,strong) UIView *passwordView;
/** 密码icon */
@property (nonatomic,strong) UIImageView *passwordIcon;
/** 密码输入框 */
@property (nonatomic,strong) PublicTextfield *passwordTextfield;
/** 注册按钮 */
@property (nonatomic,strong) PublicButton *registerButton;
/** 密码显示与隐藏按钮 */
@property (nonatomic,strong) PublicButton *hideOrShow;
@end

@implementation RegisterView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self phoneView];
        [self phoneIcon];
        [self verificationView];
        [self verificationIcon];
        [self phoneTextfield];
        [self verificationTextfield];
        [self sendVerificationButton];
        [self passwordView];
        [self registerButton];
        [self passwordIcon];
        [self passwordTextfield];
        [self hideOrShow];
    }
    return self;
}

- (UIView *)phoneView{
    if (!_phoneView) {
        _phoneView = [[UIView alloc]init];
        _phoneView.layer.cornerRadius = 27;
        _phoneView.backgroundColor = [UIColor colorWithHexString:@"#F2F6F9"];
        [self addSubview:_phoneView];
    }
    return _phoneView;
}

- (UIImageView *)phoneIcon{
    if (!_phoneIcon) {
        _phoneIcon = [[UIImageView alloc]init];
        _phoneIcon.image = [UIImage imageNamed:@"phone2"];
        [self.phoneView addSubview:_phoneIcon];
    }
    return _phoneIcon;
}

- (PublicTextfield *)phoneTextfield{
    if (!_phoneTextfield) {
        _phoneTextfield = [PublicTextfield textFieldBackground:[UIImage imageNamed:@""] secureTextEntry:NO placeholder:@"" clearsOnBeginEditing:NO];
        NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:@"手机号" attributes:
                                                 @{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"#A7A7A7"],
                                                   NSFontAttributeName:[UIFont boldSystemFontOfSize:12]}
                                                 ];
        _phoneTextfield.attributedPlaceholder = attrString;
        [_phoneTextfield addTarget:self action:@selector(phoneTextfieldClick:) forControlEvents:UIControlEventEditingChanged];
        [self.phoneView addSubview:_phoneTextfield];
    }
    return _phoneTextfield;
}

- (UIView *)verificationView{
    if (!_verificationView) {
        _verificationView = [[UIView alloc]init];
        _verificationView.layer.cornerRadius = 27;
        _verificationView.backgroundColor = [UIColor colorWithHexString:@"#F2F6F9"];
        [self addSubview:_verificationView];
    }
    return _verificationView;
}

- (UIImageView *)verificationIcon{
    if (!_verificationIcon) {
        _verificationIcon = [[UIImageView alloc]init];
        _verificationIcon.image = [UIImage imageNamed:@"verification2"];
        [self.verificationView addSubview:_verificationIcon];
    }
    return _verificationIcon;
}

- (PublicTextfield *)verificationTextfield{
    if (!_verificationTextfield) {
        _verificationTextfield = [PublicTextfield textFieldBackground:[UIImage imageNamed:@""] secureTextEntry:NO placeholder:@"" clearsOnBeginEditing:NO];
        NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:@"验证码" attributes:
                                                 @{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"#A7A7A7"],
                                                   NSFontAttributeName:[UIFont boldSystemFontOfSize:12]}
                                                 ];
        _verificationTextfield.attributedPlaceholder = attrString;
        [_verificationTextfield addTarget:self action:@selector(verificationTextfieldClick:) forControlEvents:UIControlEventEditingChanged];
        [self.verificationView addSubview:_verificationTextfield];
    }
    return _verificationTextfield;
}

- (PublicButton *)sendVerificationButton{
    if (!_sendVerificationButton) {
        _sendVerificationButton = [PublicButton buttonWithImage:@"" backgroundImageImage:@"" title:@"发送验证码" titleColor:[UIColor colorWithHexString:@"#2393EE"] textFont:[UIFont systemFontOfSize:12] backgroundColor:[UIColor clearColor] addView:self target:self action:@selector(sendVerificationButtonClick:)];
    }
    return _sendVerificationButton;
}

- (UIView *)passwordView{
    if (!_passwordView) {
        _passwordView = [[UIView alloc]init];
        _passwordView.layer.cornerRadius = 27;
        _passwordView.backgroundColor = [UIColor colorWithHexString:@"#F2F6F9"];
        [self addSubview:_passwordView];
    }
    return _passwordView;
}

- (UIImageView *)passwordIcon{
    if (!_passwordIcon) {
        _passwordIcon = [[UIImageView alloc]init];
        _passwordIcon.image = [UIImage imageNamed:@"password2"];
        [self.passwordView addSubview:_passwordIcon];
    }
    return _passwordIcon;
}

- (PublicTextfield *)passwordTextfield{
    if (!_passwordTextfield) {
        _passwordTextfield = [PublicTextfield textFieldBackground:[UIImage imageNamed:@""] secureTextEntry:YES placeholder:@"" clearsOnBeginEditing:NO];
        NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:@"密码" attributes:
                                                 @{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"#A7A7A7"],
                                                   NSFontAttributeName:[UIFont boldSystemFontOfSize:12]}
                                                 ];
        _passwordTextfield.attributedPlaceholder = attrString;
        [_passwordTextfield addTarget:self action:@selector(passwordTextfieldClick:) forControlEvents:UIControlEventEditingChanged];
        [self.passwordView addSubview:_passwordTextfield];
    }
    return _passwordTextfield;
}

- (PublicButton *)registerButton{
    if (!_registerButton) {
        _registerButton = [PublicButton buttonWithImage:@"" backgroundImageImage:@"" title:@"注册并登录" titleColor:[UIColor colorWithHexString:@"#FFFFFF"] textFont:[UIFont systemFontOfSize:18] backgroundColor:[UIColor colorWithHexString:@"#1364D5"] addView:self target:self action:@selector(registerButtonClick:)];
        _registerButton.layer.cornerRadius = 27;
    }
    return _registerButton;
}

- (PublicButton *)hideOrShow{
    if (!_hideOrShow) {
        _hideOrShow = [PublicButton buttonWithImage:@"eye2" backgroundImageImage:@"" title:@"" titleColor:[UIColor colorWithHexString:@"#FFFFFF"] textFont:[UIFont systemFontOfSize:13] backgroundColor:[UIColor clearColor] addView:self target:self action:@selector(hideOrShowButtonClick:)];
        [_hideOrShow setImage:[UIImage imageNamed:@"eye1"] forState:UIControlStateSelected];
    }
    return _hideOrShow;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [_phoneView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).offset(30);
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
    
    [_verificationTextfield mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.verificationIcon.mas_right).offset(7);
        make.centerY.mas_equalTo(self.verificationView.mas_centerY).offset(0);
        make.right.mas_equalTo(self.sendVerificationButton.mas_left).offset(-10);
        make.height.mas_offset(@30);
    }];
    
    [_sendVerificationButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.verificationView.mas_right).offset(-22);
        make.centerY.mas_equalTo(self.verificationView.mas_centerY).offset(0);
        make.size.mas_equalTo(CGSizeMake(70, 30));
    }];
    
    [_passwordView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.verificationView.mas_bottom).offset(12);
        make.left.mas_equalTo(self.mas_left).offset(39);
        make.right.mas_equalTo(self.mas_right).offset(-39);
        make.height.mas_offset(@55);
    }];
    
    [_registerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.passwordView.mas_bottom).offset(21);
        make.left.mas_equalTo(self.mas_left).offset(39);
        make.right.mas_equalTo(self.mas_right).offset(-39);
        make.height.mas_offset(@55);
    }];
    
    [_passwordIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.passwordView.mas_left).offset(27);
        make.centerY.mas_equalTo(self.passwordView.mas_centerY).offset(0);
        make.size.mas_equalTo(CGSizeMake(13, 15));
    }];
    
    [_passwordTextfield mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.passwordIcon.mas_right).offset(7);
        make.centerY.mas_equalTo(self.passwordView.mas_centerY).offset(0);
        make.right.mas_equalTo(self.hideOrShow.mas_left).offset(-10);
        make.height.mas_offset(@30);
    }];
    
    [_hideOrShow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.passwordView.mas_right).offset(-30);
        make.size.mas_equalTo(CGSizeMake(15, 11));
        make.centerY.mas_equalTo(self.passwordView.mas_centerY).offset(0);
    }];
}

- (void)sendVerificationButtonClick:(UIButton *)sender{
    !_sendVerificationButtonClickBlock ? : _sendVerificationButtonClickBlock(sender);
}

- (void)registerButtonClick:(UIButton *)sender{
    !_registerButtonClickBlock ? : _registerButtonClickBlock(sender);
}

- (void)hideOrShowButtonClick:(UIButton *)sender{
    !_hideOrShowButtonClickBlock ? : _hideOrShowButtonClickBlock(sender);
}

- (void)phoneTextfieldClick:(UITextField *)textFields{
    !_phoneTextfieldClickBlock ? : _phoneTextfieldClickBlock(textFields);
}

- (void)verificationTextfieldClick:(UITextField *)textFields{
    !_verificationTextfieldClickBlock ? : _verificationTextfieldClickBlock(textFields);
}

- (void)passwordTextfieldClick:(UITextField *)textFields{
    !_passwordTextfieldClickBlock ? : _passwordTextfieldClickBlock(textFields);
}

@end
