//
//  FreeAndRecommendationCell.m
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/4/25.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "FreeAndRecommendationCell.h"

@interface FreeAndRecommendationCell ()
@property (nonatomic,strong) UIView *bottomView;
@property (nonatomic,strong) UIImageView *curriculumIcon;
@end

@implementation FreeAndRecommendationCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self bottomView];
        [self curriculumIcon];
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

- (UIImageView *)curriculumIcon{
    if (!_curriculumIcon) {
        _curriculumIcon = [[UIImageView alloc]init];
        _curriculumIcon.backgroundColor = kRandomColor;
        _curriculumIcon.layer.cornerRadius =5;
        [self.bottomView addSubview:_curriculumIcon];
    }
    return _curriculumIcon;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [_bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView.mas_top).offset(0);
        make.left.mas_equalTo(self.contentView.mas_left).offset(0);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(0);
        make.right.mas_equalTo(self.contentView.mas_right).offset(0);
    }];
    
    [_curriculumIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.bottomView.mas_top).offset(0);
        make.left.mas_equalTo(self.bottomView.mas_left).offset(0);
        make.bottom.mas_equalTo(self.bottomView.mas_bottom).offset(0);
        make.right.mas_equalTo(self.bottomView.mas_right).offset(0);
    }];
    
}
@end
