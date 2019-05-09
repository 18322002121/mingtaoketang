//
//  EducationalSelectView.m
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/5/8.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "EducationalSelectView.h"
#import "EducationalSelectCell.h"

@interface EducationalSelectView ()<UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>
/** 初始化collectionView */
@property (nonatomic,strong) UICollectionView *collectionView;
/** 取消选择按钮 */
@property (nonatomic,strong) PublicButton *canCelButton;
@end
static NSString *const educationalSelectCell = @"EducationalSelectCell";
@implementation EducationalSelectView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self collectionView];
        [self canCelButton];
    }
    return self;
}

- (PublicButton *)canCelButton{
    if (!_canCelButton) {
        _canCelButton = [PublicButton buttonWithImage:@"" backgroundImageImage:@"" title:@"取消" titleColor:[UIColor colorWithHexString:@"#333333"] textFont:[UIFont systemFontOfSize:15] backgroundColor:[UIColor whiteColor] addView:self target:self action:@selector(canCelButtonClick:)];
        _canCelButton.layer.cornerRadius = 10;
    }
    return _canCelButton;
}

- (UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout =[[UICollectionViewFlowLayout alloc]init];
        if (@available(iOS 9.0, *)) {
            layout.sectionHeadersPinToVisibleBounds = YES;
        } else {
            // Fallback on earlier versions
        }
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, 0, 0) collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor lightGrayColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.pagingEnabled = YES;
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _collectionView.showsHorizontalScrollIndicator = NO;
        [_collectionView registerClass:[EducationalSelectCell class] forCellWithReuseIdentifier:educationalSelectCell];
        [self addSubview:_collectionView];
        
    }
    return _collectionView;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}


#pragma mark - 定义展示的UICollectionViewCell的个数

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}

#pragma mark - 每个UICollectionView展示的内容

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *goodsCell = nil;
    EducationalSelectCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:educationalSelectCell forIndexPath:indexPath];
    goodsCell = cell;
    return goodsCell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake((KScreenWidth - 40)/2, 120);
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).offset(0);
        make.left.mas_equalTo(self.mas_left).offset(20);
        make.right.mas_equalTo(self.mas_right).offset(-20);
        make.height.mas_offset(@120);
    }];
    
    [_canCelButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).offset(20);
        make.right.mas_equalTo(self.mas_right).offset(-20);
        make.bottom.mas_equalTo(self.mas_bottom).offset(-10);
        make.height.mas_offset(@50);
    }];
    
}

- (void)canCelButtonClick:(UIButton *)sender{
    !_canCelButtonClickBlock ? : _canCelButtonClickBlock(sender);
}

@end
