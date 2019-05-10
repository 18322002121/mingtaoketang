//
//  HeadPortraitCell.m
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/5/9.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "HeadPortraitCell.h"
@interface HeadPortraitCell ()
/** 左侧标题 */
@property (nonatomic,strong) PublicLabel *leftTitle;

@end

@implementation HeadPortraitCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style
                    reuseIdentifier:reuseIdentifier]) {
        [self leftTitle];
        [self headPortraitImage];
        
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

- (UIImageView *)headPortraitImage{
    if (!_headPortraitImage) {
        _headPortraitImage = [[UIImageView alloc]init];
        _headPortraitImage.backgroundColor = kRandomColor;
        _headPortraitImage.layer.cornerRadius = 30;
        [self.contentView addSubview:_headPortraitImage];
    }
    return _headPortraitImage;
}

- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    [_leftTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left).offset(27);
        make.centerY.mas_equalTo(self.contentView.mas_centerY).offset(0);
    }];
    
    [_headPortraitImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.contentView.mas_right).offset(-27);
        make.centerY.mas_equalTo(self.contentView.mas_centerY).offset(0);
        make.size.mas_equalTo(CGSizeMake(60, 60));
    }];
}
@end
