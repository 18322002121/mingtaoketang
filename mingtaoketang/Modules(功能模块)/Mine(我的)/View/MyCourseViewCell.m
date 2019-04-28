//
//  MyCourseViewCell.m
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/4/28.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "MyCourseViewCell.h"

@interface MyCourseViewCell ()
@property (nonatomic,strong) UIView *bottomView;
/** 课程标题 */
@property (nonatomic,strong) PublicLabel *titles;
/** 剩余时长 */
@property (nonatomic,strong) PublicLabel *remainingTime;
/** 截止日期 */
@property (nonatomic,strong) PublicLabel *closingDate;
/** 继续学习 */
@property (nonatomic,strong) PublicButton *continueLearning;
@end

@implementation MyCourseViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style
                    reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor colorWithHexString:@"#F2F7FA"];
        [self bottomView];
        [self titles];
        [self remainingTime];
        [self closingDate];
        [self continueLearning];
    }
    return self;
}

- (UIView *)bottomView{
    if (!_bottomView) {
        _bottomView = [[UIView alloc]init];
        _bottomView.backgroundColor = [UIColor colorWithHexString:@"#FFFFFF"];
        _bottomView.layer.cornerRadius = 5;
        [self addSubview:_bottomView];
    }
    return _bottomView;
}

- (PublicLabel *)titles{
    if (!_titles) {
        _titles = [PublicLabel labelWithText:@"新人礼包" textColor:[UIColor colorWithHexString:@"#333333"] font:[UIFont boldSystemFontOfSize:18] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self.bottomView addSubview:_titles];
    }
    return _titles;
}

- (PublicLabel *)remainingTime{
    if (!_remainingTime) {
        _remainingTime = [PublicLabel labelWithText:@"剩余时长183天" textColor:[UIColor colorWithHexString:@"#A7A7A7"] font:[UIFont boldSystemFontOfSize:12] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self.bottomView addSubview:_remainingTime];
    }
    return _remainingTime;
}

- (PublicLabel *)closingDate{
    if (!_closingDate) {
        _closingDate = [PublicLabel labelWithText:@"截止日期：2020年04月25日  15:00:00" textColor:[UIColor colorWithHexString:@"#A7A7A7"] font:[UIFont boldSystemFontOfSize:12] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self.bottomView addSubview:_closingDate];
    }
    return _closingDate;
}

- (PublicButton *)continueLearning{
    if (!_continueLearning) {
        _continueLearning = [PublicButton buttonWithImage:@"" backgroundImageImage:@"" title:@"继续学习" titleColor:[UIColor colorWithHexString:@"#FFFFFF"] textFont:[UIFont systemFontOfSize:13] backgroundColor:[UIColor colorWithHexString:@"#1B80F1"] addView:self.bottomView target:self action:@selector(continueLearningClick:)];
        _continueLearning.layer.cornerRadius = 11;
    }
    return _continueLearning;
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
        make.top.mas_equalTo(self.bottomView.mas_top).offset(14);
        make.left.mas_equalTo(self.bottomView.mas_left).offset(18);
    }];
    
    [_remainingTime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.bottomView.mas_right).offset(-10);
        make.centerY.mas_equalTo(self.titles.mas_centerY).offset(0);
    }];
    
    [_closingDate mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.titles.mas_bottom).offset(31);
        make.left.mas_equalTo(self.bottomView.mas_left).offset(18);
    }];
    
    [_continueLearning mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.bottomView.mas_right).offset(-10);
        make.centerY.mas_equalTo(self.closingDate.mas_centerY).offset(0);
        make.size.mas_equalTo(CGSizeMake(72, 22));
    }];
    
}

#pragma mark - 继续学习

- (void)continueLearningClick:(UIButton *)sender{
    !_ContinueLearningClickBlock ? : _ContinueLearningClickBlock(sender);
}

@end
