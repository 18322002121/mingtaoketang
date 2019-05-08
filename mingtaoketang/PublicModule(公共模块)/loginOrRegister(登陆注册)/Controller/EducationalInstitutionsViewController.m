//
//  EducationalInstitutionsViewController.m
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/5/8.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "EducationalInstitutionsViewController.h"
#import "EducationalInstitutionsView.h"

@interface EducationalInstitutionsViewController ()
/** 初始化院校登录view */
@property (nonatomic,strong) EducationalInstitutionsView *educationalView;
@end

@implementation EducationalInstitutionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"院校登陆";
    _educationalView = [[EducationalInstitutionsView alloc]init];
    [self.view addSubview:_educationalView];
    [self reloadEducationalInstitutionsView:_educationalView];
    [_educationalView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view.mas_top).offset(0);
        make.left.mas_equalTo(self.view.mas_left).offset(0);
        make.bottom.mas_equalTo(self.view.mas_bottom).offset(0);
        make.right.mas_equalTo(self.view.mas_right).offset(0);
    }];
}

- (void)reloadEducationalInstitutionsView:(EducationalInstitutionsView *)loginView{
    /** 登陆按钮回调 */
    loginView.loginButtonClickBlock = ^(UIButton * _Nonnull sender) {
        NSLog(@"登陆按钮回调");
    };
    /** 发送验证码按钮回调 */
    loginView.sendVerificationButtonClickBlock = ^(UIButton * _Nonnull sender) {
        NSLog(@"发送验证码按钮回调");
    };
    /** 院校选择按钮回调 */
    loginView.educationalButtonClickBlock = ^(UIButton * _Nonnull sender) {
        NSLog(@"院校选择按钮回调");
    };
}

@end
