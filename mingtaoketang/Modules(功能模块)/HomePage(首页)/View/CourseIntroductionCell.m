//
//  CourseIntroductionCell.m
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/5/8.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "CourseIntroductionCell.h"
@interface CourseIntroductionCell ()
/** 课程简介 */
@property (nonatomic,strong) PublicLabel *titles;
@end

@implementation CourseIntroductionCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style
                    reuseIdentifier:reuseIdentifier]) {
        [self titles];
    }
    return self;
}

- (PublicLabel *)titles{
    if (!_titles) {
        _titles = [PublicLabel labelWithText:@"2012年1月11日，淘宝商城在北京举行战略发布会，宣布更换中文品牌“淘宝商城”为“天猫”。淘宝商城总裁张勇表示，取这个名字一" textColor:[UIColor colorWithHexString:@"#333333"] font:[UIFont systemFontOfSize:13] textAlignment:NSTextAlignmentLeft backgroundColor:[UIColor clearColor]];
        _titles.numberOfLines = 0;
        _titles.lineBreakMode = NSLineBreakByWordWrapping;
        [self.contentView addSubview:_titles];
    }
    return _titles;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [_titles mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left).offset(25);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-25);
        make.top.mas_equalTo(self.contentView.mas_top).offset(10);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-10);
    }];
}

@end
