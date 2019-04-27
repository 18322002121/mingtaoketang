//
//  RechargeHeaderView.m
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/4/27.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "RechargeHeaderView.h"

@interface RechargeHeaderView ()

@property (nonatomic,strong) UIView *bottomView;
/** 余额视图 */
@property (nonatomic,strong) UIView *balanceView;
/** 余额图标 */
@property (nonatomic,strong) UIImageView *balanceIcon;
/** 余额 */
@property (nonatomic,strong) PublicLabel *balancePrice;
/** 购买记录按钮 */
@property (nonatomic,strong) PublicButton *purchaseRecordButton;
/** 充值金额label */
@property (nonatomic,strong) PublicLabel *rechargeAmountLabel;

@end

@implementation RechargeHeaderView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self bottomView];
        [self balanceView];
        [self balanceIcon];
        [self balancePrice];
        [self purchaseRecordButton];
        [self rechargeAmountLabel];
    }
    return self;
}

- (UIView *)bottomView{
    if (!_bottomView) {
        _bottomView = [[UIView alloc]init];
        [self addSubview:_bottomView];
    }
    return _bottomView;
}

- (UIView *)balanceView{
    if (!_balanceView) {
        _balanceView = [[UIView alloc]init];
        _balanceView.backgroundColor = kRandomColor;
        [self addSubview:_balanceView];
    }
    return _balanceView;
}

- (UIImageView *)balanceIcon{
    if (!_balanceIcon) {
        _balanceIcon = [[UIImageView alloc]init];
        _balanceIcon.backgroundColor = kRandomColor;
        _balanceIcon.layer.cornerRadius = 10;
        [self.balanceView addSubview:_balanceIcon];
    }
    return _balanceIcon;
}

- (PublicLabel *)balancePrice{
    if (!_balancePrice) {
        _balancePrice = [PublicLabel labelWithText:@"50 金币" textColor:[UIColor colorWithHexString:@"#FFFFFF"] font:[UIFont systemFontOfSize:20] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self.balanceView addSubview:_balancePrice];
    }
    return _balancePrice;
}

- (PublicButton *)purchaseRecordButton{
    if (!_purchaseRecordButton) {
        _purchaseRecordButton = [PublicButton buttonWithFrame:CGRectMake(0, 0, 0, 0) buttonEdgeInsetsStyle:(UIButtonEdgeInsetsStyleRight) image:@"" backgroundImageImage:@"" title:@"购买记录" titleColor:[UIColor colorWithHexString:@"#FFFFFF"] textFont:[UIFont systemFontOfSize:12] backgroundColor:[UIColor clearColor] addView:self.balanceView target:self action:@selector(purchaseRecordClick:)];
    }
    return _purchaseRecordButton;
}

- (PublicLabel *)rechargeAmountLabel{
    if (!_rechargeAmountLabel) {
        _rechargeAmountLabel = [PublicLabel labelWithText:@"选择充值金额" textColor:[UIColor colorWithHexString:@"#333333"] font:[UIFont systemFontOfSize:18] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self.bottomView addSubview:_rechargeAmountLabel];
    }
    return _rechargeAmountLabel;
}


- (void)layoutSubviews{
    [super layoutSubviews];
    [_bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).offset(0);
        make.left.mas_equalTo(self.mas_left).offset(0);
        make.bottom.mas_equalTo(self.mas_bottom).offset(0);
        make.right.mas_equalTo(self.mas_right).offset(0);
    }];
    
    [_balanceView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.bottomView.mas_top).offset(0);
        make.left.mas_equalTo(self.bottomView.mas_left).offset(0);
        make.right.mas_equalTo(self.bottomView.mas_right).offset(0);
        make.height.mas_offset(@125);
    }];
    
    [_balanceIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.bottomView.mas_top).offset(38);
        make.left.mas_equalTo(self.bottomView.mas_left).offset(148);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    
    [_balancePrice mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.balanceIcon.mas_right).offset(7);
        make.centerY.mas_equalTo(self.balanceIcon.mas_centerY).offset(0);
    }];
    
    [_purchaseRecordButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.balanceView.mas_centerX).offset(0);
        make.top.mas_equalTo(self.balancePrice.mas_bottom).offset(27);
        make.size.mas_equalTo(CGSizeMake(50, 12));
    }];
    
    [_rechargeAmountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.bottomView.mas_centerX).offset(0);
        make.top.mas_equalTo(self.balanceView.mas_bottom).offset(26);
    }];
    
}

- (void)purchaseRecordClick:(UIButton *)sender{
    !_PurchaseRecordClickBlock ? : _PurchaseRecordClickBlock(sender);
}

@end
