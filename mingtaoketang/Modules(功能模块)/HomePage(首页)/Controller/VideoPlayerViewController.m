//
//  VideoPlayerViewController.m
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/4/29.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "VideoPlayerViewController.h"
#import "CourseCatalogueCell.h"
#import "CourseIntroductionCell.h"

@interface VideoPlayerViewController ()<SuperPlayerDelegate,UIScrollViewDelegate>
/** 播放器View的父视图*/
@property (nonatomic) UIView *playerFatherView;
@property (strong, nonatomic) SuperPlayerView *playerView;
/** 课程目录和课程简介底层view */
@property (nonatomic,strong) UIView *courseView;
/** 课程目录 */
@property (nonatomic,strong) PublicButton *courseCatalogueButton;
/** 课程简介 */
@property (nonatomic,strong) PublicButton *courseIntroductionButton;
/** 视频列表滑动scrollview */
@property UIScrollView  *scrollView;
/** 课程目录列表 */
@property (nonatomic,strong) PublicTableView *courseCatalogueTableview;
/** 课程简介列表 */
@property (nonatomic,strong) PublicTableView *courseIntroductionTableview;
@property (nonatomic,strong) UIView *container;
@end
static NSString *const courseCatalogueCell =@"CourseCatalogueCell";
static NSString *const courseIntroductionCell =@"CourseIntroductionCell";
@implementation VideoPlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"视频播放";
    [self reloadVideoPlayerView];
    
}

- (void)reloadVideoPlayerView{
    self.playerFatherView = [[UIView alloc] init];
    self.playerFatherView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.playerFatherView];
    [_playerFatherView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).offset(0);
        make.right.mas_equalTo(self.view.mas_right).offset(0);
        make.top.mas_equalTo(self.view.mas_top).offset(0);
        make.height.mas_offset(@211);
    }];
    _playerView = [[SuperPlayerView alloc] init];
    // 设置代理，用于接受事件
    _playerView.delegate = self;
    // 设置父View，_playerView会被自动添加到holderView下面
    self.playerView.fatherView = self.playerFatherView;
    
    SuperPlayerModel *playerModel = [[SuperPlayerModel alloc] init];
    // 设置播放地址，直播、点播都可以
    playerModel.videoURL = @"http://200024424.vod.myqcloud.com/200024424_709ae516bdf811e6ad39991f76a4df69.f20.mp4";
    // 开始播放
    [_playerView playWithModel:playerModel];
    
    _courseView = [[UIView alloc]init];
    _courseView.layer.borderWidth = 1;
    _courseView.layer.borderColor = [UIColor colorWithHexString:@"#2393EE"].CGColor;
    _courseView.layer.cornerRadius = 16;
    [self.view addSubview:_courseView];
    [_courseView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX).offset(0);
        make.top.mas_equalTo(self.playerFatherView.mas_bottom).offset(16);
        make.size.mas_equalTo(CGSizeMake(185, 32));
    }];

    _courseCatalogueButton = [PublicButton buttonWithImage:@"" backgroundImageImage:@"" title:@"课程目录" titleColor:[UIColor colorWithHexString:@"#2393EE"] textFont:[UIFont systemFontOfSize:15] backgroundColor:[UIColor clearColor] addView:self.courseView target:self action:@selector(courseCatalogueButtonClick:)];
    [_courseCatalogueButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_courseCatalogueButton setBackgroundColor:[UIColor colorWithHexString:@"#277FEC"]];
    _courseCatalogueButton.layer.cornerRadius = 14;
    
    _courseIntroductionButton = [PublicButton buttonWithImage:@"" backgroundImageImage:@"" title:@"课程简介" titleColor:[UIColor colorWithHexString:@"#2393EE"] textFont:[UIFont systemFontOfSize:15] backgroundColor:[UIColor clearColor] addView:self.courseView target:self action:@selector(courseIntroductionButtonClick:)];
    _courseIntroductionButton.layer.cornerRadius = 14;
    
    [@[_courseCatalogueButton,_courseIntroductionButton] mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:2 leadSpacing:2 tailSpacing:2];
    
    [@[_courseCatalogueButton,_courseIntroductionButton] mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.courseView.mas_centerY).offset(0);
        make.height.mas_equalTo(27);
    }];
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectZero];
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.delegate = self;
    [self.view addSubview:self.scrollView];
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.courseView.mas_bottom).offset(5);
        make.left.mas_equalTo(0);
        make.leading.trailing.mas_equalTo(0);
        if (@available(iOS 11, *)) {
            make.bottom.mas_equalTo(self.view.mas_safeAreaLayoutGuideBottom).offset(-30);
        } else {
            make.bottom.mas_equalTo(self.view.mas_bottom).offset(-30);
        }
    }];
    
    _container = [UIView new];
    _container.backgroundColor = [UIColor redColor];
    [self.scrollView addSubview:_container];
    [_container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.scrollView);
        make.width.equalTo(@(KScreenWidth*2));
        make.height.equalTo(self.scrollView.mas_height);
    }];
    [self courseCatalogueTableview];
    [self courseIntroductionTableview];
}

