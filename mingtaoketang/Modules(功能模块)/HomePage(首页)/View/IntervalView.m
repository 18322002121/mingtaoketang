//
//  IntervalView.m
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/4/26.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "IntervalView.h"

@implementation IntervalView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _timeLabel = [PublicLabel labelWithText:@"" textColor:[UIColor colorWithHexString:@"#F42B2B"] font:[UIFont systemFontOfSize:20] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self addSubview:_timeLabel];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.mas_centerX).offset(0);
        make.centerY.mas_equalTo(self.mas_centerY).offset(0);
    }];
}

@end
