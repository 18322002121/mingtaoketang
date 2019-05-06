//
//  RotationChartCell.m
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/4/25.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "RotationChartCell.h"

@interface RotationChartCell ()<SDCycleScrollViewDelegate>
@property (nonatomic,strong) UIView *bottomView;
@property (nonatomic,strong) SDCycleScrollView *bannerImageView;
@end
@implementation RotationChartCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self bottomView];
        [self bannerImageView];
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

- (void)layoutSubviews{
    [super layoutSubviews];
    [_bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView.mas_top).offset(13);
        make.left.mas_equalTo(self.contentView.mas_left).offset(0);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(0);
        make.right.mas_equalTo(self.contentView.mas_right).offset(0);
    }];
    
    [_bannerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.bottomView.mas_top).offset(0);
        make.left.mas_equalTo(self.bottomView.mas_left).offset(0);
        make.bottom.mas_equalTo(self.bottomView.mas_bottom).offset(0);
        make.right.mas_equalTo(self.bottomView.mas_right).offset(0);
    }];
}

- (void)setBannerArray:(NSMutableArray *)bannerArray{
    _bannerArray = bannerArray;
    _bannerImageView.imageURLStringsGroup = self.bannerArray;
    
}

- (SDCycleScrollView *)bannerImageView{
    if (!_bannerImageView) {
        _bannerImageView = [[SDCycleScrollView alloc]init];
        _bannerImageView.layer.cornerRadius = 5;
        _bannerImageView.delegate = self;
        _bannerImageView.autoScrollTimeInterval = 5.0;
        [self.bottomView addSubview:_bannerImageView];
    }
    return _bannerImageView;
}

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {
    NSLog(@"banner图点击事件");
    !_DidSelectItemAtIndex ? : _DidSelectItemAtIndex(index);
}

@end
