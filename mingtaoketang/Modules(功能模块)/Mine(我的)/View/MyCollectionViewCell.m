//
//  MyCollectionViewCell.m
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/4/27.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "MyCollectionViewCell.h"

@interface MyCollectionViewCell ()
@property (nonatomic,strong) UIView *bottomView;
/** 标题 */
@property (nonatomic,strong) PublicLabel *titles;
/** 取消收藏 */
@property (nonatomic,strong) PublicButton *cancelCollectionButton;
/** 展示icon */
@property (nonatomic,strong) UIImageView *showIcon;

@end

@implementation MyCollectionViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor colorWithHexString:@"#F2F7FA"];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self bottomView];
        [self titles];
        [self cancelCollectionButton];
        [self showIcon];
    }
    return self;
}

- (UIView *)bottomView{
    if (!_bottomView) {
        _bottomView = [[UIView alloc]init];
        _bottomView.backgroundColor = [UIColor colorWithHexString:@"#FFFFFF"];
        _bottomView.layer.cornerRadius = 5;
        [self.contentView addSubview:_bottomView];
    }
    return _bottomView;
}

- (PublicLabel *)titles{
    if (!_titles) {
        _titles = [PublicLabel labelWithText:@"0基础快速建站" textColor:[UIColor colorWithHexString:@"#333333"] font:[UIFont systemFontOfSize:18] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self.bottomView addSubview:_titles];
    }
    return _titles;
}

- (PublicButton *)cancelCollectionButton{
    if (!_cancelCollectionButton) {
        _cancelCollectionButton = [PublicButton buttonWithImage:@"" backgroundImageImage:@"" title:@"取消收藏" titleColor:[UIColor colorWithHexString:@"#2393EF"] textFont:[UIFont systemFontOfSize:13] backgroundColor:[UIColor clearColor] addView:self.bottomView target:self action:@selector(cancelCollectionClick:)];
    }
    return _cancelCollectionButton;
}

- (UIImageView *)showIcon{
    if (!_showIcon) {
        _showIcon = [[UIImageView alloc]init];
        _showIcon.backgroundColor = kRandomColor;
        _showIcon.layer.cornerRadius = 5;
        [self.bottomView addSubview:_showIcon];
    }
    return _showIcon;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [_bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView.mas_top).offset(18);
        make.left.mas_equalTo(self.contentView.mas_left).offset(13);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(0);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-13);
    }];
    
    [_titles mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.bottomView.mas_left).offset(17);
        make.top.mas_equalTo(self.bottomView.mas_top).offset(18);
    }];
    
    [_cancelCollectionButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.bottomView.mas_left).offset(17);
        make.top.mas_equalTo(self.titles.mas_bottom).offset(22);
        make.size.mas_equalTo(CGSizeMake(51, 13));
    }];
    
    [_showIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.bottomView.mas_centerY).offset(0);
        make.right.mas_equalTo(self.bottomView.mas_right).offset(-11);
        make.size.mas_equalTo(CGSizeMake(90, 66));
    }];
}

#pragma mark - 取消收藏

- (void)cancelCollectionClick:(UIButton *)sender{
    !_CancelCollectionClickBlock ? : _CancelCollectionClickBlock(sender);
}

@end
