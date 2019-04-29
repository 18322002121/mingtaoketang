//
//  FreeCourseViewController.m
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/4/25.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "FreeCourseViewController.h"
#import "FreeCourseCell.h"
#import "VideoPlayerViewController.h"

@interface FreeCourseViewController ()
@property(nonatomic,strong)PublicTableView *tableView;
@property(nonatomic,strong)NSMutableArray *datas;
@end
static NSString *const freeCourseCell =@"FreeCourseCell";
@implementation FreeCourseViewController

- (NSMutableArray *)datas{
    if (!_datas) {
        _datas = [NSMutableArray arrayWithCapacity:0];
    }
    return _datas;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self tableView];
    self.title = @"免费课程";
    [self reloadingRefresh];
}

#pragma mark -刷新操作

- (void)reloadingRefresh{
    self.tableView.mj_header = [PublicRefreshHeader headerWithRefreshingBlock:^{
        //        [self.datas removeAllObjects];
        //        NSArray *datas = [self hn_modelArrayWithCategory:self.model.category fromModel:x];
        //        [self.datas addObjectsFromArray:datas];
        //        [self.tableView reloadData];
        [self.tableView.mj_header endRefreshing];
    }];
    
        self.tableView.mj_footer = [PublicRefreshFooter footerWithRefreshingBlock:^{
            if (self.datas.count == 0 || !self.datas) {
                [self.tableView.mj_footer endRefreshingWithNoMoreData];
            }else {
                [self.datas addObjectsFromArray:self.datas];
    [self.tableView.mj_footer endRefreshing];
            }
        }];
    [self.tableView.mj_header beginRefreshing];
}

- (PublicTableView *)tableView{
    if (!_tableView) {
        _tableView = [[PublicTableView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight - kNavAndStatusHight)style:(UITableViewStyleGrouped)];
        [_tableView registerClass:[FreeCourseCell class] forCellReuseIdentifier:freeCourseCell];
        [self reloadTableviewDatasource:_tableView];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (void)reloadTableviewDatasource:(PublicTableView *)tableviews{
    tableviews.numberOfSectionsInTableViewBlock = ^NSInteger(UITableView * _Nonnull tableView) {
        return 1;
    };
    
    tableviews.numberOfRowsInSectionBlock = ^NSInteger(UITableView * _Nonnull tableView, NSInteger section) {
        return 4;
    };
    
    tableviews.cellForRowAtIndexPathBlock = ^UITableViewCell * _Nonnull(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
        UITableViewCell *normalCell = nil;
        FreeCourseCell *cell =[tableView dequeueReusableCellWithIdentifier:freeCourseCell forIndexPath:indexPath];
        normalCell = cell;
        return normalCell;
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
        VideoPlayerViewController *videoPlayerView = [[VideoPlayerViewController alloc]init];
        [self.navigationController pushViewController:videoPlayerView animated:YES];
        [tableView deselectRowAtIndexPath:indexPath animated:NO];
    };
    
    tableviews.heightForRowAtIndexPath = ^CGFloat(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
        return 268;
    };
    
}

@end
