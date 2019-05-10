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
#import "SearchResultViewController.h"
#import "RecommendedTodayHeaderView.h"
#import "InformationClassAssistantHeaderView.h"
#import "InformationViewCell.h"
#import "HomeBannerModel.h"
#import "LiveBroadcastCourseShowModel.h"
#import "RecommendedTodayModel.h"
#import "FlashSaleModel.h"
#import "InformationClassAssistantModel.h"
#import "InformationViewModel.h"
#import "MessageLoginViewController.h"
#import "BaseNavigationController.h"
#import "SettingModel.h"

typedef NS_ENUM(NSUInteger, ShowSectionStatus) {
    ShowSectionStatusBanner = 0,    //banner
    ShowSectionStatusFree,          //免费课程
    ShowSectionStatusLive,          //直播
    ShowSectionStatusRecommend,     //今日推荐
    ShowSectionStatusFlashSale,     //限时抢购
    ShowSectionStatusInformation    //资讯
};

@interface HomePageViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,PYSearchViewControllerDelegate>
@property(nonatomic,strong)UICollectionView *collectionView;
/** banner数组 */
@property (nonatomic,strong) NSMutableArray *bannerArray;
@property(nonatomic,strong)NSArray *tempArray;
/** 免费课程和推荐课程数组 */
@property (nonatomic,strong) NSMutableArray *moduleSelectionArray;
/** 首页直播数组 */
@property (nonatomic,strong) NSMutableArray *liveBroadcastaArray;
/** 今日推荐数组 */
@property (nonatomic,strong) NSMutableArray *recommendedTodayArray;
/** 限时抢购 */
@property (nonatomic,strong) NSMutableArray *flashSaleArray;
/** 资讯,开班,助手数组 */
@property (nonatomic,strong) NSMutableArray *informationClassAssistantArray;
/** 资讯助手文章 */
@property (nonatomic,strong) NSMutableArray *informationViewArray;
@end

static NSString *const rotationChartCell = @"RotationChartCell";
static NSString *const freeAndRecommendationCell = @"FreeAndRecommendationCell";
static NSString *const liveBroadcastCourseCell = @"LiveBroadcastCourseCell";
static NSString *const recommendedTodayCell = @"RecommendedTodayCell";
static NSString *const flashSaleCell = @"FlashSaleCell";
static NSString *const recommendedTodayHeaderView = @"RecommendedTodayHeaderView";
static NSString *const flashSaleCellHeaderView = @"FlashSaleCellHeaderView";
static NSString *const informationClassAssistantHeaderView = @"InformationClassAssistantHeaderView";
static NSString *const informationViewCell = @"InformationViewCell";
@implementation HomePageViewController

- (NSMutableArray *)bannerArray{
    if (!_bannerArray) {
        _bannerArray = [NSMutableArray arrayWithCapacity:0];
    }
    return _bannerArray;
}

- (NSMutableArray *)moduleSelectionArray{
    if (!_moduleSelectionArray) {
        _moduleSelectionArray = [NSMutableArray arrayWithCapacity:0];
    }
    return _moduleSelectionArray;
}

- (NSMutableArray *)liveBroadcastaArray{
    if (!_liveBroadcastaArray) {
        _liveBroadcastaArray = [NSMutableArray arrayWithCapacity:0];
    }
    return _liveBroadcastaArray;
}

- (NSMutableArray *)recommendedTodayArray{
    if (!_recommendedTodayArray) {
        _recommendedTodayArray = [NSMutableArray arrayWithCapacity:0];
    }
    return _recommendedTodayArray;
}

- (NSMutableArray *)flashSaleArray{
    if (!_flashSaleArray) {
        _flashSaleArray = [NSMutableArray arrayWithCapacity:0];
    }
    return _flashSaleArray;
}

- (NSMutableArray *)informationClassAssistantArray{
    if (!_informationClassAssistantArray) {
        _informationClassAssistantArray = [NSMutableArray arrayWithCapacity:0];
    }
    return _informationClassAssistantArray;
}

- (NSMutableArray *)informationViewArray{
    if (!_informationViewArray) {
        _informationViewArray = [NSMutableArray arrayWithCapacity:0];
    }
    return _informationViewArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self reloadingRefresh];
    [self loadingViews];
    [self moduleSelection];
//    [self login];
}

- (void)moduleSelection{
    NSArray *dataArray = @[@{@"iconImage":@"free",@"gridTitle":@""},
                           @{@"iconImage":@"recommend",@"gridTitle":@""},
                           ];
    _tempArray = dataArray;
    self.moduleSelectionArray = [NSMutableArray arrayWithCapacity:0];
    [dataArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self.moduleSelectionArray  addObject:[SettingModel initWithDict:obj]];
    }];
}

