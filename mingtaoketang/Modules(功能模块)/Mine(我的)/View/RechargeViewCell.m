//
//  RechargeViewCell.m
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/4/27.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "RechargeViewCell.h"

@interface RechargeViewCell ()
@property (nonatomic,strong) UIView *bottomView;
/** 金币价格 */
@property (nonatomic,strong) PublicLabel *goldCoinPrice;
/** 销售价格 */
@property (nonatomic,strong) PublicLabel *sellingPrice;
/** 赠送金币个数 */
@property (nonatomic,strong) PublicLabel *sendGoldCoins;

@end

@implementation RechargeViewCell
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self bottomView];
        [self goldCoinPrice];
        [self sellingPrice];
        [self sendGoldCoins];
    }
    return self;
}

- (UIView *)bottomView{
    if (!_bottomView) {
        _bottomView = [[UIView alloc]init];
        _bottomView.layer.cornerRadius = 5;
        _bottomView.backgroundColor = kRandomColor;
        [self.contentView addSubview:_bottomView];
    }
    return _bottomView;
}

- (PublicLabel *)goldCoinPrice{
    if (!_goldCoinPrice) {
        _goldCoinPrice = [PublicLabel labelWithText:@"488币" textColor:[UIColor colorWithHexString:@"#F42B2B"] font:[UIFont systemFontOfSize:18] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self.bottomView addSubview:_goldCoinPrice];
    }
    return _goldCoinPrice;
}

- (PublicLabel *)sellingPrice{
    if (!_sellingPrice) {
        _sellingPrice = [PublicLabel labelWithText:@"售价：488.00元" textColor:[UIColor colorWithHexString:@"#333333"] font:[UIFont systemFontOfSize:14] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self.bottomView addSubview:_sellingPrice];
    }
    return _sellingPrice;
}

- (PublicLabel *)sendGoldCoins{
    if (!_sendGoldCoins) {
        _sendGoldCoins = [PublicLabel labelWithText:@"（ 送0金币 ）" textColor:[UIColor colorWithHexString:@"#A7A7A7"] font:[UIFont systemFontOfSize:12] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self.bottomView addSubview:_sendGoldCoins];
    }
    return _sendGoldCoins;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [_bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView.mas_top).offset(0);
        make.left.mas_equalTo(self.contentView.mas_left).offset(0);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(0);
        make.right.mas_equalTo(self.contentView.mas_right).offset(0);
    }];
    
    [_goldCoinPrice mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.bottomView.mas_centerX).offset(0);
        make.top.mas_equalTo(self.bottomView.mas_top).offset(14);
    }];
    
    [_sellingPrice mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.bottomView.mas_centerX).offset(0);
        make.top.mas_equalTo(self.goldCoinPrice.mas_bottom).offset(9);
    }];
    
    [_sendGoldCoins mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.bottomView.mas_centerX).offset(0);
        make.top.mas_equalTo(self.sellingPrice.mas_bottom).offset(9);
    }];
    
    
    
}

@end
