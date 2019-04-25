//
//  RecommendedTodayCell.m
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/4/25.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "RecommendedTodayCell.h"
@interface RecommendedTodayCell ()
@property (nonatomic,strong) UIView *bottomView;
@property (nonatomic,strong) UIView *iconImage;
@property (nonatomic,strong) PublicLabel *titles;
@end
@implementation RecommendedTodayCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self bottomView];
        [self iconImage];
        [self titles];
    }
    return self;
}

- (UIView *)bottomView{
    if (!_bottomView) {
        _bottomView = [[UIView alloc]init];
        [self.contentView addSubview:_bottomView];
    }
    return _bottomView;
}

- (UIView *)iconImage{
    if (!_iconImage) {
        _iconImage = [[UIImageView alloc]init];
        _iconImage.backgroundColor = kRandomColor;
        _iconImage.layer.cornerRadius = 5;
        [self.bottomView addSubview:_iconImage];
    }
    return _iconImage;
}

- (PublicLabel *)titles{
    if (!_titles) {
        _titles = [PublicLabel labelWithText:@"客服接待必备基础设置" textColor:[UIColor colorWithHexString:@"#333333"] font:[UIFont systemFontOfSize:15] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self.bottomView addSubview:_titles];
    }
    return _titles;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    [_bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView.mas_top).offset(0);
        make.left.mas_equalTo(self.contentView.mas_left).offset(0);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(0);
        make.right.mas_equalTo(self.contentView.mas_right).offset(0);
    }];
    
    [_iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.bottomView.mas_top).offset(0);
        make.left.mas_equalTo(self.bottomView.mas_left).offset(0);
        make.height.mas_offset(@115);
        make.right.mas_equalTo(self.bottomView.mas_right).offset(0);
    }];
    
    [_titles mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.contentView.mas_centerX).offset(0);
        make.top.mas_equalTo(self.iconImage.mas_bottom).offset(5);
    }];
}

@end
