//
//  RegisterViewController.m
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/5/7.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "RegisterViewController.h"
#import "RegisterView.h"

@interface RegisterViewController ()
/** 初始化注册view */
@property (nonatomic,strong) RegisterView *registerView;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"注册";
    self.view.backgroundColor = [UIColor whiteColor];
    _registerView = [[RegisterView alloc]init];
    [self.view addSubview:_registerView];
    [self reloadRegisterView:_registerView];
    [_registerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view.mas_top).offset(0);
        make.left.mas_equalTo(self.view.mas_left).offset(0);
        make.bottom.mas_equalTo(self.view.mas_bottom).offset(0);
        make.right.mas_equalTo(self.view.mas_right).offset(0);
    }];
}

- (void)reloadRegisterView:(RegisterView *)registerView{
    /** 发送验证码按钮回调 */
    registerView.sendVerificationButtonClickBlock = ^(UIButton * _Nonnull sender) {
        NSLog(@"发送验证码按钮回调");
    };
    /** 注册按钮回调 */
    registerView.registerButtonClickBlock = ^(UIButton * _Nonnull sender) {
        NSLog(@"注册按钮回调");
    };
    
    /** 密码显示与隐藏按钮回调 */
    registerView.hideOrShowButtonClickBlock = ^(UIButton * _Nonnull sender) {
        NSLog(@"密码显示与隐藏按钮回调");
    };
}
@end
