//
//  InformationViewCell.m
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/5/7.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "InformationViewCell.h"
#import "InformationViewModel.h"

@interface InformationViewCell ()
@property (nonatomic,strong) UIView *bottomView;
/** 日期 */
@property (nonatomic,strong) PublicLabel *dates;
/** 展示图片 */
@property (nonatomic,strong) UIImageView *showImage;
/** 内容标题 */
@property (nonatomic,strong) PublicLabel *contentTitle;
@end

@implementation InformationViewCell
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self bottomView];
        [self dates];
        [self showImage];
        [self contentTitle];
    }
    return self;
}

- (UIView *)bottomView{
    if (!_bottomView) {
        _bottomView = [[UIView alloc]init];
        _bottomView.backgroundColor = [UIColor colorWithRed:0.94 green:0.95 blue:0.96 alpha:1.00];
        _bottomView.layer.cornerRadius = 5;
        [self.contentView addSubview:_bottomView];
    }
    return _bottomView;
}

- (UIImageView *)showImage{
    if (!_showImage) {
        _showImage = [[UIImageView alloc]init];
        _showImage.backgroundColor = kRandomColor;
        _showImage.layer.cornerRadius = 5;
        [self.bottomView addSubview:_showImage];
    }
    return _showImage;
}

- (PublicLabel *)dates{
    if (!_dates) {
        _dates = [PublicLabel labelWithText:@"2019-02-01" textColor:[UIColor colorWithHexString:@"#333333"] font:[UIFont systemFontOfSize:12] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self.bottomView addSubview:_dates];
    }
    return _dates;
}

- (PublicLabel *)contentTitle{
    if (!_contentTitle) {
        _contentTitle = [PublicLabel labelWithText:@"中润普达战略入资名淘教育科技，深耕人工智 能+教育应用场景" textColor:[UIColor colorWithHexString:@"#333333"] font:[UIFont systemFontOfSize:16] textAlignment:NSTextAlignmentLeft backgroundColor:[UIColor clearColor]];
        _contentTitle.lineBreakMode = NSLineBreakByWordWrapping;
        _contentTitle.numberOfLines = 0;
        [self.bottomView addSubview:_contentTitle];
    }
    return _contentTitle;
}


- (void)layoutSubviews{
    [super layoutSubviews];
    
    [_bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView.mas_top).offset(0);
        make.left.mas_equalTo(self.contentView.mas_left).offset(0);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(0);
        make.right.mas_equalTo(self.contentView.mas_right).offset(0);
    }];
    
    [_dates mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.bottomView.mas_centerX).offset(0);
        make.top.mas_equalTo(self.bottomView.mas_top).offset(24);
    }];
    
    [_showImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.bottomView.mas_left).offset(0);
        make.right.mas_equalTo(self.contentView.mas_right).offset(0);
        make.top.mas_equalTo(self.dates.mas_bottom).offset(16);
        make.height.mas_offset(@191);
    }];
    
    [_contentTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.bottomView.mas_left).offset(16);
        make.right.mas_equalTo(self.bottomView.mas_right).offset(-16);
        make.top.mas_equalTo(self.showImage.mas_bottom).offset(10);
        make.bottom.mas_equalTo(self.bottomView.mas_bottom).offset(-5);
    }];
}

- (void)setInformationModel:(InformationViewData *)informationModel{
    _informationModel = informationModel;
    _contentTitle.text = informationModel.title;
    [_showImage sd_setImageWithURL:[NSURL URLWithString:informationModel.file_url] placeholderImage:[UIImage imageNamed:@""]];
    _dates.text = informationModel.add_time;
}

@end
