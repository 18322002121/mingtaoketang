//
//  MineViewController.m
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/4/25.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "MineViewController.h"

@interface MineViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property(nonatomic,strong)UICollectionView *collectionView;
@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadingViews];
}

- (void)loadingViews{
    self.collectionView.backgroundColor = KWhiteColor;
    [self showCustomNavBar];
}

- (UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout =[[UICollectionViewFlowLayout alloc]init];
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, kNavAndStatusHight, KScreenWidth, KScreenHeight - kNavBarHeight - kTabBarHeight - kStatusBarHeight) collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.showsVerticalScrollIndicator = NO;
//        [_collectionView registerClass:[ClassificationSelectionCell class] forCellWithReuseIdentifier:classificationSelectionCell];
//        [_collectionView registerClass:[SubscribeCell class] forCellWithReuseIdentifier:subscribeCell];
//        [_collectionView registerClass:[CourseCenterCell class] forCellWithReuseIdentifier:courseCenterCell];
//        [_collectionView registerClass:[InformationCell class] forCellWithReuseIdentifier:informationCell];
//        [_collectionView registerClass:[ClassificationSelectionView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:classificationSelectionView];
//        [_collectionView registerClass:[NormalHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:normalHeaderView];
        [self.view addSubview:_collectionView];
    }
    return _collectionView;
}

//定义展示的Section的个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 4;
}

//定义展示的UICollectionViewCell的个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    if (section == 0) {
        return 4;
    }else if (section ==1){
        return 2;
    }else if(section ==2){
        return 2;
    }else{
        return 2;
    }
}

//每个UICollectionView展示的内容
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *goodsCell = nil;
//    if (indexPath.section == 0) {
//        ClassificationSelectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:classificationSelectionCell forIndexPath:indexPath];
//        [cell setSelectionModel:self.moduleSelectionArray[indexPath.row]];
//        goodsCell = cell;
//    }else if (indexPath.section ==1){
//        SubscribeCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:subscribeCell forIndexPath:indexPath];
//        goodsCell = cell;
//    }else if (indexPath.section == 2){
//        CourseCenterCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:courseCenterCell forIndexPath:indexPath];
//        goodsCell = cell;
//    }else if (indexPath.section == 3){
//        InformationCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:informationCell forIndexPath:indexPath];
//        goodsCell = cell;
//    }
    
    return goodsCell;
    
}

//定义每个UICollectionView 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        return CGSizeMake(KScreenWidth/5, 125);
    }else if (indexPath.section ==1){
        return CGSizeMake(KScreenWidth, 90);
    }else if (indexPath.section == 2){
        return CGSizeMake(KScreenWidth, 274);
    }else if (indexPath.section == 3){
        return CGSizeMake(KScreenWidth, 100);
    }else{
        return CGSizeZero;
    }
}

/** UICollectionView被选中时调用的方法 */
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
//    if (indexPath.section ==0){
//        NSMutableArray *selectControllerArr = [NSMutableArray arrayWithCapacity:0];
//        NSMutableArray *selectTitleArr = [NSMutableArray arrayWithCapacity:0];
//        [self.moduleSelectionArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//            ModuleSelectionModel *model = obj;
//            [selectControllerArr addObject:model.controller];
//            [selectTitleArr addObject:model.gridTitle];
//        }];
//        [collectionView reloadData];
//        NSString *className = selectControllerArr[indexPath.row];
//        Class class = NSClassFromString(className);
//        if (class){
//            UIViewController *vc = class.new;
//            vc.title = selectTitleArr[indexPath.row];
//            [self.navigationController pushViewController:vc animated:YES];
//        }
//        /*! 点击立刻取消该cell的选中状态 */
//        [collectionView deselectItemAtIndexPath:indexPath animated:YES];
//    }
}

//返回这个UICollectionView是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

//加载数据头部
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    UICollectionReusableView *reusableview = nil;
//    if (kind ==UICollectionElementKindSectionHeader) {
//        if (indexPath.section == 0) {
//            ClassificationSelectionView * headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:classificationSelectionView forIndexPath:indexPath];
//            reusableview = headerView;//加载banner图
//        }else{
//            NormalHeaderView * headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:normalHeaderView forIndexPath:indexPath];
//            reusableview = headerView;
//        }
//    }
    return reusableview;
}

//header宽高
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
    if (section == 0) {
        return CGSizeMake(KScreenWidth-30, 165);//banner图宽高
    }else if(section >1){
        return CGSizeMake(KScreenWidth, 90);
    }else{
        return CGSizeZero;
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

@end
