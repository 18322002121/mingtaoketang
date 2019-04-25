//
//  PublicTableView.m
//  mingtaohangkong
//
//  Created by Linlin Ge on 2019/4/11.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "PublicTableView.h"
@interface PublicTableView ()<UITableViewDelegate,UITableViewDataSource>

@end
@implementation PublicTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    if (self = [super initWithFrame:frame style:style]) {
        self.delegate = self;
        self.dataSource = self;
        self.estimatedRowHeight = 200;
        self.estimatedSectionHeaderHeight = 0;
        self.estimatedSectionFooterHeight = 0;
        self.rowHeight = UITableViewAutomaticDimension;
        self.showsVerticalScrollIndicator = NO;
        if (@available(iOS 11.0, *)) {
            [self setContentInsetAdjustmentBehavior:UIScrollViewContentInsetAdjustmentNever];
        } else {
        }
    }
    return self;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return self.heightForRowAtIndexPath ? self.heightForRowAtIndexPath(tableView,indexPath) : 44;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.numberOfSectionsInTableViewBlock ? self.numberOfSectionsInTableViewBlock(tableView) : 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.numberOfRowsInSectionBlock ? self.numberOfRowsInSectionBlock(tableView, section) : 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return self.cellForRowAtIndexPathBlock(tableView, indexPath);
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return self.heightForHeaderInSectionBlock ? self.heightForHeaderInSectionBlock(tableView, section) : 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return self.heightForFooterInSectionBlock ? self.heightForFooterInSectionBlock(tableView, section) : 44;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return self.viewForHeaderInSectionBlock ? self.viewForHeaderInSectionBlock(tableView, section) : (UIView*)[UIView new];
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return self.viewForFooterInSectionBlock ? self.viewForFooterInSectionBlock(tableView, section) : (UIView*)[UIView new];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    return !self.didSelectRowAtIndexPathBlock ? :self.didSelectRowAtIndexPathBlock(tableView, indexPath);
}

#pragma mark - ***** 解决tableview的分割线短一截
- (void)viewDidLayoutSubviews
{
    if ([self respondsToSelector:@selector(setSeparatorInset:)])
    {
        [self setSeparatorInset:UIEdgeInsetsMake(0,0,0,0)];
    }
    
    if ([self respondsToSelector:@selector(setLayoutMargins:)])
    {
        [self setLayoutMargins:UIEdgeInsetsMake(0,0,0,0)];
    }
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)])
    {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setLayoutMargins:)])
    {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    
    /*! 第一种：3d xyz三维坐标刚出现0.1 0.1 1  0.5 s后正常 */
//        cell.layer.transform = CATransform3DMakeScale(0.1,0.1,1);
//        [UIView animateWithDuration:0.6 animations:^{
//
//            cell.layer.transform = CATransform3DMakeScale(1,1,1);
//
//        }];
    
    /*! 第二种：卡片式动画 */
//    static CGFloat initialDelay = 0.2f;
//    static CGFloat stutter = 0.06f;
//
//    cell.contentView.transform =  CGAffineTransformMakeTranslation(KScreenWidth, 0);
//
//    [UIView animateWithDuration:1.0f delay:initialDelay + ((indexPath.row) * stutter) usingSpringWithDamping:0.6 initialSpringVelocity:0 options:0 animations:^{
//        cell.contentView.transform = CGAffineTransformIdentity;
//    } completion:NULL];
    
    /*! 第三种：从下往上 */
    
//        [UIView animateWithDuration:1 animations:^{
//
//            cell.layer.transform = CATransform3DMakeTranslation(0, 0, 0);
//
//        }];
    
    /*! 第四种：右下角出来 */
    
//        cell.layer.transform = CATransform3DMakeTranslation(KScreenWidth, KScreenHeight, 0);
//
//        [UIView animateWithDuration:0.5 animations:^{
//
//            cell.layer.transform = CATransform3DMakeTranslation(0, 0, 0);
//
//        }];
    
    /*! 第五种：右上角出现 */
    
    //    cell.layer.transform = CATransform3DMakeTranslation(SCREEN_WIDTH, -SCREEN_HEIGHT, 0);
    
    /*! 第六种：翻转动画 */
//        CATransform3D rotation;
//        rotation = CATransform3DMakeRotation( (90.0*M_PI)/180, 0.0, 0.7, 0.4);
//        rotation.m44 = 1.0/ -600;
//        //阴影
//        cell.layer.shadowColor = [[UIColor blackColor]CGColor];
//
//        //阴影偏移
//        cell.layer.shadowOffset = CGSizeMake(10, 10);
//        cell.alpha = 0;
//        cell.layer.transform = rotation;
//        //锚点
//        cell.layer.anchorPoint = CGPointMake(0.5, 0.5);
//        [UIView beginAnimations:@"rotation" context:NULL];
//        [UIView setAnimationDuration:0.8];
//        cell.layer.transform = CATransform3DIdentity;
//        cell.alpha = 1;
//        cell.layer.shadowOffset = CGSizeMake(0, 0);
//        [UIView commitAnimations];
    
    /*! 第七种：扇形动画 */
//        NSArray *array = tableView.indexPathsForVisibleRows;
//
//        NSIndexPath *firstIndexPath = array[0];
//        //设置anchorPoint﻿
//        cell.layer.anchorPoint = CGPointMake(0, 0.5);
//
//        //为了防止cell视图移动，重新把cell放回原来的位置﻿
//        cell.layer.position = CGPointMake(0, cell.layer.position.y);
//         //设置cell 按照z轴旋转90度，注意是弧度﻿
//        if (firstIndexPath.row < indexPath.row)
//        {
//            cell.layer.transform = CATransform3DMakeRotation(M_PI_2, 0, 0, 1.0);
//        }
//        else
//        {
//            cell.layer.transform = CATransform3DMakeRotation(- M_PI_2, 0, 0, 1.0);
//        }
//        cell.alpha = 0.0;
//        [UIView animateWithDuration:1 animations:^{
//
//            cell.layer.transform = CATransform3DIdentity;
//
//            cell.alpha = 1.0;
//
//        }];
}

@end
