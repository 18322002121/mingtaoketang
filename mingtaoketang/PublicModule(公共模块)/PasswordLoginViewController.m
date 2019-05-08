//
//  PasswordLoginViewController.m
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/5/5.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "PasswordLoginViewController.h"
#import "RegisterViewController.h"
#import "PasswordLoginView.h"

@interface PasswordLoginViewController ()
/** 初始化登录view */
@property (nonatomic,strong) PasswordLoginView *loginView;
@end

@implementation PasswordLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _loginView = [[PasswordLoginView alloc]init];
    [self.view addSubview:_loginView];
    [self reloadLoginView:_loginView];
    [_loginView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view.mas_top).offset(0);
        make.left.mas_equalTo(self.view.mas_left).offset(0);
        make.bottom.mas_equalTo(self.view.mas_bottom).offset(0);
        make.right.mas_equalTo(self.view.mas_right).offset(0);
    }];
}

- (void)reloadLoginView:(PasswordLoginView *)loginView{
    /** 登陆按钮回调 */
    loginView.loginButtonClickBlock = ^(UIButton * _Nonnull sender) {
        NSLog(@"登陆按钮回调");
    };
    /** 注册按钮回调 */
    loginView.registerButtonClickBlock = ^(UIButton * _Nonnull sender) {
        NSLog(@"注册按钮回调");
        RegisterViewController *registerView = [[RegisterViewController alloc]init];
        [self.navigationController pushViewController:registerView animated:YES];
    };
    /** 密码登录按钮回调 */
    loginView.passwordLoginButtonClickBlock = ^(UIButton * _Nonnull sender) {
        NSLog(@"密码登录按钮回调");
    };
    /** 院校登录按钮回调 */
    loginView.educationalLoginButtonClickBlock = ^(UIButton * _Nonnull sender) {
        NSLog(@"院校登录按钮回调");
    };
    /** 区县登录按钮回调 */
    loginView.countyLoginButtonClickBlock = ^(UIButton * _Nonnull sender) {
        NSLog(@"区县登录按钮回调");
    };
    /** 发送验证码按钮回调 */
    loginView.sendVerificationButtonClickBlock = ^(UIButton * _Nonnull sender) {
        NSLog(@"发送验证码按钮回调");
    };
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

@end
