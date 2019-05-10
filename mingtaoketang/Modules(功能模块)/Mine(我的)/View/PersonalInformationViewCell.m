//
//  PersonalInformationViewCell.m
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/4/28.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "PersonalInformationViewCell.h"

@interface PersonalInformationViewCell ()
/** 左侧标题 */
@property (nonatomic,strong) PublicLabel *leftTitle;
/** 右侧内容 */
@property (nonatomic,strong) PublicLabel *rightContent;
@end

@implementation PersonalInformationViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style
                    reuseIdentifier:reuseIdentifier]) {
        [self leftTitle];
        [self rightContent];
       
    }
    return self;
}

- (void)setLeftTitles:(NSString *)leftTitles{
    _leftTitle.text = leftTitles;
}

- (void)setRightTitles:(NSString *)rightTitles{
    _rightContent.text = rightTitles;
}

- (PublicLabel *)leftTitle{
    if (!_leftTitle) {
        _leftTitle = [PublicLabel labelWithText:@"" textColor:[UIColor colorWithHexString:@"#272727"] font:[UIFont systemFontOfSize:15] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self.contentView addSubview:_leftTitle];
    }
    return _leftTitle;
}

- (PublicLabel *)rightContent{
    if (!_rightContent) {
        _rightContent = [PublicLabel labelWithText:@"" textColor:[UIColor colorWithHexString:@"#272727"] font:[UIFont systemFontOfSize:15] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self.contentView addSubview:_rightContent];
    }
    return _rightContent;
}

- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    [_leftTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left).offset(27);
        make.centerY.mas_equalTo(self.contentView.mas_centerY).offset(0);
    }];
    
    [_rightContent mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.contentView.mas_right).offset(-27);
        make.centerY.mas_equalTo(self.contentView.mas_centerY).offset(0);
    }];
}

@end
