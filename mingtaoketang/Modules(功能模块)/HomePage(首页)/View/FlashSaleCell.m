//
//  FlashSaleCell.m
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/4/25.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "FlashSaleCell.h"
@interface FlashSaleCell ()
@property (nonatomic,strong) UIView *bottomView;
@property (nonatomic,strong) UIImageView *iconImage;
@property (nonatomic,strong) PublicLabel *titles;
/** 原价 */
@property (nonatomic,strong) PublicLabel *originalPrice;
/** 现价 */
@property (nonatomic,strong) PublicLabel *presentPrice;
/** 立即抢购*/
@property (nonatomic,strong) PublicButton *rushToBuyButton;

@end
@implementation FlashSaleCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self bottomView];
        [self iconImage];
        [self titles];
        [self originalPrice];
        [self presentPrice];
        [self rushToBuyButton];
    }
    return self;
}

- (UIView *)bottomView{
    if (!_bottomView) {
        _bottomView = [[UIView alloc]init];
        _bottomView.layer.cornerRadius = 5;
        [self.contentView addSubview:_bottomView];
    }
    return _bottomView;
}

- (UIImageView *)iconImage{
    if (!_iconImage) {
        _iconImage = [[UIImageView alloc]init];
        _iconImage.backgroundColor = kRandomColor;
        _iconImage.layer.cornerRadius = 5;
        [self.bottomView addSubview:_iconImage];
    }
    return _iconImage;
}

- (PublicLabel *)titles{
    if (!_titles) {
        _titles = [PublicLabel labelWithText:@"0基础快速建站" textColor:[UIColor colorWithHexString:@"#333333"] font:[UIFont systemFontOfSize:17] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self.bottomView addSubview:_titles];
    }
    return _titles;
}

- (PublicLabel *)originalPrice{
    if (!_originalPrice) {
        _originalPrice = [PublicLabel labelWithText:@"原价：398.00币" textColor:[UIColor colorWithHexString:@"#A7A7A7"] font:[UIFont systemFontOfSize:12] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self.bottomView addSubview:_originalPrice];
        [self lastLabelDeal:_originalPrice.text label:_originalPrice];
    }
    return _originalPrice;
}

- (PublicLabel *)presentPrice{
    if (!_presentPrice) {
        _presentPrice = [PublicLabel labelWithText:@"现价:198.00币" textColor:[UIColor colorWithHexString:@"#F42B2B"] font:[UIFont systemFontOfSize:14] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self.bottomView addSubview:_presentPrice];
    }
    return _presentPrice;
}

- (PublicButton *)rushToBuyButton{
    if (!_rushToBuyButton) {
        _rushToBuyButton = [PublicButton buttonWithImage:@"" backgroundImageImage:@"" title:@"立即抢购" titleColor:[UIColor colorWithHexString:@"#FFFFFF"] textFont:[UIFont systemFontOfSize:11] backgroundColor:[UIColor colorWithHexString:@"#1B80F1"] addView:self.bottomView target:self action:@selector(rushToBuyClick:)];
        _rushToBuyButton.layer.cornerRadius = 10;
    }
    return _rushToBuyButton;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [_bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView.mas_top).offset(0);
        make.left.mas_equalTo(self.contentView.mas_left).offset(0);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(0);
        make.right.mas_equalTo(self.contentView.mas_right).offset(0);
    }];
    
    [_iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.bottomView.mas_centerY).offset(0);
        make.left.mas_equalTo(self.bottomView.mas_left).offset(0);
        make.size.mas_equalTo(CGSizeMake(115, 84));
    }];
    
    [_titles mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.iconImage.mas_right).offset(10);
        make.top.mas_equalTo(self.iconImage.mas_top).offset(0);
    }];
    
    [_originalPrice mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.iconImage.mas_right).offset(10);
        make.top.mas_equalTo(self.titles.mas_bottom).offset(23);
    }];
    
    [_presentPrice mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.iconImage.mas_right).offset(10);
        make.top.mas_equalTo(self.originalPrice.mas_bottom).offset(6);
    }];
    
    [_rushToBuyButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.presentPrice.mas_centerY).offset(0);
        make.right.mas_equalTo(self.bottomView.mas_right).offset(0);
        make.size.mas_equalTo(CGSizeMake(72, 22));
    }];
}

- (void)rushToBuyClick:(UIButton *)sender{
    !_RushToBuyClickBlock ? : _RushToBuyClickBlock(sender);
}

#pragma mark- 删除线

-(void)lastLabelDeal:(NSString *)str1 label:(UILabel *)label{
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@",str1]];
    
    [str addAttribute:NSStrikethroughStyleAttributeName value:@(NSUnderlineStyleSingle|NSUnderlinePatternSolid) range:NSMakeRange(0, str1.length)];
    
    label.attributedText = str;
}



@end
