//
//  LiveBroadcastCell.m
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/4/26.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "LiveBroadcastCell.h"
#import "IntervalView.h"
@interface LiveBroadcastCell ()
@property (nonatomic,strong) UIView *bottomView;
/** 头像图片 */
@property (nonatomic,strong) UIImageView *iconImage;
/** 课程标题 */
@property (nonatomic,strong) PublicLabel *titles;
/** 讲师 */
@property (nonatomic,strong) PublicLabel *lecturer;
/** 开播状态 */
@property (nonatomic,strong) PublicLabel *broadcastingState;
/** 开播时间 */
@property (nonatomic,strong) PublicLabel *playbackDate;
/** 课程图片展示 */
@property (nonatomic,strong) UIImageView *showImages;
/** 倒计时显示 */
@property (nonatomic,strong) PublicLabel *countDownLabel;
/** 立即报名 */
@property (nonatomic,strong) PublicButton *signUpButton;
/** 倒计时view */
@property (nonatomic,strong) UIView *countDownView;
/** 冒号：1 */
@property (nonatomic,strong) PublicLabel *colonOne;
/** 冒号：2 */
@property (nonatomic,strong) PublicLabel *colonTwo;
/** 冒号：3 */
@property (nonatomic,strong) PublicLabel *colonThree;

@property (nonatomic,strong)NSMutableArray *intervalViewArray;

@property (nonatomic,strong)dispatch_source_t timer;

@end

@implementation LiveBroadcastCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style
                    reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self bottomView];
        [self iconImage];
        [self titles];
        [self lecturer];
        [self broadcastingState];
        [self playbackDate];
        [self showImages];
        [self countDownView];
        [self countDownLabel];
        [self signUpButton];
        [self intervalView];
        [self countDown];
        [self colonOne];
        [self colonTwo];
        [self colonThree];
    }
    return self;
}

- (UIView *)bottomView{
    if (!_bottomView) {
        _bottomView = [[UIView alloc]init];
        [self.contentView addSubview:_bottomView];
    }
    return _bottomView;
}

- (UIImageView *)iconImage{
    if (!_iconImage) {
        _iconImage = [[UIImageView alloc]init];
        _iconImage.backgroundColor = [UIColor redColor];
        _iconImage.layer.cornerRadius = 22;
        [self.bottomView addSubview:_iconImage];
    }
    return _iconImage;
}

- (PublicLabel *)titles{
    if (!_titles) {
        _titles = [PublicLabel labelWithText:@"招贴设计的概念与新媒体" textColor:[UIColor colorWithHexString:@"#333333"] font:[UIFont systemFontOfSize:16] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self.bottomView addSubview:_titles];
    }
    return _titles;
}

- (PublicLabel *)lecturer{
    if (!_lecturer) {
        _lecturer = [PublicLabel labelWithText:@"讲师：谨炎" textColor:[UIColor colorWithHexString:@"#333333"] font:[UIFont systemFontOfSize:13] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self.bottomView addSubview:_lecturer];
    }
    return _lecturer;
}

- (PublicLabel *)broadcastingState{
    if (!_broadcastingState) {
        _broadcastingState = [PublicLabel labelWithText:@"未开播" textColor:[UIColor colorWithHexString:@"#FFFFFF"] font:[UIFont systemFontOfSize:13] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor colorWithHexString:@"#FE9F2E"]];
        _broadcastingState.layer.cornerRadius = 5;
        _broadcastingState.clipsToBounds = YES;
        [self.bottomView addSubview:_broadcastingState];
    }
    return _broadcastingState;
}

- (PublicLabel *)playbackDate{
    if (!_playbackDate) {
        _playbackDate = [PublicLabel labelWithText:@"03月28日  19:00-20:00" textColor:[UIColor colorWithHexString:@"#333333"] font:[UIFont systemFontOfSize:13] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self.bottomView addSubview:_playbackDate];
    }
    return _playbackDate;
}

- (UIImageView *)showImages{
    if (!_showImages) {
        _showImages = [[UIImageView alloc]init];
        _showImages.backgroundColor = kRandomColor;
        _showImages.layer.cornerRadius = 5;
        [self.bottomView addSubview:_showImages];
    }
    return _showImages;
}

- (UIView *)countDownView{
    if (!_countDownView) {
        _countDownView = [[UIView alloc]init];
        [self.bottomView addSubview:_countDownView];
    }
    return _countDownView;
}

- (PublicLabel *)countDownLabel{
    if (!_countDownLabel) {
        _countDownLabel = [PublicLabel labelWithText:@"倒计时:" textColor:[UIColor colorWithHexString:@"#333333"] font:[UIFont systemFontOfSize:13] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self.countDownView addSubview:_countDownLabel];
    }
    return _countDownLabel;
}

