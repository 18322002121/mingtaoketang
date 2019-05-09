//
//  EducationalInstitutionsViewController.m
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/5/8.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "EducationalInstitutionsViewController.h"
#import "EducationalInstitutionsView.h"
#import "EducationalSelectView.h"

@interface EducationalInstitutionsViewController ()
/** 初始化院校登录view */
@property (nonatomic,strong) EducationalInstitutionsView *educationalView;
/** 院校选择 */
@property (nonatomic,strong) EducationalSelectView *educationalSelectView;
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
    
    [self educationalSelectView];
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
        [UIView animateWithDuration:0.5 animations:^{
            self.educationalSelectView.frame = CGRectMake(0, KScreenHeight - 280, KScreenWidth, 200);
        } completion:^(BOOL finished) {
            
        }];
    };
}

- (EducationalSelectView *)educationalSelectView{
    if (!_educationalSelectView) {
        _educationalSelectView = [[EducationalSelectView alloc]init];
        _educationalSelectView.backgroundColor = [UIColor colorWithRed:0.30 green:0.30 blue:0.30 alpha:1.00];
        _educationalSelectView.frame = CGRectMake(0, KScreenHeight, KScreenWidth, 200);
        [self reloadEducationalSelectView:_educationalSelectView];
        [self.view addSubview:_educationalSelectView];
    }
    return _educationalSelectView;
}


- (void)reloadEducationalSelectView:(EducationalSelectView *)educationalSelectView{
    educationalSelectView.canCelButtonClickBlock = ^(UIButton * _Nonnull sender) {
        [UIView animateWithDuration:0.5 animations:^{
            self.educationalSelectView.frame = CGRectMake(20, KScreenHeight, KScreenWidth, 200);
        } completion:^(BOOL finished) {
            
        }];
    };
}

@end
