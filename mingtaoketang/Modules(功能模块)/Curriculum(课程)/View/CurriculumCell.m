//
//  CurriculumCell.m
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/4/26.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "CurriculumCell.h"
#import "CurriculumViewModel.h"

@interface CurriculumCell ()
@property (nonatomic,strong) UIView *bottomView;
@property (nonatomic,strong) UIImageView *iconImage;
@property (nonatomic,strong) PublicLabel *titles;
@end
@implementation CurriculumCell

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
        _bottomView.layer.cornerRadius = 5;
        [self.contentView addSubview:_bottomView];
    }
    return _bottomView;
}

- (UIImageView *)iconImage{
    if (!_iconImage) {
        _iconImage = [[UIImageView alloc]init];
        _iconImage.layer.cornerRadius = 25;
        [self.bottomView addSubview:_iconImage];
    }
    return _iconImage;
}

- (PublicLabel *)titles{
    if (!_titles) {
        _titles = [PublicLabel labelWithText:@"" textColor:[UIColor colorWithHexString:@"#333333"] font:[UIFont systemFontOfSize:14] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
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
        make.top.mas_equalTo(self.bottomView.mas_top).offset(5);
        make.centerX.mas_equalTo(self.bottomView.mas_centerX).offset(0);
        make.size.mas_equalTo(CGSizeMake(50, 50));
    }];
    
    [_titles mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.bottomView.mas_centerX).offset(0);
        make.top.mas_equalTo(self.iconImage.mas_bottom).offset(10);
    }];
}

- (void)setChildrenModel:(CurriculumViewChildren *)childrenModel{
    _childrenModel = childrenModel;
    [_iconImage sd_setImageWithURL:[NSURL URLWithString:childrenModel.cat_icon] placeholderImage:[UIImage imageNamed:@""]];
    _titles.text = childrenModel.cat_name;
}

@end