- (void)courseCatalogueButtonClick:(UIButton *)sender{
    sender.selected = YES;
    if (sender.selected) {
        [sender setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [sender setBackgroundColor:[UIColor colorWithHexString:@"#277FEC"]];
    }
    [_courseIntroductionButton setTitleColor:[UIColor colorWithHexString:@"#2393EE"] forState:UIControlStateNormal];
    [_courseIntroductionButton setBackgroundColor:[UIColor colorWithHexString:@"#FFFFFF"]];
    _courseIntroductionButton.selected = NO;
    [self.scrollView scrollRectToVisible:CGRectMake(0, 0, ScreenWidth, self.scrollView.frame.size.height) animated:YES];
}

- (void)courseIntroductionButtonClick:(UIButton *)sender{
    sender.selected = YES;
    if (sender.selected) {
        [sender setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [sender setBackgroundColor:[UIColor colorWithHexString:@"#277FEC"]];
    }
    [_courseCatalogueButton setTitleColor:[UIColor colorWithHexString:@"#2393EE"] forState:UIControlStateNormal];
    [_courseCatalogueButton setBackgroundColor:[UIColor colorWithHexString:@"#FFFFFF"]];
    _courseCatalogueButton.selected = NO;
    [self.scrollView scrollRectToVisible:CGRectMake(KScreenWidth, 0, KScreenWidth, self.scrollView.frame.size.height) animated:YES];
}

- (PublicTableView *)courseCatalogueTableview{
    if (!_courseCatalogueTableview) {
        _courseCatalogueTableview = [[PublicTableView alloc]initWithFrame:CGRectZero style:(UITableViewStyleGrouped)];
        [_courseCatalogueTableview registerClass:[CourseCatalogueCell class] forCellReuseIdentifier:courseCatalogueCell];
        [self reloadTableviewDatasource:_courseCatalogueTableview];
        [self.container addSubview:_courseCatalogueTableview];
        [_courseCatalogueTableview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.left.mas_equalTo(0);
            make.width.equalTo(@(ScreenWidth));
            make.bottom.mas_equalTo(self.container.mas_bottom);
        }];
    }
    return _courseCatalogueTableview;
}

- (PublicTableView *)courseIntroductionTableview{
    if (!_courseIntroductionTableview) {
        _courseIntroductionTableview = [[PublicTableView alloc]initWithFrame:CGRectZero style:(UITableViewStyleGrouped)];
        [_courseCatalogueTableview registerClass:[CourseIntroductionCell class] forCellReuseIdentifier:courseIntroductionCell];
        [self reloadTableviewDatasource:_courseIntroductionTableview];
        [self.container addSubview:_courseIntroductionTableview];
        [_courseCatalogueTableview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.left.mas_equalTo(@(ScreenWidth));
            make.width.equalTo(@(ScreenWidth));
            make.bottom.mas_equalTo(self.container.mas_bottom);
        }];
    }
    return _courseIntroductionTableview;
}

