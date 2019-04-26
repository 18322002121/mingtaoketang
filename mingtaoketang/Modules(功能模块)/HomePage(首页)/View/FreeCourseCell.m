//
//  FreeCourseCell.m
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/4/25.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "FreeCourseCell.h"
@interface FreeCourseCell ()
@property (nonatomic,strong) UIView *bottomView;
@property (nonatomic,strong) UIImageView *showImage;
/** 标题 */
@property (nonatomic,strong) PublicLabel *titles;
/** 免费 or 付费 */
@property (nonatomic,strong) PublicLabel *freeDetail;
/** 课程节数 */
@property (nonatomic,strong) PublicLabel *nodeNumber;
/** 观看人数 */
@property (nonatomic,strong) PublicLabel *numberVisitors;

@end
@implementation FreeCourseCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style
                    reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self bottomView];
        [self showImage];
        [self titles];
        [self freeDetail];
        [self nodeNumber];
        [self numberVisitors];
    }
    return self;
}

- (UIView *)bottomView{
    if (!_bottomView) {
        _bottomView = [[UIView alloc]init];
        _bottomView.layer.cornerRadius = 5;
        _bottomView.backgroundColor = [UIColor colorWithRed:0.94 green:0.95 blue:0.96 alpha:1.00];
        [self bottomViews:_bottomView];
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

- (PublicLabel *)titles{
    if (!_titles) {
        _titles = [PublicLabel labelWithText:@"客保存文件格式" textColor:[UIColor colorWithHexString:@"#333333"] font:[UIFont systemFontOfSize:18] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self.bottomView addSubview:_titles];
    }
    return _titles;
}

- (PublicLabel *)freeDetail{
    if (!_freeDetail) {
        _freeDetail = [PublicLabel labelWithText:@"免费" textColor:[UIColor colorWithHexString:@"#F42B2B"] font:[UIFont systemFontOfSize:14] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self.bottomView addSubview:_freeDetail];
    }
    return _freeDetail;
}

- (PublicLabel *)nodeNumber{
    if (!_nodeNumber) {
        _nodeNumber = [PublicLabel labelWithText:@"共1节" textColor:[UIColor colorWithHexString:@"#999999"] font:[UIFont systemFontOfSize:13] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self.bottomView addSubview:_nodeNumber];
    }
    return _nodeNumber;
}

- (PublicLabel *)numberVisitors{
    if (!_numberVisitors) {
        _numberVisitors = [PublicLabel labelWithText:@"565人已观看" textColor:[UIColor colorWithHexString:@"#2393EE"] font:[UIFont systemFontOfSize:12] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self contentStr:_numberVisitors.text numberVisitors:_numberVisitors];
        [self.bottomView addSubview:_numberVisitors];
    }
    return _numberVisitors;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    [_bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView.mas_top).offset(9);
        make.left.mas_equalTo(self.contentView.mas_left).offset(13);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-17);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-13);
    }];
    
    [_showImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.bottomView.mas_top).offset(0);
        make.left.mas_equalTo(self.bottomView.mas_left).offset(0);
        make.right.mas_equalTo(self.bottomView.mas_right).offset(0);
        make.height.mas_offset(@166);
    }];
    
    [_titles mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.showImage.mas_left).offset(12);
        make.top.mas_equalTo(self.showImage.mas_bottom).offset(11);
    }];
    
    [_freeDetail mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.titles.mas_left).offset(0);
        make.top.mas_equalTo(self.titles.mas_bottom).offset(11);
    }];
    
    [_nodeNumber mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.titles.mas_centerY).offset(0);
        make.right.mas_equalTo(self.bottomView.mas_right).offset(-13);
    }];
    
    [_numberVisitors mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.freeDetail.mas_centerY).offset(0);
        make.right.mas_equalTo(self.bottomView.mas_right).offset(-13);
    }];
    
}

#pragma mark - 修改字符串颜色

- (void)contentStr:(NSString *)strText numberVisitors:(PublicLabel *)numberVisitors{
    NSMutableAttributedString *textColor = [[NSMutableAttributedString alloc]initWithString:strText];
    NSRange rangel = [[textColor string] rangeOfString:[strText substringFromIndex:strText.length-4]];
    [textColor addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHexString:@"#414141"] range:rangel];
    [textColor addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:12] range:rangel];
    [numberVisitors setAttributedText:textColor];
}

#pragma mark - 设置阴影效果

- (void)bottomViews:(UIView *)bottomViews {
    bottomViews.layer.shadowColor = [UIColor blackColor].CGColor;//shadowColor阴影颜色
    bottomViews.layer.shadowOffset = CGSizeMake(0,5);//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
    bottomViews.layer.shadowOpacity = 0.5;//阴影透明度，默认0
    bottomViews.layer.shadowRadius = 5;//阴影半径，默认3
}

@end
