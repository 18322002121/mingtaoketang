//
//  MineHeaderView.m
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/4/26.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "MineHeaderView.h"
@interface MineHeaderView ()
@property (nonatomic,strong) UIView *bottomView;
/** 背景图片 */
@property (nonatomic,strong) UIImageView *iconImage;
/** 头像图片 */
@property (nonatomic,strong) UIImageView *headPortrait;
/** 用户名 */
@property (nonatomic,strong) PublicLabel *userName;
/** 充值背景视图 */
@property (nonatomic,strong) UIView *rechargebottomView;
/** 金钱图标 */
@property (nonatomic,strong) UIImageView *moneyIcon;
/** 金钱余额 */
@property (nonatomic,strong) PublicLabel *moneyBalance;
/** 充值按钮 */
@property (nonatomic,strong) PublicButton *rechargeButton;
/** 设置按钮 */
@property (nonatomic,strong) PublicButton *setTingButton;
/** 院校按钮 */
@property (nonatomic,strong) PublicButton *educationalInstitutionsButton;
/** 查看个人信息按钮 */
@property (nonatomic,strong) PublicButton *personalInformation;
@end

@implementation MineHeaderView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self bottomView];
        [self iconImage];
        [self headPortrait];
        [self userName];
        [self rechargebottomView];
        [self moneyIcon];
        [self moneyBalance];
        [self rechargeButton];
        [self setTingButton];
        [self educationalInstitutionsButton];
        [self personalInformation];
    }
    return self;
}

- (UIView *)bottomView{
    if (!_bottomView) {
        _bottomView = [[UIView alloc]init];
        _bottomView.backgroundColor = [UIColor colorWithHexString:@"#FFFFFF"];
        [self addSubview:_bottomView];
    }
    return _bottomView;
}

- (UIImageView *)iconImage{
    if (!_iconImage) {
        _iconImage = [[UIImageView alloc]init];
        _iconImage.backgroundColor = kRandomColor;
        [self.bottomView addSubview:_iconImage];
    }
    return _iconImage;
}

- (PublicButton *)personalInformation{
    if (!_personalInformation) {
        _personalInformation = [PublicButton buttonWithImage:@"" backgroundImageImage:@"" title:@"" titleColor:[UIColor whiteColor] textFont:[UIFont systemFontOfSize:13] backgroundColor:kRandomColor addView:self.bottomView target:self action:@selector(personalInformationClick:)];
        _personalInformation.layer.cornerRadius = 38;
    }
    return _personalInformation;
}

- (UIImageView *)headPortrait{
    if (!_headPortrait) {
        _headPortrait = [[UIImageView alloc]init];
        _headPortrait.layer.cornerRadius = 38;
        _headPortrait.backgroundColor = kRandomColor;
        [self.bottomView addSubview:_headPortrait];
    }
    return _headPortrait;
}

- (PublicLabel *)userName{
    if (!_userName) {
        _userName = [PublicLabel labelWithText:@"" textColor:[UIColor colorWithHexString:@"#333333"] font:[UIFont systemFontOfSize:15] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self.bottomView addSubview:_userName];
    }
    return _userName;
}

- (UIView *)rechargebottomView{
    if (!_rechargebottomView) {
        _rechargebottomView = [[UIView alloc]init];
        _rechargebottomView.backgroundColor = [UIColor colorWithRed:1.00 green:1.00 blue:1.00 alpha:1.00];
        _rechargebottomView.layer.cornerRadius =5;
        [self addSubview:_rechargebottomView];
        [self bottomViews:_rechargebottomView];
    }
    return _rechargebottomView;
}

- (UIImageView *)moneyIcon{
    if (!_moneyIcon) {
        _moneyIcon = [[UIImageView alloc]init];
        _moneyIcon.layer.cornerRadius = 10;
        _moneyIcon.backgroundColor = kRandomColor;
        [self.rechargebottomView addSubview:_moneyIcon];
    }
    return _moneyIcon;
}

- (void)setUser_Money:(NSString *)userMoney userName:(NSString *)userName{
    _moneyBalance.text = [NSString stringWithFormat:@"%@金币",userMoney];
    _userName.text = userName;
}

- (PublicLabel *)moneyBalance{
    if (!_moneyBalance) {
        _moneyBalance = [PublicLabel labelWithText:@"" textColor:[UIColor colorWithHexString:@"#333333"] font:[UIFont systemFontOfSize:14] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self.rechargebottomView addSubview:_moneyBalance];
    }
    return _moneyBalance;
}

- (PublicButton *)rechargeButton{
    if (!_rechargeButton) {
        _rechargeButton = [PublicButton buttonWithImage:@"" backgroundImageImage:@"" title:@"充值" titleColor:[UIColor colorWithHexString:@"#FFFFFF"] textFont:[UIFont systemFontOfSize:13] backgroundColor:[UIColor colorWithHexString:@"#1B80F1"] addView:self.rechargebottomView target:self action:@selector(rechargeClick:)];
        _rechargeButton.layer.cornerRadius = 11;
    }
    return _rechargeButton;
}

