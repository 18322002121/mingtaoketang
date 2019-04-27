//
//  TransactionRecordCell.m
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/4/27.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "TransactionRecordCell.h"

@interface TransactionRecordCell ()
@property (nonatomic,strong) UIView *bottomView;
/** 充值label */
@property (nonatomic,strong) PublicLabel *rechargeLabel;
/** 充值时间 */
@property (nonatomic,strong) PublicLabel *rechargeTime;
/** 充值金额 */
@property (nonatomic,strong) PublicLabel *rechargePrice;

@end

@implementation TransactionRecordCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor colorWithHexString:@"#F2F6F9"];
        [self bottomView];
        [self rechargeLabel];
        [self rechargeTime];
        [self rechargePrice];
    }
    return self;
}

- (UIView *)bottomView{
    if (!_bottomView) {
        _bottomView = [[UIView alloc]init];
        _bottomView.backgroundColor = [UIColor whiteColor];
        _bottomView.layer.cornerRadius = 5;
        [self.contentView addSubview:_bottomView];
    }
    return _bottomView;
}

- (PublicLabel *)rechargeLabel{
    if (!_rechargeLabel) {
        _rechargeLabel = [PublicLabel labelWithText:@"金币充值" textColor:[UIColor colorWithHexString:@"#333333"] font:[UIFont systemFontOfSize:15] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self.bottomView addSubview:_rechargeLabel];
    }
    return _rechargeLabel;
}

- (PublicLabel *)rechargeTime{
    if (!_rechargeTime) {
        _rechargeTime = [PublicLabel labelWithText:@"2019-04-25  15:10:30" textColor:[UIColor colorWithHexString:@"#A7A7A7"] font:[UIFont systemFontOfSize:12] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self.bottomView addSubview:_rechargeTime];
    }
    return _rechargeTime;
}

- (PublicLabel *)rechargePrice{
    if (!_rechargePrice) {
        _rechargePrice = [PublicLabel labelWithText:@"488.00元" textColor:[UIColor colorWithHexString:@"#333333"] font:[UIFont systemFontOfSize:15] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self.bottomView addSubview:_rechargePrice];
    }
    return _rechargePrice;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [_bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView.mas_top).offset(18);
        make.left.mas_equalTo(self.contentView.mas_left).offset(13);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(0);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-13);
    }];
    
    [_rechargeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.bottomView.mas_top).offset(18);
        make.left.mas_equalTo(self.bottomView.mas_left).offset(16);
    }];
    
    [_rechargeTime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.bottomView.mas_left).offset(16);
        make.top.mas_equalTo(self.rechargeLabel.mas_bottom).offset(13);
    }];
    
    [_rechargePrice mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.bottomView.mas_centerY).offset(0);
        make.right.mas_equalTo(self.bottomView.mas_right).offset(-18);
    }];
    
}

@end
