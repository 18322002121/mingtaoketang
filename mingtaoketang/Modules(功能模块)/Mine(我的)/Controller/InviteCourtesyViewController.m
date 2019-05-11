//
//  InviteCourtesyViewController.m
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/4/27.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "InviteCourtesyViewController.h"
#import "InviteCourtesyViewCell.h"
#import "InviteCourtesyHeaderView.h"

typedef NS_ENUM(NSUInteger, ShowSectionStatus) {
    ShowSectionStatusShare = 0,                  //分享
    ShowSectionStatusInvitationRecord            //邀请记录
};
@interface InviteCourtesyViewController ()
@property(nonatomic,strong)PublicTableView *tableView;
/** 列表左侧标题 */
@property (nonatomic,strong) NSMutableArray *listTitlesArray;
@end

static NSString *const inviteCourtesyViewCell =@"InviteCourtesyViewCell";
@implementation InviteCourtesyViewController

- (NSMutableArray *)listTitlesArray{
    if (!_listTitlesArray) {
        _listTitlesArray = [NSMutableArray arrayWithObjects:@"分享",@"注册邀请记录", nil];
    }
    return _listTitlesArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"邀请有礼";
    self.tableView.backgroundColor = [UIColor whiteColor];
}

- (PublicTableView *)tableView{
    if (!_tableView) {
        _tableView = [[PublicTableView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight)style:(UITableViewStyleGrouped)];
        [_tableView registerClass:[InviteCourtesyViewCell class] forCellReuseIdentifier:inviteCourtesyViewCell];
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
        InviteCourtesyViewCell *cell =[tableView dequeueReusableCellWithIdentifier:inviteCourtesyViewCell forIndexPath:indexPath];
        [cell setLeftTitles:self.listTitlesArray[indexPath.row]];
        normalCell = cell;
        return normalCell;
    };
    
    tableviews.heightForRowAtIndexPath = ^CGFloat(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
        return 50;
    };
    
    tableviews.heightForHeaderInSectionBlock = ^CGFloat(UITableView * _Nonnull tableView, NSInteger section) {
        return 485;
    };
    
    tableviews.viewForHeaderInSectionBlock = ^UIView * _Nonnull(UITableView * _Nonnull tableView, NSInteger section) {
        InviteCourtesyHeaderView *inviteCourtesyView=[[InviteCourtesyHeaderView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 485)];
        return inviteCourtesyView;
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
        if (indexPath.row == ShowSectionStatusShare) {
            NSLog(@"分享接入");
        }
    };
}




@end
