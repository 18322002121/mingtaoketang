//
//  CurriculumViewController.m
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/4/25.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "CurriculumViewController.h"
#import "CurriculumCell.h"
#import "CurriculumHeaderView.h"

@interface CurriculumViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property(nonatomic,strong)UICollectionView *collectionView;
@end

static NSString *const curriculumCell = @"CurriculumCell";
static NSString *const curriculumHeaderView = @"CurriculumHeaderView";
@implementation CurriculumViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"课程";
    [self loadingViews];
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
        [_collectionView registerClass:[CurriculumCell class] forCellWithReuseIdentifier:curriculumCell];
        [_collectionView registerClass:[CurriculumHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:curriculumHeaderView];
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
    return 4;
}

#pragma mark - 每个UICollectionView展示的内容

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *goodsCell = nil;
    CurriculumCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:curriculumCell forIndexPath:indexPath];
    goodsCell = cell;
    return goodsCell;
}

#pragma mark - 定义每个UICollectionView的大小

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake((KScreenWidth - 35)/4, 90);
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
        CurriculumHeaderView * headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:curriculumHeaderView forIndexPath:indexPath];
        reusableview = headerView;
    }
    return reusableview;
}

#pragma mark - header宽高

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(KScreenWidth, 50);
}

@end