- (void)reloadingRefresh{
    self.collectionView.mj_header = [PublicRefreshHeader headerWithRefreshingBlock:^{
        //        [self.datas removeAllObjects];
        //        NSArray *datas = [self hn_modelArrayWithCategory:self.model.category fromModel:x];
        //        [self.datas addObjectsFromArray:datas];
        //        [self.tableView reloadData];
        [self networkRequest];
        [self.collectionView.mj_header endRefreshing];
    }];
    
//    self.collectionView.mj_footer = [PublicRefreshFooter footerWithRefreshingBlock:^{
//        //        if (self.datas.count == 0 || !self.datas) {
//        //            [self.tableView.mj_footer endRefreshingWithNoMoreData];
//        //        }else {
//        //            [self.datas addObjectsFromArray:self.datas];
//        //            [self.tableView.mj_footer endRefreshing];
//        //        }
//    }];
//    [self.collectionView.mj_header beginRefreshing];
}


- (void)networkRequest{
    [super networkRequest];
    
    /** 获取banner图 */
    [HCYRequestManager banner_type:@"10" success:^(id responseObject) {
        NSDictionary *dict = responseObject;
        if (kDictIsEmpty(dict)) {
            
        }else{
            if ([[responseObject objectForKey:@"status"] integerValue] == 1) {
                [self.bannerArray removeAllObjects];
                HomeBannerModel *model = [HomeBannerModel yy_modelWithJSON:responseObject];
                [model.data enumerateObjectsUsingBlock:^(HomeData * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    HomeData *dataModel = obj;
                    [self.bannerArray addObject:[NSString stringWithFormat:@"%@",dataModel.path]];
                }];
                [self.collectionView reloadData];
            }
        }
    } failure:^(NSError *errorMessage) {
        NSLog(@"%@",errorMessage);
    }];
    
//    /** 获取banner图2 */
//    [HCYRequestManager banner_type:@"5" success:^(id responseObject) {
//        NSDictionary *dict = responseObject;
//        if (kDictIsEmpty(dict)) {
//
//        }else{
//            if ([[responseObject objectForKey:@"status"] integerValue] == 1) {
//                [self.bannerArray2 removeAllObjects];
//                HomeBannerModel *model = [HomeBannerModel yy_modelWithJSON:responseObject];
//                [model.data enumerateObjectsUsingBlock:^(HomeData * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//                    HomeData *dataModel = obj;
//                    [self.bannerArray2 addObject:dataModel];
//                }];
//                [self.collectionView reloadData];
//            }
//        }
//    } failure:^(NSError *errorMessage) {
//
//    }];
    
    /** 直播 */
    [HCYRequestManager uid:@"33487" success:^(id responseObject) {
        NSDictionary *dict = responseObject;
        if (kDictIsEmpty(dict)) {
            
        }else{
            if ([[responseObject objectForKey:@"status"] integerValue] == 1) {
                [self.liveBroadcastaArray removeAllObjects];
                LiveBroadcastCourseShowModel *model = [LiveBroadcastCourseShowModel yy_modelWithJSON:dict];
                [model.data enumerateObjectsUsingBlock:^(LiveBroadcastCourseShowData * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    LiveBroadcastCourseShowData *dataModel = obj;
                    [self.liveBroadcastaArray addObject:dataModel];
                }];
                [self.collectionView reloadData];
            }
        }
    } failure:^(NSError *errorMessage) {

    }];
    
    /** 今日推荐 */
    [HCYRequestManager appTuijianSuccess:^(id responseObject) {
        NSDictionary *dict = responseObject;
        if (kDictIsEmpty(dict)) {
            
        }else{
            if ([[responseObject objectForKey:@"status"] integerValue] == 1) {
                [self.recommendedTodayArray removeAllObjects];
                RecommendedTodayModel * model = [RecommendedTodayModel yy_modelWithJSON:responseObject];
                [model.data enumerateObjectsUsingBlock:^(RecommendedTodayData * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    RecommendedTodayData *dataModel = obj;
                    [self.recommendedTodayArray addObject:dataModel];
                }];
                [self.collectionView reloadData];
            }
        }
    } failure:^(NSError *errorMessage) {

    }];
    
    /** 限时抢购 */
    [HCYRequestManager appQianggouSuccess:^(id responseObject) {
        NSDictionary *dict = responseObject;
        if (kDictIsEmpty(dict)) {
            
        }else{
            if ([[responseObject objectForKey:@"status"] integerValue] == 1) {
                [self.flashSaleArray removeAllObjects];
                FlashSaleModel *model = [FlashSaleModel yy_modelWithJSON:responseObject];
                [model.data enumerateObjectsUsingBlock:^(FlashSaleData * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    FlashSaleData *dataModel = obj;
                    [self.flashSaleArray addObject:dataModel];
                }];
                [self.collectionView reloadData];
            }
        }
    } failure:^(NSError *errorMessage) {

    }];
    
    /** 资讯,开班,助手 */
    [HCYRequestManager appArticle_catSuccess:^(id responseObject) {
        NSDictionary *dict = responseObject;
        if (kDictIsEmpty(dict)) {
            
        }else{
            if ([[responseObject objectForKey:@"status"] integerValue] == 1) {
                [self.informationClassAssistantArray removeAllObjects];
                InformationClassAssistantModel *model = [InformationClassAssistantModel yy_modelWithJSON:responseObject];
                [model.data enumerateObjectsUsingBlock:^(InformationClassAssistantData * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    InformationClassAssistantData *dataModel = obj;
                    [self.informationClassAssistantArray addObject:dataModel];
                }];
                [self.collectionView reloadData];
            }
        }
    } failure:^(NSError *errorMessage) {
        NSLog(@"%@",errorMessage);
    }];
    
}

