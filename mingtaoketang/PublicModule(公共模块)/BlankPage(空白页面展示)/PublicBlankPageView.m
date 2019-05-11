//
//  PublicBlankPageView.m
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/5/11.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "PublicBlankPageView.h"

@interface PublicBlankPageView ()
/** 展示图片 */
@property (nonatomic,strong) UIImageView *showImage;
/** 展示标题 */
@property (nonatomic,strong) PublicLabel *showTitles;
@end

@implementation PublicBlankPageView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self showImage];
        [self showTitles];
    }
    return self;
}

- (UIImageView *)showImage{
    if (!_showImage) {
        _showImage = [[UIImageView alloc]init];
        _showImage.image = [UIImage imageNamed:@"norecord"];
        [self addSubview:_showImage];
    }
    return _showImage;
}

- (PublicLabel *)showTitles{
    if (!_showTitles) {
        _showTitles = [PublicLabel labelWithText:@"" textColor:[UIColor colorWithHexString:@"#A7A7A7"] font:[UIFont systemFontOfSize:15] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self addSubview:_showTitles];
    }
    return _showTitles;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [_showImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).offset(171);
        make.centerX.mas_equalTo(self.mas_centerX).offset(0);
        make.size.mas_equalTo(CGSizeMake(157, 121));
    }];
    
    [_showTitles mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.showImage.mas_bottom).offset(46);
        make.centerX.mas_equalTo(self.mas_centerX).offset(0);
    }];
    
}

- (void)reloadBlankPageView:(NSString *)showTitle{
    _showTitles.text = showTitle;
}

@end
