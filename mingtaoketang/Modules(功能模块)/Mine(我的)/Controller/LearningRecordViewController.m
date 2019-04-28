//
//  LearningRecordViewController.m
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/4/27.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "LearningRecordViewController.h"
#import "LearningRecordViewCell.h"
#import "LearningRecordHeaderView.h"

@interface LearningRecordViewController ()
@property(nonatomic,strong)PublicTableView *tableView;
@end

static NSString *const learningRecordViewCell =@"LearningRecordViewCell";
@implementation LearningRecordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self reloadingRefresh];
    self.tableView.backgroundColor = [UIColor colorWithHexString:@"#F2F7FA"];
    self.title = @"学习记录";
}

- (void)reloadingRefresh{
    self.tableView.mj_header = [PublicRefreshHeader headerWithRefreshingBlock:^{
        //        [self.datas removeAllObjects];
        //        NSArray *datas = [self hn_modelArrayWithCategory:self.model.category fromModel:x];
        //        [self.datas addObjectsFromArray:datas];
        //        [self.tableView reloadData];
        [self.tableView.mj_header endRefreshing];
    }];
    
    self.tableView.mj_footer = [PublicRefreshFooter footerWithRefreshingBlock:^{
//        if (self.datas.count == 0 || !self.datas) {
//            [self.tableView.mj_footer endRefreshingWithNoMoreData];
//        }else {
//            [self.datas addObjectsFromArray:self.datas];
//            [self.tableView.mj_footer endRefreshing];
//        }
    }];
    [self.tableView.mj_header beginRefreshing];
}

- (PublicTableView *)tableView{
    if (!_tableView) {
        _tableView = [[PublicTableView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight)style:(UITableViewStyleGrouped)];
        [_tableView  setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        [_tableView registerClass:[LearningRecordViewCell class] forCellReuseIdentifier:learningRecordViewCell];
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
        return 2;
    };
    
    tableviews.cellForRowAtIndexPathBlock = ^UITableViewCell * _Nonnull(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
        UITableViewCell *normalCell = nil;
        LearningRecordViewCell *cell =[tableView dequeueReusableCellWithIdentifier:learningRecordViewCell forIndexPath:indexPath];
        [self reloadLearningRecordViewCell:cell];
        normalCell = cell;
        return normalCell;
    };
    
    tableviews.heightForRowAtIndexPath = ^CGFloat(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
        return 120;
    };
    
    tableviews.heightForHeaderInSectionBlock = ^CGFloat(UITableView * _Nonnull tableView, NSInteger section) {
        return 50;
    };
    
    tableviews.viewForHeaderInSectionBlock = ^UIView * _Nonnull(UITableView * _Nonnull tableView, NSInteger section) {
        LearningRecordHeaderView *learningRecordHeader=[[LearningRecordHeaderView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 50)];
        return learningRecordHeader;
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
        [tableView deselectRowAtIndexPath:indexPath animated:NO];
    };
}

#pragma mark - 继续学习按钮

- (void)reloadLearningRecordViewCell:(LearningRecordViewCell *)cell{
    cell.ContinueLearningClickBlock = ^(UIButton * _Nonnull sender) {
        NSLog(@"继续学习");
    };
}

@end
