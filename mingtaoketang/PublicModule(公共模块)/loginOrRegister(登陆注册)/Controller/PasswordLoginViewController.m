//
//  PasswordLoginViewController.m
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/5/5.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "PasswordLoginViewController.h"
#import "RegisterViewController.h"
#import "MessageLoginViewController.h"
#import "EducationalInstitutionsViewController.h"
#import "PasswordLoginView.h"
#import "PasswordLoginModel.h"

@interface PasswordLoginViewController ()
/** 初始化登录view */
@property (nonatomic,strong) PasswordLoginView *passwordLoginView;
/** 手机号输入框 */
@property (nonatomic,strong) UITextField *phoneTextfield;
/** 密码输入框 */
@property (nonatomic,strong) UITextField *passwordTextfield;
@end

@implementation PasswordLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _passwordLoginView = [[PasswordLoginView alloc]init];
    [self.view addSubview:_passwordLoginView];
    [self reloadLoginView:_passwordLoginView];
    [_passwordLoginView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view.mas_top).offset(0);
        make.left.mas_equalTo(self.view.mas_left).offset(0);
        make.bottom.mas_equalTo(self.view.mas_bottom).offset(0);
        make.right.mas_equalTo(self.view.mas_right).offset(0);
    }];
}

- (void)reloadLoginView:(PasswordLoginView *)loginView{
    /** 手机号输入框回调 */
    loginView.phoneTextfieldClickBlock = ^(UITextField * _Nonnull sender) {
        self.phoneTextfield = sender;
    };
    /** 密码输入框回调 */
    loginView.passwordTextfieldClickBlock = ^(UITextField * _Nonnull sender) {
        self.passwordTextfield = sender;
    };
    
    /** 登陆按钮回调 */
    loginView.loginButtonClickBlock = ^(UIButton * _Nonnull sender) {
        [HCYRequestManager user_name:self.phoneTextfield.text password:self.passwordTextfield.text success:^(id responseObject) {
            NSDictionary *dict = responseObject;
            if (kDictIsEmpty(dict)) {
                
            }else{
                if ([[responseObject objectForKey:@"status"] integerValue] == 1) {
                    PasswordLoginModel *model = [PasswordLoginModel yy_modelWithJSON:responseObject];
                    PasswordLoginData *dataModel = model.data;
                    [PublicUserDefaults setObject:dataModel.Token forKey:@"Token"];
                    [PublicUserDefaults setObject:dataModel.user_id forKey:@"user_id"];
                    [self dismissViewControllerAnimated:YES completion:nil];
                }else{
                    [MBProgressHUD showMessag:dict[@"msg"] toView:self.view];
                }
            }
        } failure:^(NSError *errorMessage) {
            NSLog(@"%@",errorMessage);
        }];
    };
    /** 注册按钮回调 */
    loginView.registerButtonClickBlock = ^(UIButton * _Nonnull sender) {
        NSLog(@"注册按钮回调");
        RegisterViewController *registerView = [[RegisterViewController alloc]init];
        [self.navigationController pushViewController:registerView animated:YES];
    };
    /** 短信登录按钮回调 */
    loginView.messageLoginButtonClickBlock = ^(UIButton * _Nonnull sender) {
        NSLog(@"短信登录按钮回调");
        MessageLoginViewController *messageLoginView = [[MessageLoginViewController alloc]init];
        [self.navigationController pushViewController:messageLoginView animated:YES];
    };
    /** 院校登录按钮回调 */
    loginView.educationalLoginButtonClickBlock = ^(UIButton * _Nonnull sender) {
        NSLog(@"院校登录按钮回调");
        EducationalInstitutionsViewController *educationalInstitutionsView = [[EducationalInstitutionsViewController alloc]init];
        [self.navigationController pushViewController:educationalInstitutionsView animated:YES];
    };
    /** 区县登录按钮回调 */
    loginView.countyLoginButtonClickBlock = ^(UIButton * _Nonnull sender) {
        NSLog(@"区县登录按钮回调");
    };
    /** 密码展示与隐藏按钮回调*/
    loginView.hideOrShowButtonClickBlock = ^(UIButton * _Nonnull sender) {
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

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

@end
