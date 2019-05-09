//
//  CourseListViewController.m
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/5/9.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "CourseListViewController.h"
#import "CourseListSelectView.h"
#import "CourseListViewCell.h"

@interface CourseListViewController ()
/** 顶部选择视图 */
@property (nonatomic,strong) CourseListSelectView *topSelectView;
/** 初始化tableview */
@property (nonatomic,strong) PublicTableView *tableView;
@end

static NSString *const courseListViewCell = @"CourseListViewCell";
@implementation CourseListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"课程列表";
    [self topSelectView];
    self.tableView.backgroundColor = KWhiteColor;
}

- (CourseListSelectView *)topSelectView{
    if (!_topSelectView) {
        _topSelectView = [[CourseListSelectView alloc]init];
        _topSelectView.backgroundColor = kRandomColor;
        [self.view addSubview:_topSelectView];
        [_topSelectView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.view.mas_left).offset(0);
            make.top.mas_equalTo(self.view.mas_top).offset(0);
            make.right.mas_equalTo(self.view.mas_right).offset(0);
            make.height.mas_offset(@50);
        }];
        [self reloadCourseListSelectView:_topSelectView];
    }
    return _topSelectView;
}

- (void)reloadCourseListSelectView:(CourseListSelectView *)topSelectView{
    topSelectView.curriculumClassificationClickBlock = ^(UIButton * _Nonnull sender) {
        NSLog(@"课程选择按钮");
    };
}

- (PublicTableView *)tableView{
    if (!_tableView) {
        _tableView = [[PublicTableView alloc]initWithFrame:CGRectMake(0, 50, KScreenWidth, KScreenHeight - 50)style:(UITableViewStyleGrouped)];
        [_tableView registerClass:[CourseListViewCell class] forCellReuseIdentifier:courseListViewCell];
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
        return 5;
    };
    
    tableviews.cellForRowAtIndexPathBlock = ^UITableViewCell * _Nonnull(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
        UITableViewCell *normalCell = nil;
        CourseListViewCell *cell =[tableView dequeueReusableCellWithIdentifier:courseListViewCell forIndexPath:indexPath];
        normalCell = cell;
        return normalCell;
    };
    
    tableviews.heightForRowAtIndexPath = ^CGFloat(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
        return 90;
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
        [tableView deselectRowAtIndexPath:indexPath animated:NO];
    };
}

@end
