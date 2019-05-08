//
//  EducationalInstitutionsView.m
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/5/8.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "EducationalInstitutionsView.h"
@interface EducationalInstitutionsView ()
/** 院校选择view */
@property (nonatomic,strong) UIView *educationalView;
/** 院校icon */
@property (nonatomic,strong) UIImageView *educationalIcon;
/** 院校选择按钮 */
@property (nonatomic,strong) PublicButton *educationalButton;
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
/** 登陆按钮 */
@property (nonatomic,strong) PublicButton *loginButton;
@end
@implementation EducationalInstitutionsView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self educationalView];
        [self educationalIcon];
        [self educationalButton];
        [self phoneView];
        [self phoneIcon];
        [self verificationView];
        [self verificationIcon];
        [self loginButton];
        [self phoneTextfield];
        [self verificationTextfield];
        [self sendVerificationButton];
    }
    return self;
}

- (UIView *)educationalView{
    if (!_educationalView) {
        _educationalView = [[UIView alloc]init];
        _educationalView.layer.cornerRadius = 27;
        _educationalView.backgroundColor = [UIColor colorWithHexString:@"#F2F6F9"];
        [self addSubview:_educationalView];
    }
    return _educationalView;
}

- (UIImageView *)educationalIcon{
    if (!_educationalIcon) {
        _educationalIcon = [[UIImageView alloc]init];
        _educationalIcon.backgroundColor = kRandomColor;
        [self.educationalView addSubview:_educationalIcon];
    }
    return _educationalIcon;
}

- (PublicButton *)educationalButton{
    if (!_educationalButton) {
        _educationalButton = [PublicButton buttonWithImage:@"" backgroundImageImage:@"" title:@"院校选择" titleColor:[UIColor colorWithHexString:@"#A7A7A7"] textFont:[UIFont systemFontOfSize:12] backgroundColor:[UIColor clearColor] addView:self target:self action:@selector(educationalButtonClick:)];
        _educationalButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    }
    return _educationalButton;
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
                                                 @{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"#A7A7A7"],
                                                   NSFontAttributeName:[UIFont boldSystemFontOfSize:12]}
                                                 ];
        _phoneTextfield.attributedPlaceholder = attrString;
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
        _verificationIcon.backgroundColor = kRandomColor;
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

- (PublicButton *)loginButton{
    if (!_loginButton) {
        _loginButton = [PublicButton buttonWithImage:@"" backgroundImageImage:@"" title:@"登录" titleColor:[UIColor colorWithHexString:@"#FFFFFF"] textFont:[UIFont systemFontOfSize:18] backgroundColor:[UIColor colorWithHexString:@"#2393EE"] addView:self target:self action:@selector(loginButtonClick:)];
        _loginButton.layer.cornerRadius = 27;
    }
    return _loginButton;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    [_educationalView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).offset(30);
        make.left.mas_equalTo(self.mas_left).offset(39);
        make.right.mas_equalTo(self.mas_right).offset(-39);
        make.height.mas_offset(@55);
    }];
    
    [_educationalIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.phoneView.mas_left).offset(27);
        make.centerY.mas_equalTo(self.educationalView.mas_centerY).offset(0);
        make.size.mas_equalTo(CGSizeMake(12, 15));
    }];
    
    [_educationalButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.educationalIcon.mas_right).offset(7);
        make.centerY.mas_equalTo(self.educationalView.mas_centerY).offset(0);
        make.right.mas_equalTo(self.sendVerificationButton.mas_left).offset(-10);
        make.height.mas_offset(@30);
    }];
    
    [_phoneView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.educationalView.mas_bottom).offset(12);
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
}

- (void)loginButtonClick:(UIButton *)sender{
    !_loginButtonClickBlock ? : _loginButtonClickBlock(sender);
}

- (void)sendVerificationButtonClick:(UIButton *)sender{
    !_sendVerificationButtonClickBlock ? : _sendVerificationButtonClickBlock(sender);
}

- (void)educationalButtonClick:(UIButton *)sender{
    !_educationalButtonClickBlock ? : _educationalButtonClickBlock(sender);
}



@end
