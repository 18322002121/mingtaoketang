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
/** 手机号输入框 */
@property (nonatomic,strong) UITextField *phoneTextfield;
/** 验证码输入框 */
@property (nonatomic,strong) UITextField *verificationTextfield;
/** 密码输入框 */
@property (nonatomic,strong) UITextField *passwordTextfield;

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

    /** 手机号输入框回调 */
    registerView.phoneTextfieldClickBlock = ^(UITextField * _Nonnull sender) {
        self.phoneTextfield = sender;
    };
    /** 验证码输入框回调 */
    registerView.verificationTextfieldClickBlock = ^(UITextField * _Nonnull sender) {
        self.verificationTextfield = sender;
    };
    /** 密码输入框回调 */
    registerView.passwordTextfieldClickBlock = ^(UITextField * _Nonnull sender) {
        self.passwordTextfield = sender;
    };
    /** 发送验证码按钮回调 */
    registerView.sendVerificationButtonClickBlock = ^(UIButton * _Nonnull sender) {
        NSLog(@"发送验证码按钮回调");
    };
    /** 注册按钮回调 */
    registerView.registerButtonClickBlock = ^(UIButton * _Nonnull sender) {
        NSLog(@"注册按钮回调");
        
        if ([VerificationTool isPhoneNumber:self.phoneTextfield.text] == NO) {
            [MBProgressHUD showMessag:@"请输入正确手机号" toView:self.view];
        }else if ([VerificationTool isAllNumber:self.verificationTextfield.text] == NO){
            [MBProgressHUD showMessag:@"请输入正确的数字验证码" toView:self.view];
        }
    
        [HCYRequestManager appMobile:self.phoneTextfield.text password:self.passwordTextfield.text campus_id:@"1" sms_code:self.verificationTextfield.text success:^(id responseObject) {
            NSLog(@"%@",responseObject);
        } failure:^(NSError *errorMessage) {
            NSLog(@"%@",errorMessage);
        }];
    };
    registerView.hideOrShowButtonClickBlock = ^(UIButton * _Nonnull sender) {
        sender.selected = !sender.selected;
        if (sender.selected) { // 按下去了就是明文
            NSString *tempPwdStr = self.passwordTextfield.text;
            self.passwordTextfield.text = @""; // 这句代码可以防止切换的时候光标偏移
            self.passwordTextfield.secureTextEntry = NO;
            self.passwordTextfield.text = tempPwdStr;
            
        } else { // 暗文
            NSString *tempPwdStr = self.passwordTextfield.text;
            self.passwordTextfield.text = @"";
            self.passwordTextfield.secureTextEntry = YES;
            self.passwordTextfield.text = tempPwdStr;
        }
    };
}
@end
