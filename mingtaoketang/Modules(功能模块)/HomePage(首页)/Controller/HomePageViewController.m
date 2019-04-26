//
//  HomePageViewController.m
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/4/25.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "HomePageViewController.h"
#import "RotationChartCell.h"
#import "FreeAndRecommendationCell.h"
#import "LiveBroadcastCourseCell.h"
#import "RecommendedTodayCell.h"
#import "FlashSaleCell.h"
#import "RecommendedTodayHeaderView.h"
#import "FlashSaleCellHeaderView.h"
#import "FreeCourseViewController.h"
#import "RecommendedCoursesViewController.h"

typedef NS_ENUM(NSUInteger, ShowSectionStatus) {
    ShowSectionStatusBanner = 0,    //banner
    ShowSectionStatusFree,          //免费课程
    ShowSectionStatusLive,          //直播
    ShowSectionStatusRecommend,     //今日推荐
    ShowSectionStatusFlashSale,     //限时抢购
    ShowSectionStatusInformation    //资讯
};

@interface HomePageViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property(nonatomic,strong)UICollectionView *collectionView;

@end

static NSString *const rotationChartCell = @"RotationChartCell";
static NSString *const freeAndRecommendationCell = @"FreeAndRecommendationCell";
static NSString *const liveBroadcastCourseCell = @"LiveBroadcastCourseCell";
static NSString *const recommendedTodayCell = @"RecommendedTodayCell";
static NSString *const flashSaleCell = @"FlashSaleCell";
static NSString *const recommendedTodayHeaderView = @"RecommendedTodayHeaderView";
static NSString *const flashSaleCellHeaderView = @"FlashSaleCellHeaderView";

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadingViews];
}

#pragma mark - 加载瀑布流布局视图

- (void)loadingViews{
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self showCustomNavBar];
}

#pragma mark - 加载不同cell视图

- (UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout =[[UICollectionViewFlowLayout alloc]init];
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, kNavAndStatusHight, KScreenWidth, KScreenHeight - kNavBarHeight - kTabBarHeight - kStatusBarHeight) collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.showsVerticalScrollIndicator = NO;
        
        //banner图cell
        [_collectionView registerClass:[RotationChartCell class] forCellWithReuseIdentifier:rotationChartCell];
        
        //免费课程 or 推荐课程
        [_collectionView registerClass:[FreeAndRecommendationCell class] forCellWithReuseIdentifier:freeAndRecommendationCell];
        
        //直播课程
        [_collectionView registerClass:[LiveBroadcastCourseCell class] forCellWithReuseIdentifier:liveBroadcastCourseCell];
        
        //今日推荐
        [_collectionView registerClass:[RecommendedTodayCell class] forCellWithReuseIdentifier:recommendedTodayCell];
        
        //今日推荐header
        [_collectionView registerClass:[RecommendedTodayHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:recommendedTodayHeaderView];
        
        //限时抢购
        [_collectionView registerClass:[FlashSaleCell class] forCellWithReuseIdentifier:flashSaleCell];
        
        //限时抢购header
        [_collectionView registerClass:[FlashSaleCellHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:flashSaleCellHeaderView];
        
        [self.view addSubview:_collectionView];
    }
    return _collectionView;
}

#pragma mark - 定义展示的Section的个数

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 5;
}

#pragma mark - 定义展示的UICollectionViewCell的个数

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    if (section == ShowSectionStatusBanner) {
        return 1;
    }else if (section == ShowSectionStatusFree){
        return 2;
    }else if(section == ShowSectionStatusLive){
        return 1;
    }else if(section == ShowSectionStatusRecommend){
        return 4;
    }else if (section == ShowSectionStatusFlashSale){
        return 4;
    }else{
        return 1;
    }
}

#pragma mark - 每个UICollectionView展示的内容

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *goodsCell = nil;
    if (indexPath.section == ShowSectionStatusBanner) {
        RotationChartCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:rotationChartCell forIndexPath:indexPath];
        goodsCell = cell;
    }else if (indexPath.section ==ShowSectionStatusFree){
            FreeAndRecommendationCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:freeAndRecommendationCell forIndexPath:indexPath];
            goodsCell = cell;
        }else if (indexPath.section == ShowSectionStatusLive){
            LiveBroadcastCourseCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:liveBroadcastCourseCell forIndexPath:indexPath];
            goodsCell = cell;
        }else if (indexPath.section == ShowSectionStatusRecommend){
            RecommendedTodayCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:recommendedTodayCell forIndexPath:indexPath];
            goodsCell = cell;
        }else if (indexPath.section == ShowSectionStatusFlashSale){
            FlashSaleCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:flashSaleCell forIndexPath:indexPath];
            goodsCell = cell;
        }
    
    return goodsCell;
}

#pragma mark - 定义每个UICollectionView的大小

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == ShowSectionStatusBanner) {
        return CGSizeMake(KScreenWidth - 26, 168);
    }else if (indexPath.section ==ShowSectionStatusFree){
        return CGSizeMake((KScreenWidth - 36)/2, 115);
    }else if (indexPath.section == ShowSectionStatusLive){
        return CGSizeMake(KScreenWidth - 26, 90);
    }else if (indexPath.section == ShowSectionStatusRecommend){
        return CGSizeMake((KScreenWidth - 36)/2, 143);
    }else if (indexPath.section == ShowSectionStatusFlashSale){
        return CGSizeMake(KScreenWidth - 26, 110);
    }else{
        return CGSizeZero;
    }
}

#pragma mark - 定义每个Section的四边间距

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 13, 10, 13);
}

#pragma mark -UICollectionView被选中时调用的方法

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1) {
        indexPath.row == 0 ? [self freeCourseView] : [self recommendedCoursesView];
    }
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
}

#pragma mark - 返回这个UICollectionView是否可以被选择

-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

#pragma mark - 加载数据头部

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    UICollectionReusableView *reusableview = nil;
        if (kind ==UICollectionElementKindSectionHeader) {
            if (indexPath.section == ShowSectionStatusRecommend) {
                RecommendedTodayHeaderView * headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:recommendedTodayHeaderView forIndexPath:indexPath];
                reusableview = headerView;
            }else if(indexPath.section == ShowSectionStatusFlashSale){
                FlashSaleCellHeaderView * headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:flashSaleCellHeaderView forIndexPath:indexPath];
                reusableview = headerView;
            }
        }
    return reusableview;
}

#pragma mark - header宽高

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
    if (section == ShowSectionStatusRecommend || section == ShowSectionStatusFlashSale) {
        return CGSizeMake(KScreenWidth, 50);
    }else{
        return CGSizeZero;
    }
}

#pragma mark - 即将进入视图

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

#pragma mark - 即将离开视图

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

#pragma mark - 免费课程

- (void)freeCourseView{
    FreeCourseViewController *freeCourseView = [[FreeCourseViewController alloc]init];
    [self.navigationController pushViewController:freeCourseView animated:YES];
}

#pragma mark - 推荐课程

- (void)recommendedCoursesView{
    RecommendedCoursesViewController *recommendedCoursesView = [[RecommendedCoursesViewController alloc]init];
    [self.navigationController pushViewController:recommendedCoursesView animated:YES];
}

@end
