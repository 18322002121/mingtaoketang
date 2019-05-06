//
//  LiveBroadcastCourseCell.m
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/4/25.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "LiveBroadcastCourseCell.h"
#import "LiveBroadcastCourseShowCell.h"

@interface LiveBroadcastCourseCell ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic,strong) UIView *bottomView;
@property (nonatomic,strong) UICollectionView *collectionView;
@end

static NSString *const liveBroadcastCourseShowCell = @"LiveBroadcastCourseShowCell";
@implementation LiveBroadcastCourseCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self bottomView];
    }
    return self;
}

- (UIView *)bottomView{
    if (!_bottomView) {
        _bottomView = [[UIView alloc]init];
        _bottomView.layer.cornerRadius = 5;
        [self bottomViews:_bottomView];
        [self.contentView addSubview:_bottomView];
    }
    return _bottomView;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [_bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView.mas_top).offset(0);
        make.left.mas_equalTo(self.contentView.mas_left).offset(0);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(0);
        make.right.mas_equalTo(self.contentView.mas_right).offset(0);
    }];
}

- (void)setLiveBroadcastaArray:(NSMutableArray *)liveBroadcastaArray{
    _liveBroadcastaArray = liveBroadcastaArray;
    if (kArrayIsEmpty(_liveBroadcastaArray)) {
    }else{
        self.collectionView.backgroundColor = [UIColor whiteColor];
    }
    
}

- (UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _collectionView = [[UICollectionView alloc]initWithFrame:self.bounds collectionViewLayout:layout];
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.pagingEnabled = YES;
        [_collectionView registerClass:[LiveBroadcastCourseShowCell class] forCellWithReuseIdentifier:liveBroadcastCourseShowCell];
        [self.bottomView addSubview:_collectionView];
    }
    return _collectionView;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.liveBroadcastaArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    LiveBroadcastCourseShowCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:liveBroadcastCourseShowCell forIndexPath:indexPath];
    [cell setLiveBroadcastModel:self.liveBroadcastaArray[indexPath.row]];
    return cell;
}

// y间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}
// 设置水平间隙
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 10;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"点击的是第%ld个",(long)indexPath.row);
//    SelectedActivitiesShowViewController * selectedActivitiesShow = [[SelectedActivitiesShowViewController alloc]init];
//    [[self currentViewController].navigationController pushViewController:selectedActivitiesShow animated:YES];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(self.bottomView.frame.size.width, self.bottomView.frame.size.height);
}

- (void)bottomViews:(UIView *)bottomViews {
    bottomViews.layer.shadowColor = [UIColor blackColor].CGColor;//shadowColor阴影颜色
    bottomViews.layer.shadowOffset = CGSizeMake(0,5);//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
    bottomViews.layer.shadowOpacity = 0.5;//阴影透明度，默认0
    bottomViews.layer.shadowRadius = 5;//阴影半径，默认3
}


@end
