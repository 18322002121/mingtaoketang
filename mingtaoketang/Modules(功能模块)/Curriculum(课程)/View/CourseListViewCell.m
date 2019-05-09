//
//  CourseListViewCell.m
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/5/9.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "CourseListViewCell.h"
@interface CourseListViewCell ()
/** 展示icon */
@property (nonatomic,strong) UIImageView *showIcon;
/** 标题 */
@property (nonatomic,strong) PublicLabel *titles;
/** 内容 */
@property (nonatomic,strong) PublicLabel *contents;
@end
@implementation CourseListViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style
                    reuseIdentifier:reuseIdentifier]) {
        [self showIcon];
        [self titles];
        [self contents];
    }
    return self;
}


- (UIImageView *)showIcon{
    if (!_showIcon) {
        _showIcon = [[UIImageView alloc]init];
        _showIcon.backgroundColor = kRandomColor;
        _showIcon.layer.cornerRadius = 3;
        [self.contentView addSubview:_showIcon];
    }
    return _showIcon;
}

- (PublicLabel *)titles{
    if (!_titles) {
        _titles = [PublicLabel labelWithText:@"0基础快速建站" textColor:[UIColor colorWithHexString:@"#333333"] font:[UIFont systemFontOfSize:18] textAlignment:NSTextAlignmentLeft backgroundColor:[UIColor clearColor]];
        _titles.numberOfLines = 0;
        _titles.lineBreakMode = NSLineBreakByWordWrapping;
        [self.contentView addSubview:_titles];
    }
    return _titles;
}

- (PublicLabel *)contents{
    if (!_contents) {
        _contents = [PublicLabel labelWithText:@"地方法规的施工方更好吃是重新下火车地方是非常赤壁怀古。" textColor:[UIColor colorWithHexString:@"#A7A7A7"] font:[UIFont systemFontOfSize:13] textAlignment:NSTextAlignmentLeft backgroundColor:[UIColor clearColor]];
        _contents.numberOfLines = 0;
        _contents.lineBreakMode = NSLineBreakByWordWrapping;
        [self.contentView addSubview:_contents];
    }
    return _titles;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [_showIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left).offset(13);
        make.centerY.mas_equalTo(self.contentView.mas_centerY).offset(0);
        make.size.mas_equalTo(CGSizeMake(145, 82));
    }];
    
    [_titles mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.showIcon.mas_right).offset(10);
        make.top.mas_equalTo(self.contentView.mas_top).offset(5);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-10);
    }];
    
    [_contents mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.showIcon.mas_right).offset(10);
        make.top.mas_equalTo(self.titles.mas_bottom).offset(20);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-10);
    }];
}

@end
