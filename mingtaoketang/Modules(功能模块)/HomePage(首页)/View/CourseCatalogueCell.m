//
//  CourseCatalogueCell.m
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/5/8.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "CourseCatalogueCell.h"
@interface CourseCatalogueCell ()
/** 播放图标 */
@property (nonatomic,strong) UIImageView *showIcon;
/** 播放标题 */
@property (nonatomic,strong) PublicLabel *titles;
/** 时长 */
@property (nonatomic,strong) PublicLabel *durations;
/** 学习人数 */
@property (nonatomic,strong) PublicLabel *numberLearners;
@end
@implementation CourseCatalogueCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style
                    reuseIdentifier:reuseIdentifier]) {
        [self showIcon];
        [self titles];
        [self durations];
        [self numberLearners];
    }
    return self;
}

- (UIImageView *)showIcon{
    if (!_showIcon) {
        _showIcon = [[UIImageView alloc]init];
        _showIcon.backgroundColor = kRandomColor;
        [self.contentView addSubview:_showIcon];
    }
    return _showIcon;
}

- (PublicLabel *)titles{
    if (!_titles) {
        _titles = [PublicLabel labelWithText:@"01.线上店商品台介绍" textColor:[UIColor colorWithHexString:@"#2393EF"] font:[UIFont systemFontOfSize:14] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self.contentView addSubview:_titles];
    }
    return _titles;
}

- (PublicLabel *)durations{
    if (!_durations) {
        _durations = [PublicLabel labelWithText:@"23分15时长" textColor:[UIColor colorWithHexString:@"#2393EF"] font:[UIFont systemFontOfSize:14] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self.contentView addSubview:_durations];
    }
    return _durations;
}

- (PublicLabel *)numberLearners{
    if (!_numberLearners) {
        _numberLearners = [PublicLabel labelWithText:@"48237人学习" textColor:[UIColor colorWithHexString:@"#2393EF"] font:[UIFont systemFontOfSize:14] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self.contentView addSubview:_numberLearners];
    }
    return _numberLearners;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [_showIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left).offset(25);
        make.top.mas_equalTo(self.contentView.mas_top).offset(20);
        make.size.mas_equalTo(CGSizeMake(16, 16));
    }];
    
    [_titles mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.showIcon.mas_centerY).offset(0);
        make.left.mas_equalTo(self.showIcon.mas_right).offset(14);
    }];
    
    [_durations mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.titles.mas_bottom).offset(21);
        make.left.mas_equalTo(self.titles.mas_left).offset(0);
    }];
    
    [_numberLearners mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.titles.mas_bottom).offset(21);
        make.left.mas_equalTo(self.durations.mas_right).offset(10);
    }];
}

@end