#pragma mark - 加载瀑布流布局视图

- (void)loadingViews{
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self showCustomNavBar:^(UITextField * _Nonnull senders) {
        NSArray *hotSeaches = @[@"电商", @"航空培训", @"电商产品", @"网络营销", @"网络营销", @"3D设计"];
        // 2. 创建搜索控制器
        PYSearchViewController *searchViewController = [PYSearchViewController searchViewControllerWithHotSearches:hotSeaches searchBarPlaceholder:@"请输入您想搜索产品的关键词" didSearchBlock:^(PYSearchViewController *searchViewController, UISearchBar *searchBar, NSString *searchText) {
            [searchViewController.navigationController pushViewController:[[SearchResultViewController alloc] init] animated:YES];
        }];
        searchViewController.hotSearchStyle = PYHotSearchStyleColorfulTag;//设置热门搜索为彩色标签风格
        searchViewController.searchHistoryStyle = PYSearchHistoryStyleBorderTag;//设置搜索历史为带边框标签风格
        searchViewController.searchTextField.font=[UIFont systemFontOfSize:13.0];
        searchViewController.delegate = self;
        // 3. 跳转到搜索控制器
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:searchViewController];
        [self presentViewController:nav  animated:NO completion:nil];
    }];
}

#pragma mark - pysearch搜索联想代理
- (void)searchViewController:(PYSearchViewController *)searchViewController searchTextDidChange:(UISearchBar *)seachBar searchText:(NSString *)searchText
{
    if (searchText.length) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            NSMutableArray *searchSuggestionsM = [NSMutableArray array];
            for (int i = 0; i < arc4random_uniform(5) + 10; i++) {
                NSString *searchSuggestion = [NSString stringWithFormat:@"Search suggestion %d", i];
                [searchSuggestionsM addObject:searchSuggestion];
            }
            searchViewController.searchSuggestions = searchSuggestionsM;
        });
    }
}

#pragma mark - 加载不同cell视图

- (UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout =[[UICollectionViewFlowLayout alloc]init];
        if (@available(iOS 9.0, *)) {
            layout.sectionHeadersPinToVisibleBounds = YES;
        } else {
            // Fallback on earlier versions
        }
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
        
        //资讯
        [_collectionView registerClass:[InformationClassAssistantHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:informationClassAssistantHeaderView];
        
        [_collectionView registerClass:[InformationViewCell class] forCellWithReuseIdentifier:informationViewCell];
        
        [self.view addSubview:_collectionView];

    }
    return _collectionView;
}

#pragma mark - 定义展示的Section的个数

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 6;
}

#pragma mark - 定义展示的UICollectionViewCell的个数

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    if (section == ShowSectionStatusBanner) {
        return 1;
    }else if (section == ShowSectionStatusFree){
        return self.moduleSelectionArray.count;
    }else if(section == ShowSectionStatusLive){
        return 1;
    }else if(section == ShowSectionStatusRecommend){
        return self.recommendedTodayArray.count;
    }else if (section == ShowSectionStatusFlashSale){
        return self.flashSaleArray.count;
    }else if (section == ShowSectionStatusInformation){
        return self.informationViewArray.count;
    }else{
        return 1;
    }
}

