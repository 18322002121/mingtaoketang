//
//  LiveBroadcastCourseShowCell.m
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/5/6.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "LiveBroadcastCourseShowCell.h"
#import "LiveBroadcastCourseShowModel.h"

@interface LiveBroadcastCourseShowCell ()
@property (nonatomic,strong) UIView *bottomView;
/** 直播日期 */
@property (nonatomic,strong) PublicLabel *liveDates;
/** 直播时间 */
@property (nonatomic,strong) PublicLabel *liveTimes;
/** 竖线 */
@property (nonatomic,strong) PublicLabel *lines;
/** 头像 */
@property (nonatomic,strong) UIImageView *headPortraitImage;
/** 标题 */
@property (nonatomic,strong) PublicLabel *titles;
/** 讲师 */
@property (nonatomic,strong) PublicLabel *lecturer;
/** 预约人数 */
@property (nonatomic,strong) PublicLabel *subscribeNumber;
@end

@implementation LiveBroadcastCourseShowCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
//        [self liveTimes];
        [self bottomView];
        [self liveDates];
        [self lines];
        [self headPortraitImage];
        [self titles];
        [self lecturer];
        [self subscribeNumber];
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

- (PublicLabel *)liveDates{
    if (!_liveDates) {
        _liveDates = [PublicLabel labelWithText:@"" textColor:[UIColor colorWithHexString:@"#333333"] font:[UIFont systemFontOfSize:12] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        _liveDates.lineBreakMode = NSLineBreakByWordWrapping;
        _liveDates.numberOfLines = 0;
        [self.bottomView addSubview:_liveDates];
    }
    return _liveTimes;
}

//- (PublicLabel *)liveTimes{
//    if (!_liveTimes) {
//        _liveTimes = [PublicLabel labelWithText:@"" textColor:[UIColor colorWithHexString:@"#333333"] font:[UIFont systemFontOfSize:12] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
//        [self.contentView addSubview:_liveTimes];
//    }
//    return _liveTimes;
//}

- (PublicLabel *)lines{
    if (!_lines) {
        _lines = [PublicLabel labelWithText:@"" textColor:[UIColor colorWithHexString:@"#333333"] font:[UIFont systemFontOfSize:12] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor colorWithHexString:@"#EEEEEE"]];
        [self.bottomView addSubview:_lines];
    }
    return _lines;
}

- (UIImageView *)headPortraitImage{
    if (!_headPortraitImage) {
        _headPortraitImage = [[UIImageView alloc]init];
        _headPortraitImage.backgroundColor = kRandomColor;
        _headPortraitImage.layer.cornerRadius = 20;
        [self.bottomView addSubview:_headPortraitImage];
    }
    return _headPortraitImage;
}

- (PublicLabel *)titles{
    if (!_titles) {
        _titles = [PublicLabel labelWithText:@"" textColor:[UIColor colorWithHexString:@"#333333"] font:[UIFont systemFontOfSize:16] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self.bottomView addSubview:_titles];
    }
    return _titles;
}

- (PublicLabel *)lecturer{
    if (!_lecturer) {
        _lecturer = [PublicLabel labelWithText:@"" textColor:[UIColor colorWithHexString:@"#333333"] font:[UIFont systemFontOfSize:13] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self.bottomView addSubview:_lecturer];
    }
    return _lecturer;
}

- (PublicLabel *)subscribeNumber{
    if (!_subscribeNumber) {
        _subscribeNumber = [PublicLabel labelWithText:@"456人预约" textColor:[UIColor colorWithHexString:@"#EE4242"] font:[UIFont systemFontOfSize:12] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self.bottomView addSubview:_subscribeNumber];
    }
    return _subscribeNumber;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    [_bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView.mas_top).offset(0);
        make.left.mas_equalTo(self.contentView.mas_left).offset(0);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(0);
        make.right.mas_equalTo(self.contentView.mas_right).offset(0);
    }];
    
    [_liveDates mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left).offset(5);
        make.right.mas_equalTo(self.lines.mas_left).offset(0);
        make.centerY.mas_equalTo(self.contentView.mas_centerY).offset(0);
    }];
    
//    [_liveTimes mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.mas_equalTo(self.contentView.mas_centerY).offset(10);
//        make.centerX.mas_equalTo(self.liveDates.mas_centerX).offset(0);
//    }];
    
    [_lines mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left).offset(87);
        make.top.mas_equalTo(self.contentView.mas_top).offset(15);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-15);
        make.width.mas_offset(@1);
    }];
    
    [_headPortraitImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.lines.mas_right).offset(11);
        make.centerY.mas_equalTo(self.contentView.mas_centerY).offset(0);
        make.size.mas_equalTo(CGSizeMake(40, 40));
    }];
    
    [_titles mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.headPortraitImage.mas_right).offset(8);
        make.centerY.mas_equalTo(self.contentView.mas_centerY).offset(-10);
    }];
    
    [_lecturer mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.headPortraitImage.mas_right).offset(8);
        make.centerY.mas_equalTo(self.contentView.mas_centerY).offset(10);
    }];
    
    [_subscribeNumber mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.contentView.mas_right).offset(-9);
        make.top.mas_equalTo(self.contentView.mas_top).offset(50);
    }];
    
}

- (void)setLiveBroadcastModel:(LiveBroadcastCourseShowData *)liveBroadcastModel{
    _liveBroadcastModel = liveBroadcastModel;
    _liveDates.text = [self inputTimestamp:liveBroadcastModel];
    _lecturer.text = liveBroadcastModel.zhibo_teacher;
    _titles.text = liveBroadcastModel.zhibo_title;
    _subscribeNumber.text = [NSString stringWithFormat:@"%@人预约",liveBroadcastModel.number];
    [_headPortraitImage sd_setImageWithURL:[NSURL URLWithString:liveBroadcastModel.avatar] placeholderImage:[UIImage imageNamed:@""]];
}

- (NSString *)inputTimestamp:(LiveBroadcastCourseShowData *)liveBroadcastModel{
    NSString *timeStampString  = liveBroadcastModel.start_time;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[timeStampString doubleValue]];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *dateString = [formatter stringFromDate: date];
    return dateString;
}

@end