- (PublicButton *)signUpButton{
    if (!_signUpButton) {
        _signUpButton = [PublicButton buttonWithImage:@"" backgroundImageImage:@"" title:@"立即报名" titleColor:[UIColor colorWithHexString:@"#FFFFFF"] textFont:[UIFont systemFontOfSize:11] backgroundColor:[UIColor colorWithHexString:@"#2393EF"] addView:self.countDownView target:self action:@selector(signUpClick:)];
        _signUpButton.layer.cornerRadius = 10;
    }
    return _signUpButton;
}

- (PublicLabel *)colonOne{
    if (!_colonOne) {
        _colonOne = [PublicLabel labelWithText:@":" textColor:[UIColor colorWithHexString:@"#333333"] font:[UIFont systemFontOfSize:20] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self.countDownView addSubview:_colonOne];
    }
    return _colonOne;
}

- (PublicLabel *)colonTwo{
    if (!_colonTwo) {
        _colonTwo = [PublicLabel labelWithText:@":" textColor:[UIColor colorWithHexString:@"#333333"] font:[UIFont systemFontOfSize:20] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self.countDownView addSubview:_colonTwo];
    }
    return _colonOne;
}

- (PublicLabel *)colonThree{
    if (!_colonThree) {
        _colonThree = [PublicLabel labelWithText:@":" textColor:[UIColor colorWithHexString:@"#333333"] font:[UIFont systemFontOfSize:20] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self.countDownView addSubview:_colonThree];
    }
    return _colonThree;
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
        make.top.mas_equalTo(self.bottomView.mas_top).offset(16);
        make.left.mas_equalTo(self.bottomView.mas_left).offset(13);
        make.size.mas_equalTo(CGSizeMake(44, 44));
    }];
    
    [_titles mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.iconImage.mas_right).offset(11);
        make.top.mas_equalTo(self.iconImage.mas_top).offset(0);
    }];
    
    [_lecturer mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.titles.mas_bottom).offset(16);
        make.left.mas_equalTo(self.titles.mas_left).offset(0);
    }];
    
    [_broadcastingState mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.bottomView.mas_right).offset(-13);
        make.centerY.mas_equalTo(self.titles.mas_centerY).offset(0);
        make.size.mas_equalTo(CGSizeMake(45, 17));
    }];
    
    [_playbackDate mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.lecturer.mas_centerY).offset(0);
        make.right.mas_equalTo(self.bottomView.mas_right).offset(-13);
    }];
    
    [_showImages mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.lecturer.mas_bottom).offset(19);
        make.left.mas_equalTo(self.bottomView.mas_left).offset(13);
        make.right.mas_equalTo(self.bottomView.mas_right).offset(-13);
        make.height.mas_offset(@197);
    }];
    
    [_countDownView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.bottomView.mas_left).offset(0);
        make.top.mas_equalTo(self.showImages.mas_bottom).offset(5);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(0);
        make.right.mas_equalTo(self.contentView.mas_right).offset(0);
    }];
    
    [_countDownLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.countDownView.mas_left).offset(13);
        make.centerY.mas_equalTo(self.countDownView.mas_centerY).offset(0);
    }];
    
    [_signUpButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.bottomView.mas_right).offset(-13);
        make.centerY.mas_equalTo(self.countDownLabel.mas_centerY).offset(0);
        make.size.mas_equalTo(CGSizeMake(75, 22));
    }];
    
    [_intervalViewArray mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:15 leadSpacing:64 tailSpacing:KScreenWidth - 156 - 62];
    
    [_intervalViewArray mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.countDownView.mas_centerY).offset(0);
        make.size.mas_equalTo(CGSizeMake(27, 27));
    }];
    
    [_colonOne mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.countDownLabel.mas_centerY).offset(0);
        make.left.mas_equalTo(self.countDownLabel.mas_right).offset(40);
    }];
    
    [_colonTwo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.countDownLabel.mas_centerY).offset(0);
        make.left.mas_equalTo(self.countDownLabel.mas_right).offset(82);
    }];
    
    [_colonThree mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.countDownLabel.mas_centerY).offset(0);
        make.left.mas_equalTo(self.countDownLabel.mas_right).offset(125);
    }];
}

#pragma mark - 创建四个间隔view

- (void)intervalView{
    _intervalViewArray = [NSMutableArray arrayWithCapacity:0];
    for (int i = 0 ; i < 4 ; i++) {
        IntervalView *intervalViews = [[IntervalView alloc]init];
        intervalViews.layer.cornerRadius = 3;
        intervalViews.backgroundColor = [UIColor clearColor];
        intervalViews.layer.borderWidth = 0.5;
        intervalViews.tag =200+i;
        intervalViews.layer.borderColor = [UIColor colorWithHexString:@"#F42B2B"].CGColor;
        [self.intervalViewArray addObject:intervalViews];
        [self.countDownView addSubview:intervalViews];
    }
}

