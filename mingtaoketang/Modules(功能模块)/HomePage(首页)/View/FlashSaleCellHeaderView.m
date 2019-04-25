//
//  FlashSaleCellHeaderView.m
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/4/25.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "FlashSaleCellHeaderView.h"
@interface FlashSaleCellHeaderView ()
@property (nonatomic,strong) UIView *bottomView;
@property (nonatomic,strong) PublicLabel *titles;
@end
@implementation FlashSaleCellHeaderView
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
        _bottomView.layer.cornerRadius = 5;
        [self addSubview:_bottomView];
    }
    return _bottomView;
}

- (PublicLabel *)titles{
    if (!_titles) {
        
        _titles = [PublicLabel labelWithText:@"限时抢购" textColor:[UIColor colorWithHexString:@"#333333"] font:BOLDSYSTEMFONT(22) textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self.bottomView addSubview:_titles];
    }
    return _titles;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [_bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).offset(0);
        make.left.mas_equalTo(self.mas_left).offset(0);
        make.bottom.mas_equalTo(self.mas_bottom).offset(0);
        make.right.mas_equalTo(self.mas_right).offset(0);
    }];
    
    [_titles mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.bottomView.mas_centerX).offset(0);
        make.centerY.mas_equalTo(self.bottomView.mas_centerY).offset(0);
    }];
    
}

@end
