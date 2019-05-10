//
//  MineViewController.m
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/4/25.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "MineViewController.h"
#import "MineViewCell.h"
#import "MineHeaderView.h"
#import "RechargeViewController.h"
#import "SettingViewController.h"
#import "SettingModel.h"
#import "MyCollectionViewController.h"
#import "LearningRecordViewController.h"
#import "MyCourseViewController.h"
#import "MyNewsViewController.h"
#import "OnlineConsultationViewController.h"
#import "InviteCourtesyViewController.h"
#import "PersonalInformationViewController.h"
#import "MessageLoginViewController.h"
#import "BaseNavigationController.h"
#import "PersonalInformationModel.h"

typedef NS_ENUM(NSUInteger, ShowSectionStatus) {
    ShowSectionStatusCollection = 0,    //我的收藏
    ShowSectionStatusRecord,            //学习记录
    ShowSectionStatusCourse,            //我的课程
    ShowSectionStatusNews,              //我的消息
    ShowSectionStatusConsultation,      //在线咨询
    ShowSectionStatusInvite             //邀请有礼
};

@interface MineViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property(nonatomic,strong)UICollectionView *collectionView;
@property(nonatomic,strong)NSMutableArray *moduleSelectionArray;
@property(nonatomic,strong)NSArray *tempArray;
/** 初始化模型数组 */
@property (nonatomic,strong) NSMutableArray *personalInformationArray;
/** 金币个数 */
@property (nonatomic,strong) NSString *user_money;
/** 用户昵称 */
@property (nonatomic,strong) NSString *userName;
@end

static NSString *const mineViewCell = @"MineViewCell";
static NSString *const mineHeaderView = @"MineHeaderView";
@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadingViews];
    [self moduleSelection];
    [self reloadingRefresh];
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
}

- (NSMutableArray *)personalInformationArray{
    if (!_personalInformationArray) {
        _personalInformationArray = [NSMutableArray arrayWithCapacity:0];
    }
    return _personalInformationArray;
}

- (void)networkRequest{
    [HCYRequestManager app_user_detail_uid:([PublicUserDefaults valueForKey:@"user_id"] ? [PublicUserDefaults valueForKey:@"user_id"] : @"") success:^(id responseObject) {
        NSLog(@"%@",responseObject);
        NSDictionary *dict = responseObject;
        if (kDictIsEmpty(dict)) {
            
        }else{
            if ([[responseObject objectForKey:@"status"] integerValue] == 1) {
                [self.personalInformationArray removeAllObjects];
                PersonalInformationModel *model = [PersonalInformationModel yy_modelWithJSON:responseObject];
                [model.data enumerateObjectsUsingBlock:^(PersonalInformationData * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    PersonalInformationData *dataModel = obj;
                    self.user_money = dataModel.user_money;
                    self.userName = dataModel.nickname;
                    if ([dataModel.sex isEqualToString:@"1"]) {
                        dataModel.sex = @"男";
                    }else if ([dataModel.sex isEqualToString:@"2"]){
                        dataModel.sex = @"女";
                    }
                    [self.personalInformationArray addObjectsFromArray:@[dataModel.avatar,dataModel.nickname,dataModel.mobile,dataModel.sex]];
                }];
                [self.collectionView reloadData];
            }
        }
    } failure:^(NSError *errorMessage) {
        NSLog(@"%@",errorMessage);
    }];
}

#pragma mark - 请求数据
- (void)moduleSelection{
    NSArray *dataArray = @[@{@"iconImage":@"study",@"gridTitle":@"我的收藏"},
                           @{@"iconImage":@"grade",@"gridTitle":@"学习记录"},
                           @{@"iconImage":@"test",@"gridTitle":@"我的课程"},
                           @{@"iconImage":@"checkin",@"gridTitle":@"我的消息"},
                           @{@"iconImage":@"checkin",@"gridTitle":@"在线咨询"},
                           @{@"iconImage":@"checkin",@"gridTitle":@"邀请有礼"}
                           ];
    _tempArray = dataArray;
    self.moduleSelectionArray = [NSMutableArray arrayWithCapacity:0];
    [dataArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self.moduleSelectionArray  addObject:[SettingModel initWithDict:obj]];
    }];
}

#pragma mark - 加载瀑布流布局视图

- (void)loadingViews{
    self.collectionView.backgroundColor = [UIColor whiteColor];
}

#pragma mark - 加载不同cell视图