- (PublicButton *)setTingButton{
    if (!_setTingButton) {
        _setTingButton = [PublicButton buttonWithImage:@"" backgroundImageImage:@"" title:@"" titleColor:[UIColor whiteColor] textFont:[UIFont systemFontOfSize:13] backgroundColor:kRandomColor addView:self.bottomView target:self action:@selector(setTingClick:)];
        _setTingButton.layer.cornerRadius = 10;
    }
    return _setTingButton;
}

- (PublicButton *)educationalInstitutionsButton{
    if (!_educationalInstitutionsButton) {
        _educationalInstitutionsButton = [PublicButton buttonWithImage:@"" backgroundImageImage:@"" title:@"院校" titleColor:[UIColor whiteColor] textFont:[UIFont systemFontOfSize:15] backgroundColor:[UIColor clearColor] addView:self.bottomView target:self action:@selector(educationalInstitutionsClick:)];
    }
    return _educationalInstitutionsButton;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [_bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).offset(0);
        make.left.mas_equalTo(self.mas_left).offset(0);
        make.bottom.mas_equalTo(self.mas_bottom).offset(0);
        make.right.mas_equalTo(self.mas_right).offset(0);
    }];
    
    [_iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.bottomView.mas_top).offset(0);
        make.left.mas_equalTo(self.bottomView.mas_left).offset(0);
        make.right.mas_equalTo(self.bottomView.mas_right).offset(0);
        make.height.mas_offset(@133);
    }];
    
    [_headPortrait mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.bottomView.mas_top).offset(78);
        make.centerX.mas_equalTo(self.bottomView.mas_centerX).offset(0);
        make.size.mas_equalTo(CGSizeMake(76, 76));
    }];
    
    [_personalInformation mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.headPortrait.mas_left).offset(0);
        make.right.mas_equalTo(self.headPortrait.mas_right).offset(0);
        make.top.mas_equalTo(self.headPortrait.mas_top).offset(0);
        make.bottom.mas_equalTo(self.headPortrait.mas_bottom).offset(0);
    }];
    
    [_userName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.bottomView.mas_centerX).offset(0);
        make.top.mas_equalTo(self.headPortrait.mas_bottom).offset(5);
    }];
    
    [_rechargebottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.userName.mas_bottom).offset(22);
        make.left.mas_equalTo(self.bottomView.mas_left).offset(21);
        make.right.mas_equalTo(self.bottomView.mas_right).offset(-21);
        make.height.mas_offset(@54);
    }];
    
    [_moneyIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.rechargebottomView.mas_centerY).offset(0);
        make.left.mas_equalTo(self.rechargebottomView.mas_left).offset(14);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    
    [_moneyBalance mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.moneyIcon.mas_right).offset(5);
        make.centerY.mas_equalTo(self.moneyIcon.mas_centerY).offset(0);
    }];
    
    [_rechargeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.rechargebottomView.mas_right).offset(-14);
        make.centerY.mas_equalTo(self.rechargebottomView.mas_centerY).offset(0);
        make.size.mas_equalTo(CGSizeMake(60, 22));
    }];
    
    [_setTingButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.bottomView.mas_right).offset(-12);
        make.top.mas_equalTo(self.bottomView.mas_top).offset(16);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    
    [_educationalInstitutionsButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.bottomView.mas_left).offset(16);
        make.top.mas_equalTo(self.bottomView.mas_top).offset(19);
        make.size.mas_equalTo(CGSizeMake(30, 15));
    }];

}

#pragma mark - 设置阴影效果

- (void)bottomViews:(UIView *)bottomViews {
    bottomViews.layer.shadowColor = [UIColor blackColor].CGColor;//shadowColor阴影颜色
    bottomViews.layer.shadowOffset = CGSizeMake(0,5);//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
    bottomViews.layer.shadowOpacity = 0.5;//阴影透明度，默认0
    bottomViews.layer.shadowRadius = 5;//阴影半径，默认3
}

#pragma mark -充值按钮

- (void)rechargeClick:(UIButton *)sender{
    !_RechargeClickBlock ? : _RechargeClickBlock(sender);
}

#pragma mark - 设置按钮

- (void)setTingClick:(UIButton *)sender{
    !_SetTingClickBlock ? : _SetTingClickBlock(sender);
}

#pragma mark - 院校按钮

- (void)educationalInstitutionsClick:(UIButton *)sender{
    !_EducationalInstitutionsClickBlock ? : _EducationalInstitutionsClickBlock(sender);
}

#pragma mark - 查看个人信息按钮

- (void)personalInformationClick:(UIButton *)sender{
    !_PersonalInformationClickBlock ? : _PersonalInformationClickBlock(sender);
}

@end
