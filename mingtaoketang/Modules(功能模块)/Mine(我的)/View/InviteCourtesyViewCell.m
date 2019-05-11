//
//  InviteCourtesyViewCell.m
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/5/11.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "InviteCourtesyViewCell.h"
@interface InviteCourtesyViewCell ()
/** 左侧标题 */
@property (nonatomic,strong) PublicLabel *leftTitle;
@property (nonatomic,strong) UIImageView *iconImage;
@property (nonatomic,strong) PublicLabel *rightTitle;
@end

@implementation InviteCourtesyViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style
                    reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self leftTitle];
        [self iconImage];
        [self rightTitle];
    }
    return self;
}

- (PublicLabel *)leftTitle{
    if (!_leftTitle) {
        _leftTitle = [PublicLabel labelWithText:@"头像" textColor:[UIColor colorWithHexString:@"#272727"] font:[UIFont systemFontOfSize:15] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self.contentView addSubview:_leftTitle];
    }
    return _leftTitle;
}

- (PublicLabel *)rightTitle{
    if (!_rightTitle) {
        _rightTitle = [PublicLabel labelWithText:@"" textColor:[UIColor colorWithHexString:@"#272727"] font:[UIFont systemFontOfSize:15] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self.contentView addSubview:_rightTitle];
    }
    return _rightTitle;
}

- (UIImageView *)iconImage{
    if (!_iconImage) {
        _iconImage = [[UIImageView alloc]init];
        _iconImage.image = [UIImage imageNamed:@"right"];
        [self.contentView addSubview:_iconImage];
    }
    return _iconImage;
}

- (void)setLeftTitles:(NSString *)leftTitles{
    _leftTitle.text = leftTitles;
}

- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    [_leftTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left).offset(18);
        make.centerY.mas_equalTo(self.contentView.mas_centerY).offset(0);
    }];
    
    [_iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.contentView.mas_right).offset(-28);
        make.centerY.mas_equalTo(self.contentView.mas_centerY).offset(0);
        make.size.mas_equalTo(CGSizeMake(7, 12));
    }];
    
    [_rightTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView.mas_centerY).offset(0);
        make.right.mas_equalTo(self.iconImage.mas_left).offset(-14);
    }];
}

@end