- (UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout =[[UICollectionViewFlowLayout alloc]init];
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight - kNavBarHeight - kTabBarHeight - kStatusBarHeight) collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.showsVerticalScrollIndicator = NO;
        [_collectionView registerClass:[MineViewCell class] forCellWithReuseIdentifier:mineViewCell];
        [_collectionView registerClass:[MineHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:mineHeaderView];
        [self.view addSubview:_collectionView];
    }
    return _collectionView;
}

#pragma mark - 定义展示的Section的个数

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

#pragma mark - 定义展示的UICollectionViewCell的个数

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.moduleSelectionArray.count;
}

#pragma mark - 每个UICollectionView展示的内容

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *goodsCell = nil;
    MineViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:mineViewCell forIndexPath:indexPath];
    [cell setSettingModels:self.moduleSelectionArray[indexPath.row]];
    goodsCell = cell;
    return goodsCell;
}

#pragma mark - 定义每个UICollectionView的大小

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake((KScreenWidth - 35)/3, 90);
}

#pragma mark - 定义每个Section的四边间距

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 13, 10, 13);
}

#pragma mark - 两个cell之间的最小间距间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 1;
}

#pragma mark -UICollectionView被选中时调用的方法

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == ShowSectionStatusCollection) {
        MyCollectionViewController *myCollectionView = [[MyCollectionViewController alloc]init];
        [self.navigationController pushViewController:myCollectionView animated:YES];
    }else if (indexPath.row == ShowSectionStatusRecord){
        LearningRecordViewController *learningRecordView = [[LearningRecordViewController alloc]init];
        [self.navigationController pushViewController:learningRecordView animated:YES];
    }else if (indexPath.row == ShowSectionStatusCourse){
        MyCourseViewController *myCourseView = [[MyCourseViewController alloc]init];
        [self.navigationController pushViewController:myCourseView animated:YES];
    }else if (indexPath.row == ShowSectionStatusNews){
        MyNewsViewController *myNewsView = [[MyNewsViewController alloc]init];
        [self.navigationController pushViewController:myNewsView animated:YES];
    }else if (indexPath.row == ShowSectionStatusConsultation){
        OnlineConsultationViewController *onlineConsultationView = [[OnlineConsultationViewController alloc]init];
        [self.navigationController pushViewController:onlineConsultationView animated:YES];
    }else if (indexPath.row == ShowSectionStatusInvite){
        #import "InviteCourtesyViewController.h"
        InviteCourtesyViewController *inviteCourtesyView = [[InviteCourtesyViewController alloc]init];
        [self.navigationController pushViewController:inviteCourtesyView animated:YES];
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
        MineHeaderView * headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:mineHeaderView forIndexPath:indexPath];
        [headerView setUser_Money:self.user_money userName:self.userName];
        [self mineHeaderClick:headerView];
        reusableview = headerView;
    }
    return reusableview;
}

#pragma mark - header宽高

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(KScreenWidth, 280);
}

#pragma mark - MineHeaderView上按钮操作
- (void)mineHeaderClick:(MineHeaderView *)headerView{
    headerView.RechargeClickBlock = ^(UIButton * _Nonnull sender) {
        RechargeViewController *rechargeView = [[RechargeViewController alloc]init];
        [self.navigationController pushViewController:rechargeView animated:YES];
    };
    
    headerView.SetTingClickBlock = ^(UIButton * _Nonnull sender) {
        SettingViewController *settingView = [[SettingViewController alloc]init];
        [self.navigationController pushViewController:settingView animated:YES];
    };
    
    headerView.EducationalInstitutionsClickBlock = ^(UIButton * _Nonnull sender) {
        NSLog(@"院校登陆");
    };
    
    headerView.PersonalInformationClickBlock = ^(UIButton * _Nonnull sender) {
        if ([PublicUserDefaults valueForKey:@"user_id"]) {
            PersonalInformationViewController *personalInformationView = [[PersonalInformationViewController alloc]init];
            personalInformationView.onClickedOKbtnBlock = ^(UIButton * _Nonnull sender) {
                [self networkRequest];
            };
            [self.navigationController pushViewController:personalInformationView animated:YES];
        }else{
            MessageLoginViewController *messageLoginView = [[MessageLoginViewController alloc]init];
            BaseNavigationController *rootNav = [[BaseNavigationController alloc]initWithRootViewController:messageLoginView];
            [self presentViewController:rootNav animated:YES completion:nil];
        }
        
    };
}

@end






