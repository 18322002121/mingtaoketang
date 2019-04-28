//
//  OnlineConsultationCell.m
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/4/28.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "OnlineConsultationCell.h"

@interface OnlineConsultationCell ()
@property (nonatomic,strong) UIView *bottomView;
/** 标题 */
@property (nonatomic,strong) PublicLabel *titlesLabel;
/** 选填状态 */
@property (nonatomic,strong) PublicLabel *selectiveFilling;
/** 输入框 */
@property (nonatomic,strong) UITextField *inputBoxTextfield;

@end

@implementation OnlineConsultationCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style
                    reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor colorWithHexString:@"#F2F7FA"];
        [self bottomView];
        [self titlesLabel];
        [self selectiveFilling];
        [self inputBoxTextfield];
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

- (PublicLabel *)titlesLabel{
    if (!_titlesLabel) {
        _titlesLabel = [PublicLabel labelWithText:@"您的姓名" textColor:[UIColor colorWithHexString:@"#333333"] font:[UIFont boldSystemFontOfSize:15] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self.bottomView addSubview:_titlesLabel];
    }
    return _titlesLabel;
}

- (PublicLabel *)selectiveFilling{
    if (!_selectiveFilling) {
        _selectiveFilling = [PublicLabel labelWithText:@"(必填)" textColor:[UIColor colorWithHexString:@"#2393EE"] font:[UIFont boldSystemFontOfSize:15] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self.bottomView addSubview:_selectiveFilling];
    }
    return _selectiveFilling;
}

- (UITextField *)inputBoxTextfield{
    if (!_inputBoxTextfield) {
        _inputBoxTextfield = [[UITextField alloc]init];
        _inputBoxTextfield.placeholder = @"请输入文字";
        _inputBoxTextfield.borderStyle = UITextBorderStyleRoundedRect;
        [self.bottomView addSubview:_inputBoxTextfield];
    }
    return _inputBoxTextfield;
}





- (void)layoutSubviews{
    [super layoutSubviews];
    [_bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).offset(20);
        make.left.mas_equalTo(self.mas_left).offset(13);
        make.bottom.mas_equalTo(self.mas_bottom).offset(0);
        make.right.mas_equalTo(self.mas_right).offset(-13);
    }];
    
    [_titlesLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left).offset(48);
        make.top.mas_equalTo(self.bottomView.mas_top).offset(10);
    }];
    
    [_selectiveFilling mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.titlesLabel.mas_right).offset(7);
        make.centerY.mas_equalTo(self.titlesLabel.mas_centerY).offset(0);
    }];
    
    [_inputBoxTextfield mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.titlesLabel.mas_bottom).offset(13);
        make.left.mas_equalTo(self.bottomView.mas_left).offset(0);
        make.right.mas_equalTo(self.bottomView.mas_right).offset(0);
        make.height.mas_offset(@50);
    }];
    
}

@end
