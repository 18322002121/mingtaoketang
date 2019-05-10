//
//  VideoPlayerViewController.m
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/4/29.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "VideoPlayerViewController.h"
#import "CourseCatalogueView.h"
#import "CourseIntroductionView.h"

@interface VideoPlayerViewController ()<SuperPlayerDelegate,UIScrollViewDelegate>
/** 初始化分页 */
@property (nonatomic,strong) PublicSegmentedControl *segmentedControl;
/** 播放器View的父视图*/
@property (nonatomic) UIView *playerFatherView;
@property (strong, nonatomic) SuperPlayerView *playerView;
/** 课程目录和课程简介底层view */
@property (nonatomic,strong) UIView *courseView;
/** 视频列表滑动scrollview */
@property (nonatomic,strong) UIScrollView  *scrollView;
/** 课程目录view */
@property (nonatomic,strong) CourseCatalogueView *courseCatalogueView;
/** 课程简介view */
@property (nonatomic,strong) CourseIntroductionView *courseIntroductionView;

@end

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
    [self buildSegment];
}



- (void)buildSegment
{
    self.segmentedControl.hidden = NO;
    self.scrollView.hidden = NO;
    self.courseCatalogueView.hidden = NO;
    self.courseIntroductionView.hidden = NO;
//    self.views3.hidden           = NO;
//    self.views4.hidden           = NO;
}

- (PublicSegmentedControl *)segmentedControl
{
    if (!_segmentedControl)
    {
        _segmentedControl                             = [[PublicSegmentedControl alloc] init];
        /*! 设置标题 */
        _segmentedControl.sectionTitles               = @[@"课程目录",@"课程简介"];
        /*! 自适应宽度，随着屏幕滑动自动滚动 */
        _segmentedControl.autoresizingMask            = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleWidth;
        /*! 默认选中第0个view */
        _segmentedControl.selectedSegmentIndex        = 0;
        /*! 标题背景颜色 */
        _segmentedControl.backgroundColor             = [UIColor clearColor];
        /*! 标题默认字体颜色 */
        _segmentedControl.titleTextAttributes         = @{NSForegroundColorAttributeName : [UIColor colorWithHexString:@"#2393EE"], NSFontAttributeName: [UIFont systemFontOfSize:15]};
        /*! 标题选中字体颜色 */
        _segmentedControl.selectedTitleTextAttributes = @{NSForegroundColorAttributeName : [UIColor colorWithHexString:@"#FFFFFF"], NSFontAttributeName: [UIFont systemFontOfSize:15]};
        /*! 标题选中的下划线的颜色 */
//        _segmentedControl.selectionIndicatorColor     = [UIColor redColor];
//        ! 标题选中的下划线的高度
//        _segmentedControl.selectionIndicatorHeight    = 2.0f;
        /*! 标题选中的样式：本样式为下划线 */
        _segmentedControl.selectionStyle              = HMSegmentedControlSelectionStyleBox;
        /*! 标题选中的下划线的方向：本样式为向下 */
        _segmentedControl.selectionIndicatorLocation  = HMSegmentedControlSelectionIndicatorLocationNone;
        _segmentedControl.selectionIndicatorBoxColor = [UIColor redColor];
        /*! 标题的中间的隔线：默认为：NO */
        _segmentedControl.verticalDividerEnabled      = YES;
        /*! 标题的中间的隔线颜色 */
        _segmentedControl.verticalDividerColor        = [UIColor lightGrayColor];
        /*! 标题的中间的隔线宽度 */
        _segmentedControl.verticalDividerWidth        = 1.0f;
        /*! 标题点击事件 */
        kWeakSelf(self);
        [_segmentedControl setIndexChangeBlock:^(NSInteger index) {
            [weakself.scrollView scrollRectToVisible:CGRectMake(KScreenWidth * index, 0, KScreenWidth, weakself.scrollView.frame.size.height) animated:YES];
        }];
        /*! 标题的背景颜色 */
        [self.courseView addSubview:_segmentedControl];
        [_segmentedControl mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.courseView.mas_left).offset(0);
            make.right.mas_equalTo(self.courseView.mas_right).offset(0);
            make.top.mas_equalTo(self.courseView.mas_top).offset(0);
            make.bottom.mas_equalTo(self.courseView.mas_bottom).offset(0);
        }];
    }
    return _segmentedControl;
}

- (UIScrollView *)scrollView
{
    if (!_scrollView)
    {
        /*! 这里的frame按实际情况更改！ */
        self.scrollView                                = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 260, KScreenWidth, KScreenHeight - 260- kNavAndStatusHight)];
        self.scrollView.backgroundColor                = [UIColor whiteColor];
        self.scrollView.pagingEnabled                  = YES;
        self.scrollView.showsHorizontalScrollIndicator = NO;
        self.scrollView.bounces                        = NO;
        self.scrollView.contentSize                    = CGSizeMake(KScreenWidth * (_segmentedControl.sectionTitles.count), self.scrollView.frame.size.height);
        self.scrollView.delegate                       = self;
        self.scrollView.backgroundColor                = [UIColor redColor];
        [self.scrollView scrollRectToVisible:CGRectMake(0, 0, KScreenWidth, self.scrollView.frame.size.height) animated:NO];
        [self.view addSubview:self.scrollView];
        [self courseCatalogueView];
        [self courseIntroductionView];
    }
    return _scrollView;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat pageWidth = scrollView.frame.size.width;
    NSInteger page = scrollView.contentOffset.x / pageWidth;
    
    [_segmentedControl setSelectedSegmentIndex:page animated:YES];
}

- (CourseCatalogueView *)courseCatalogueView{
    if (!_courseCatalogueView) {
        _courseCatalogueView = [[CourseCatalogueView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, self.scrollView.frame.size.height)];
        _courseCatalogueView.backgroundColor = kRandomColor;
        [self.scrollView addSubview:_courseCatalogueView];
    }
    return _courseCatalogueView;
}

- (CourseIntroductionView *)courseIntroductionView{
    if (!_courseIntroductionView) {
        _courseIntroductionView = [[CourseIntroductionView alloc]initWithFrame:CGRectMake(KScreenWidth, 0, KScreenWidth, self.scrollView.frame.size.height)];
        _courseIntroductionView.backgroundColor = kRandomColor;
        [self.scrollView addSubview:_courseIntroductionView];
    }
    return _courseIntroductionView;
}

@end
