//
//  InformationClassAssistantHeaderView.m
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/5/6.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "InformationClassAssistantHeaderView.h"
#import "InformationClassAssistantModel.h"

@interface InformationClassAssistantHeaderView ()
@property (nonatomic,strong) UIView *bottomView;
/** 资讯 */
@property (nonatomic,strong) PublicButton *informationButton;
/** 开班 */
@property (nonatomic,strong) PublicButton *offerCourseButton;
/** 助手 */
@property (nonatomic,strong) PublicButton *assistantButton;
/** line1 */
@property (nonatomic,strong) PublicLabel *line1;
/** line2 */
@property (nonatomic,strong) PublicLabel *line2;
/** line3 */
@property (nonatomic,strong) PublicLabel *line3;

@end
@implementation InformationClassAssistantHeaderView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self bottomView];
        [self informationButton];
        [self offerCourseButton];
        [self assistantButton];
        [self line1];
        
    }
    return self;
}

- (UIView *)bottomView{
    if (!_bottomView) {
        _bottomView = [[UIView alloc]init];
        _bottomView.layer.cornerRadius = 5;
//        _bottomView.backgroundColor = kRandomColor;
        [self addSubview:_bottomView];
    }
    return _bottomView;
}

- (PublicLabel *)line1{
    if (!_line1) {
        _line1 = [PublicLabel labelWithText:@"" textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:13] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor colorWithHexString:@"#2393EE"]];
        [self.bottomView addSubview:_line1];
    }
    return _line1;
}

- (PublicLabel *)line2{
    if (!_line2) {
        _line2 = [PublicLabel labelWithText:@"" textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:13] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor colorWithHexString:@"#2393EE"]];
        [self.bottomView addSubview:_line2];
    }
    return _line2;
}

- (PublicLabel *)line3{
    if (!_line3) {
        _line3 = [PublicLabel labelWithText:@"" textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:13] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor colorWithHexString:@"#2393EE"]];
        [self.bottomView addSubview:_line3];
    }
    return _line3;
}


- (void)layoutSubviews{
    [super layoutSubviews];
    [_bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).offset(0);
        make.left.mas_equalTo(self.mas_left).offset(0);
        make.bottom.mas_equalTo(self.mas_bottom).offset(0);
        make.right.mas_equalTo(self.mas_right).offset(0);
    }];
    
    [@[_informationButton,_offerCourseButton,_assistantButton] mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:1 leadSpacing:0 tailSpacing:0];
    
    [@[_informationButton,_offerCourseButton,_assistantButton] mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.bottomView.mas_centerY).offset(0);
        make.height.mas_equalTo(30);
    }];
    
    [_line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.informationButton.mas_bottom).offset(2);
        make.centerX.mas_equalTo(self.informationButton.mas_centerX).offset(0);
        make.size.mas_equalTo(CGSizeMake(15, 2));
    }];
    
    [_line2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.offerCourseButton.mas_bottom).offset(2);
        make.centerX.mas_equalTo(self.offerCourseButton.mas_centerX).offset(0);
        make.size.mas_equalTo(CGSizeMake(15, 2));
    }];
    
    [_line3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.assistantButton.mas_bottom).offset(2);
        make.centerX.mas_equalTo(self.assistantButton.mas_centerX).offset(0);
        make.size.mas_equalTo(CGSizeMake(15, 2));
    }];
}

- (PublicButton *)informationButton{
    if (!_informationButton) {
        _informationButton = [PublicButton buttonWithImage:@"" backgroundImageImage:@"" title:@"" titleColor:[UIColor colorWithHexString:@"#2393EF"] textFont:[UIFont systemFontOfSize:16] backgroundColor:[UIColor clearColor] addView:self.bottomView target:self action:@selector(informationButtonClick:)];
    }
    return _informationButton;
}

- (PublicButton *)offerCourseButton{
    if (!_offerCourseButton) {
        _offerCourseButton = [PublicButton buttonWithImage:@"" backgroundImageImage:@"" title:@"" titleColor:[UIColor colorWithHexString:@"#333333"] textFont:[UIFont systemFontOfSize:16] backgroundColor:[UIColor clearColor] addView:self.bottomView target:self action:@selector(offerCourseButtonClick:)];
    }
    return _offerCourseButton;
}

- (PublicButton *)assistantButton{
    if (!_assistantButton) {
        _assistantButton = [PublicButton buttonWithImage:@"" backgroundImageImage:@"" title:@"" titleColor:[UIColor colorWithHexString:@"#333333"] textFont:[UIFont systemFontOfSize:16] backgroundColor:[UIColor clearColor] addView:self.bottomView target:self action:@selector(assistantButtonClick:)];
    }
    return _assistantButton;
}

- (void)setInformationClassAssistantArray:(NSMutableArray *)informationClassAssistantArray{
    _informationClassAssistantArray = informationClassAssistantArray;
    [informationClassAssistantArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        InformationClassAssistantData *model = obj;
        NSString *cat_id = model.cat_id;
        if (idx == 0) {
            [self.informationButton setTitle:model.keywords forState:UIControlStateNormal];
            self.informationButton.tag = [cat_id integerValue];
        }else if (idx == 1){
            [self.offerCourseButton setTitle:model.keywords forState:UIControlStateNormal];
            self.informationButton.tag = [cat_id integerValue];
        }else if (idx == 2){
            [self.assistantButton setTitle:model.keywords forState:UIControlStateNormal];
            self.informationButton.tag = [cat_id integerValue];
        }
    }];
    
}

/** 资讯 */
- (void)informationButtonClick:(UIButton *)sender{
    !_informationButtonClickBlock ? : _informationButtonClickBlock(sender);
}
/** 开班 */
- (void)offerCourseButtonClick:(UIButton *)sender{
    [self line2];
    !_offerCourseButtonClickBlock ? : _offerCourseButtonClickBlock(sender);
}
/** 助手 */
- (void)assistantButtonClick:(UIButton *)sender{
    [self line3];
    !_assistantButtonClickBlock ? : _assistantButtonClickBlock(sender);
}

@end
