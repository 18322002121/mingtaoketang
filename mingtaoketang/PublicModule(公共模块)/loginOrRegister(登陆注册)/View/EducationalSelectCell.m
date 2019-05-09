//
//  EducationalSelectCell.m
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/5/8.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "EducationalSelectCell.h"
@interface EducationalSelectCell ()
/** 院校icon */
@property (nonatomic,strong) UIImageView *educationalIcon;
/** 院校名称 */
@property (nonatomic,strong) PublicLabel *educationalName;
@end

@implementation EducationalSelectCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = kRandomColor;
        [self educationalIcon];
        [self educationalName];
    }
    return self;
}

- (UIImageView *)educationalIcon{
    if (!_educationalIcon) {
        _educationalIcon = [[UIImageView alloc]init];
        _educationalIcon.backgroundColor = kRandomColor;
        _educationalIcon.layer.cornerRadius = 5;
        [self.contentView addSubview:_educationalIcon];
    }
    return _educationalIcon;
}

- (PublicLabel *)educationalName{
    if (!_educationalName) {
        _educationalName = [PublicLabel labelWithText:@"广西师范大学漓江学院" textColor:[UIColor colorWithHexString:@"#333333"] font:[UIFont systemFontOfSize:12] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self.contentView addSubview:_educationalName];
    }
    return _educationalName;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [_educationalIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView.mas_top).offset(27);
        make.centerX.mas_equalTo(self.contentView.mas_centerX).offset(0);
        make.size.mas_equalTo(CGSizeMake(44, 44));
    }];
    
    [_educationalName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.educationalIcon.mas_bottom).offset(15);
        make.centerX.mas_equalTo(self.contentView.mas_centerX).offset(0);
    }];
}

@end
