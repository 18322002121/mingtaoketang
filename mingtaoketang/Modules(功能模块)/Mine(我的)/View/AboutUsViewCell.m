//
//  AboutUsViewCell.m
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/4/27.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "AboutUsViewCell.h"
@interface AboutUsViewCell ()
@property (nonatomic,strong) UIView *bottomView;
@property (nonatomic,strong) UIImageView *iconImage;
@property (nonatomic,strong) PublicLabel *titles;
@property (nonatomic,strong) PublicLabel *email;
@end

@implementation AboutUsViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style
                    reuseIdentifier:reuseIdentifier]) {
        [self bottomView];
        [self iconImage];
        [self titles];
        [self email];
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
        _iconImage.layer.cornerRadius = 7;
        [self.bottomView addSubview:_iconImage];
    }
    return _iconImage;
}

- (PublicLabel *)titles{
    if (!_titles) {
        _titles = [PublicLabel labelWithText:@"客服电话" textColor:[UIColor colorWithHexString:@"#333333"] font:[UIFont systemFontOfSize:12] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self.bottomView addSubview:_titles];
    }
    return _titles;
}

- (PublicLabel *)email{
    if (!_email) {
        _email = [PublicLabel labelWithText:@"756123123@qq.com" textColor:[UIColor colorWithHexString:@"#333333"] font:[UIFont systemFontOfSize:12] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self.bottomView addSubview:_email];
    }
    return _email;
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
        make.left.mas_equalTo(self.bottomView.mas_left).offset(10);
        make.centerY.mas_equalTo(self.bottomView.mas_centerY).offset(0);
        make.size.mas_equalTo(CGSizeMake(15, 15));
    }];
    
    [_titles mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.bottomView.mas_centerY).offset(0);
        make.left.mas_equalTo(self.iconImage.mas_right).offset(8);
    }];
    
    [_email mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.bottomView.mas_right).offset(-16);
        make.centerY.mas_equalTo(self.bottomView.mas_centerY).offset(0);
    }];
}


@end