#pragma mark - 立即报名按钮

- (void)signUpClick:(UIButton *)sender{
    !_SignUpClickBlock ? : _SignUpClickBlock(sender);
}

#pragma mark - 倒计时

- (void)countDown{
    
    // 倒计时的时间 测试数据
    NSString *deadlineStr = @"2019-04-29 15:00:00";
    // 当前时间的时间戳
    NSString *nowStr = [self getCurrentTimeyyyymmdd];
    // 计算时间差值
    NSInteger secondsCountDown = [self getDateDifferenceWithNowDateStr:nowStr deadlineStr:deadlineStr];
    
    NSLog(@"%ld",(long)nowStr);
    NSLog(@"%ld",(long)secondsCountDown);
    

    __weak __typeof(self) weakSelf = self;
    if (_timer == nil) {
        __block NSInteger timeout = secondsCountDown; // 倒计时时间
        if (timeout!=0) {
            dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
            _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
            dispatch_source_set_timer(_timer, dispatch_walltime(NULL, 0), 1.0*NSEC_PER_SEC,  0); //每秒执行
            dispatch_source_set_event_handler(_timer, ^{
                if(timeout <= 0){ //  当倒计时结束时做需要的操作: 关闭 活动到期不能提交
                    dispatch_source_cancel(weakSelf.timer);
                    weakSelf.timer = nil;
                    dispatch_async(dispatch_get_main_queue(), ^{
//                        timeLabel.text = @"当前活动已结束";
                    });
                } else { // 倒计时重新计算 时/分/秒
                    NSInteger days = (int)(timeout/(3600*24));
                    NSInteger hours = (int)((timeout-days*24*3600)/3600);
                    NSInteger minute = (int)(timeout-days*24*3600-hours*3600)/60;
                    NSInteger second = timeout - days*24*3600 - hours*3600 - minute*60;
//                    NSString *strTime = [NSString stringWithFormat:@"%02ld : %02ld  : %02ld  :  %02ld", days, hours, minute, second];
                    dispatch_async(dispatch_get_main_queue(), ^{
                        if (days == 0) {
                            [self timeLabelsDays:days hours:hours minute:minute second:second];
                        } else {
//                            timeLabel.text = [NSString stringWithFormat:@"%02ld  : %02ld  :  %02ld  :%02ld", days, hours, minute, second];
                            [self timeLabelsDays:days hours:hours minute:minute second:second];
                        }
                    });
                    timeout--; // 递减 倒计时-1(总时间以秒来计算)
                }
            });
            dispatch_resume(_timer);
        }
    }
}

/**
 *  获取当天的字符串
 *
 *  @return 格式为年-月-日 时分秒
 */
- (NSString *)getCurrentTimeyyyymmdd {
    NSDate *now = [NSDate date];
    NSDateFormatter *formatDay = [[NSDateFormatter alloc] init];
    formatDay.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSString *dayStr = [formatDay stringFromDate:now];
    return dayStr;
}

/**
 *  获取时间差值  截止时间-当前时间
 *  nowDateStr : 当前时间
 *  deadlineStr : 截止时间
 *  @return 时间戳差值
 */
- (NSInteger)getDateDifferenceWithNowDateStr:(NSString*)nowDateStr deadlineStr:(NSString*)deadlineStr {
    NSInteger timeDifference = 0;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yy-MM-dd HH:mm:ss"];
    NSDate *nowDate = [formatter dateFromString:nowDateStr];
    NSDate *deadline = [formatter dateFromString:deadlineStr];
    NSTimeInterval oldTime = [nowDate timeIntervalSince1970];
    NSTimeInterval newTime = [deadline timeIntervalSince1970];
    timeDifference = newTime - oldTime;//newTime - oldTime
    return timeDifference;
}

- (void)timeLabelsDays:(NSInteger)days hours:(NSInteger)hours minute:(NSInteger)minute second:(NSInteger)second{
    [self.intervalViewArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        IntervalView *intervalViews = self.intervalViewArray[idx];
        
        if ([intervalViews viewWithTag:200]) {
            intervalViews.timeLabel.text = [NSString stringWithFormat:@"%02ld",days];
        }else if ([intervalViews viewWithTag:201]){
            intervalViews.timeLabel.text = [NSString stringWithFormat:@"%02ld",hours];
        }else if ([intervalViews viewWithTag:202]){
            intervalViews.timeLabel.text = [NSString stringWithFormat:@"%02ld",minute];
        }else if ([intervalViews viewWithTag:203]){
            intervalViews.timeLabel.textColor = [UIColor colorWithHexString:@"#FFFFFF"];
            intervalViews.backgroundColor = [UIColor colorWithHexString:@"#F42B2B"];
            intervalViews.timeLabel.text = [NSString stringWithFormat:@"%02ld",second];
        }
    }];
}

@end
