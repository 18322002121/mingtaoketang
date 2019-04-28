//
//  LearningRecordHeaderView.m
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/4/28.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "LearningRecordHeaderView.h"

@interface LearningRecordHeaderView ()
@property (nonatomic,strong) UIView *bottomView;
@property (nonatomic,strong) PublicLabel *titles;
@end

@implementation LearningRecordHeaderView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self bottomView];
        [self titles];
    }
    return self;
}

- (UIView *)bottomView{
    if (!_bottomView) {
        _bottomView = [[UIView alloc]init];
        _bottomView.backgroundColor = kRandomColor;
        _bottomView.layer.cornerRadius = 5;
        [self addSubview:_bottomView];
    }
    return _bottomView;
}

- (PublicLabel *)titles{
    if (!_titles) {
        _titles = [PublicLabel labelWithText:@"一周内" textColor:[UIColor colorWithHexString:@"#333333"] font:BOLDSYSTEMFONT(20) textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self.bottomView addSubview:_titles];
    }
    return _titles;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    [_bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).offset(20);
        make.left.mas_equalTo(self.mas_left).offset(13);
        make.bottom.mas_equalTo(self.mas_bottom).offset(0);
        make.right.mas_equalTo(self.mas_right).offset(-13);
    }];
    
    [_titles mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.bottomView.mas_centerY).offset(0);
        make.left.mas_equalTo(self.bottomView.mas_left).offset(13);
    }];
}

@end
