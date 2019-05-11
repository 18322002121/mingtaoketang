//
//  InviteCourtesyHeaderView.m
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/5/11.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "InviteCourtesyHeaderView.h"
@interface InviteCourtesyHeaderView ()
@property (nonatomic,strong) UIView *bottomView;
@property (nonatomic,strong) UIImageView *invitationCodeImage;
@end
@implementation InviteCourtesyHeaderView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self bottomView];
        [self invitationCodeImage];
    }
    return self;
}

- (UIView *)bottomView{
    if (!_bottomView) {
        _bottomView = [[UIView alloc]init];
        _bottomView.backgroundColor = kRandomColor;
        [self addSubview:_bottomView];
    }
    return _bottomView;
}

- (UIImageView *)invitationCodeImage{
    if (!_invitationCodeImage) {
        _invitationCodeImage = [[UIImageView alloc]init];
        _invitationCodeImage.backgroundColor = kRandomColor;
        [self.bottomView addSubview:_invitationCodeImage];
    }
    return _invitationCodeImage;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [_bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).offset(0);
        make.left.mas_equalTo(self.mas_left).offset(0);
        make.bottom.mas_equalTo(self.mas_bottom).offset(0);
        make.right.mas_equalTo(self.mas_right).offset(0);
    }];
    
    [_invitationCodeImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.bottomView.mas_centerX).offset(0);
        make.top.mas_equalTo(self.bottomView.mas_top).offset(341);
        make.size.mas_equalTo(CGSizeMake(110, 110));
    }];
}

@end
