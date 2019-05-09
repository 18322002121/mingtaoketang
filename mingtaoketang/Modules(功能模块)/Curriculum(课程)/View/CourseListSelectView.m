//
//  CourseListSelectView.m
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/5/9.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "CourseListSelectView.h"
@interface CourseListSelectView ()
/** 课程分类1 */
@property (nonatomic,strong) PublicButton *curriculumClassification1;
/** 课程分类2 */
@property (nonatomic,strong) PublicButton *curriculumClassification2;
@end
@implementation CourseListSelectView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self curriculumClassification1];
        [self curriculumClassification2];
    }
    return self;
}

- (PublicButton *)curriculumClassification1{
    if (!_curriculumClassification1) {
        _curriculumClassification1 = [PublicButton buttonWithFrame:CGRectZero buttonEdgeInsetsStyle:(UIButtonEdgeInsetsStyleRight) image:@"" backgroundImageImage:@"" title:@"电商课程" titleColor:[UIColor whiteColor] textFont:[UIFont systemFontOfSize:16] backgroundColor:[UIColor colorWithHexString:@"#0052B7"] addView:self target:self action:@selector(curriculumClassificationClick:)];
    }
    return _curriculumClassification1;
}

- (PublicButton *)curriculumClassification2{
    if (!_curriculumClassification2) {
        _curriculumClassification2 = [PublicButton buttonWithFrame:CGRectZero buttonEdgeInsetsStyle:(UIButtonEdgeInsetsStyleRight) image:@"" backgroundImageImage:@"" title:@"精品课程" titleColor:[UIColor whiteColor] textFont:[UIFont systemFontOfSize:16] backgroundColor:[UIColor colorWithHexString:@"#0052B7"] addView:self target:self action:@selector(curriculumClassificationClick:)];
    }
    return _curriculumClassification2;
}


- (void)layoutSubviews{
    [super layoutSubviews];
    [@[_curriculumClassification1,_curriculumClassification2] mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:32 leadSpacing:26 tailSpacing:26];
    
    [@[_curriculumClassification1,_curriculumClassification2] mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.mas_centerY).offset(0);
        make.height.mas_equalTo(30);
    }];
    
}

- (void)curriculumClassificationClick:(UIButton *)sender{
    !_curriculumClassificationClickBlock ? : _curriculumClassificationClickBlock(sender);
}

@end