#pragma mark - 每个UICollectionView展示的内容

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *goodsCell = nil;
    if (indexPath.section == ShowSectionStatusBanner) {
        RotationChartCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:rotationChartCell forIndexPath:indexPath];
        [cell setBannerArray:self.bannerArray];
        goodsCell = cell;
    }else if (indexPath.section ==ShowSectionStatusFree){
            FreeAndRecommendationCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:freeAndRecommendationCell forIndexPath:indexPath];
        [cell setFreeModel:self.moduleSelectionArray[indexPath.row]];
            goodsCell = cell;
        }else if (indexPath.section == ShowSectionStatusLive){
            LiveBroadcastCourseCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:liveBroadcastCourseCell forIndexPath:indexPath];
            [cell setLiveBroadcastaArray:self.liveBroadcastaArray];
            goodsCell = cell;
        }else if (indexPath.section == ShowSectionStatusRecommend){
            RecommendedTodayCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:recommendedTodayCell forIndexPath:indexPath];
            [cell setRecommendedModel:self.recommendedTodayArray[indexPath.row]];
            goodsCell = cell;
        }else if (indexPath.section == ShowSectionStatusFlashSale){
            FlashSaleCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:flashSaleCell forIndexPath:indexPath];
            [cell setFlashSaleModel:self.flashSaleArray[indexPath.row]];
            goodsCell = cell;
        }else if (indexPath.section == ShowSectionStatusInformation){
            InformationViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:informationViewCell forIndexPath:indexPath];
            [cell setInformationModel:self.informationViewArray[indexPath.row]];
            goodsCell = cell;
        }
    
    return goodsCell;
}

#pragma mark - 定义每个UICollectionView的大小

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == ShowSectionStatusBanner) {
        return CGSizeMake(KScreenWidth - 26, 168);
    }else if (indexPath.section ==ShowSectionStatusFree){
        return CGSizeMake((KScreenWidth - 36)/2, 95);
    }else if (indexPath.section == ShowSectionStatusLive){
        return CGSizeMake(KScreenWidth - 26, 90);
    }else if (indexPath.section == ShowSectionStatusRecommend){
        return CGSizeMake((KScreenWidth - 36)/2, 143);
    }else if (indexPath.section == ShowSectionStatusFlashSale){
        return CGSizeMake(KScreenWidth - 26, 110);
    }else if (indexPath.section == ShowSectionStatusInformation){
        return CGSizeMake(KScreenWidth - 26, 300);
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
            }else if (indexPath.section == ShowSectionStatusInformation){
                InformationClassAssistantHeaderView * headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:informationClassAssistantHeaderView forIndexPath:indexPath];
                [headerView setInformationClassAssistantArray:self.informationClassAssistantArray];
                [self reloadInformationClassAssistantHeaderView:headerView];
                reusableview = headerView;
            }
        }
    return reusableview;
}

#pragma mark - header宽高

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
    if (section == ShowSectionStatusRecommend || section == ShowSectionStatusFlashSale || section == ShowSectionStatusInformation) {
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

#pragma mark - 加载 资讯,开班,助手

- (void)reloadInformationClassAssistantHeaderView:(InformationClassAssistantHeaderView *)header{
    /** 资讯按钮回调 */
    header.informationButtonClickBlock = ^(UIButton * _Nonnull sender) {
        [HCYRequestManager appcat_id:[NSString stringWithFormat:@"%ld",(long)sender.tag] success:^(id responseObject) {
            NSDictionary *dict = responseObject;
            if (kDictIsEmpty(dict)) {
                
            }else{
                if ([[responseObject objectForKey:@"status"] integerValue] == 1) {
                    [self.informationViewArray removeAllObjects];
                    InformationViewModel *model = [InformationViewModel yy_modelWithJSON:responseObject];
                    [model.data enumerateObjectsUsingBlock:^(InformationViewData * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                        InformationViewData *dataModel = obj;
                        [self.informationViewArray addObject:dataModel];
                    }];
                    [self.collectionView reloadData];
                }
            }
        } failure:^(NSError *errorMessage) {
            NSLog(@"%@",errorMessage);
        }];
    };
    /** 开班按钮回调 */
    header.offerCourseButtonClickBlock = ^(UIButton * _Nonnull sender) {
        [HCYRequestManager appcat_id:[NSString stringWithFormat:@"%ld",(long)sender.tag] success:^(id responseObject) {
            NSLog(@"%@",responseObject);
        } failure:^(NSError *errorMessage) {
            NSLog(@"%@",errorMessage);
        }];
    };
    /** 助手按钮回调 */
    header.assistantButtonClickBlock = ^(UIButton * _Nonnull sender) {
        [HCYRequestManager appcat_id:[NSString stringWithFormat:@"%ld",(long)sender.tag] success:^(id responseObject) {
            NSLog(@"%@",responseObject);
        } failure:^(NSError *errorMessage) {
            NSLog(@"%@",errorMessage);
        }];
    };
}

#pragma mark - 登录
- (void)login{
    MessageLoginViewController *messageLoginView = [[MessageLoginViewController alloc]init];
    BaseNavigationController *rootNav = [[BaseNavigationController alloc]initWithRootViewController:messageLoginView];
    [self presentViewController:rootNav animated:YES completion:nil];
}


@end