- (void)reloadTableviewDatasource:(PublicTableView *)tableviews{
    tableviews.numberOfSectionsInTableViewBlock = ^NSInteger(UITableView * _Nonnull tableView) {
        return 1;
    };
    
    tableviews.numberOfRowsInSectionBlock = ^NSInteger(UITableView * _Nonnull tableView, NSInteger section) {
        if (tableView == self.courseCatalogueTableview) {
            return 10;
        } else {
            return 6;
        }
    };
    
    tableviews.cellForRowAtIndexPathBlock = ^UITableViewCell * _Nonnull(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
        UITableViewCell *normalCell = nil;
        
        if (tableView == self.courseCatalogueTableview) {
            CourseCatalogueCell *cell =[tableView dequeueReusableCellWithIdentifier:courseCatalogueCell forIndexPath:indexPath];
            normalCell = cell;
        }else if(tableView == self.courseIntroductionTableview){
            CourseIntroductionCell *cell =[tableView dequeueReusableCellWithIdentifier:courseIntroductionCell forIndexPath:indexPath];
            normalCell = cell;
        }

        return normalCell;
    };
    
    tableviews.heightForRowAtIndexPath = ^CGFloat(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
        return 50;
    };
    
    tableviews.heightForHeaderInSectionBlock = ^CGFloat(UITableView * _Nonnull tableView, NSInteger section) {
        return 0.01;
    };
    
    tableviews.viewForHeaderInSectionBlock = ^UIView * _Nonnull(UITableView * _Nonnull tableView, NSInteger section) {
        UIView *subView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 0.01)];
        subView.backgroundColor=[UIColor colorWithRed:0.89 green:0.89 blue:0.91 alpha:1.00];
        return subView;
    };
    
    tableviews.heightForFooterInSectionBlock = ^CGFloat(UITableView * _Nonnull tableView, NSInteger section) {
        return 0.01;
    };
    
    tableviews.viewForFooterInSectionBlock = ^UIView * _Nonnull(UITableView * _Nonnull tableView, NSInteger section) {
        UIView *subView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 0.01)];
        subView.backgroundColor=[UIColor colorWithRed:0.89 green:0.89 blue:0.91 alpha:1.00];
        return subView;
    };
    
    tableviews.didSelectRowAtIndexPathBlock = ^(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
    
    };
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView;
{
    if (scrollView == self.scrollView) {
        CGPoint p = [scrollView contentOffset];
        if (p.x >= KScreenWidth) {
            [self.courseIntroductionButton setSelected:YES];
            [self.courseCatalogueButton setSelected:NO];
            if (self.courseIntroductionButton.selected) {
                [self.courseIntroductionButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                [self.courseIntroductionButton setBackgroundColor:[UIColor colorWithHexString:@"#277FEC"]];
            }
            [_courseCatalogueButton setTitleColor:[UIColor colorWithHexString:@"#2393EE"] forState:UIControlStateNormal];
            [_courseCatalogueButton setBackgroundColor:[UIColor colorWithHexString:@"#FFFFFF"]];
            
        } else {
            [self.courseIntroductionButton setSelected:NO];
            [self.courseCatalogueButton setSelected:YES];
            if (self.courseCatalogueButton.selected) {
                [self.courseCatalogueButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                [self.courseCatalogueButton setBackgroundColor:[UIColor colorWithHexString:@"#277FEC"]];
            }
            [_courseIntroductionButton setTitleColor:[UIColor colorWithHexString:@"#2393EE"] forState:UIControlStateNormal];
            [_courseIntroductionButton setBackgroundColor:[UIColor colorWithHexString:@"#FFFFFF"]];
        }
    }
}



@end
