//
//  SettingViewController.m
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/4/27.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "SettingViewController.h"
#import "SettingViewCell.h"
#import "SettingModel.h"
#import "ClearCacheViewController.h"
#import "ChangePasswordeViewController.h"
#import "AboutUsViewController.h"
#import "FeedbackViewController.h"

typedef NS_ENUM(NSUInteger, ShowSectionStatus) {
    ShowSectionStatusClearCache = 0,        //清理缓存
    ShowSectionStatusChangePassworde,       //修改密码
    ShowSectionStatusAboutUs,               //关于我们
    ShowSectionStatusFeedback               //意见反馈
};

@interface SettingViewController ()
@property(nonatomic,strong)PublicTableView *tableView;
@property(nonatomic,strong)NSMutableArray *moduleSelectionArray;
@property(nonatomic,strong)NSArray *tempArray;
@end

static NSString *const settingViewCell =@"SettingViewCell";
@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.backgroundColor = [UIColor whiteColor];
    [self moduleSelection];
    self.title = @"设置";
    [self logoutButton];
}

#pragma mark - 请求数据
- (void)moduleSelection{
    NSArray *dataArray = @[@{@"iconImage":@"study",@"gridTitle":@"清理缓存"},
                           @{@"iconImage":@"grade",@"gridTitle":@"修改密码"},
                           @{@"iconImage":@"test",@"gridTitle":@"关于我们"},
                           @{@"iconImage":@"checkin",@"gridTitle":@"意见反馈"}
                           ];
    _tempArray = dataArray;
    self.moduleSelectionArray = [NSMutableArray arrayWithCapacity:0];
    [dataArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self.moduleSelectionArray  addObject:[SettingModel initWithDict:obj]];
    }];
}

- (PublicTableView *)tableView{
    if (!_tableView) {
        _tableView = [[PublicTableView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight)style:(UITableViewStyleGrouped)];
        [_tableView registerClass:[SettingViewCell class] forCellReuseIdentifier:settingViewCell];
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
        return self.tempArray.count;
    };
    
    tableviews.cellForRowAtIndexPathBlock = ^UITableViewCell * _Nonnull(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
        UITableViewCell *normalCell = nil;
        SettingViewCell *cell =[tableView dequeueReusableCellWithIdentifier:settingViewCell forIndexPath:indexPath];
        [cell setSettingModels:self.moduleSelectionArray[indexPath.row]];
        normalCell = cell;
        return normalCell;
    };
    
    tableviews.heightForRowAtIndexPath = ^CGFloat(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
        return 50;
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
        if (indexPath.row == ShowSectionStatusClearCache) {
            ClearCacheViewController *clearCacheView = [[ClearCacheViewController alloc]init];
            [self.navigationController pushViewController:clearCacheView animated:YES];
        }else if (indexPath.row == ShowSectionStatusChangePassworde){
            ChangePasswordeViewController *changePasswordeView = [[ChangePasswordeViewController alloc]init];
            [self.navigationController pushViewController:changePasswordeView animated:YES];
        }else if (indexPath.row == ShowSectionStatusAboutUs){
            AboutUsViewController *aboutUsView = [[AboutUsViewController alloc]init];
            [self.navigationController pushViewController:aboutUsView animated:YES];
        }else if (indexPath.row == ShowSectionStatusFeedback){
            FeedbackViewController *feedbackView = [[FeedbackViewController alloc]init];
            [self.navigationController pushViewController:feedbackView animated:YES];
        }
        [tableView deselectRowAtIndexPath:indexPath animated:NO];
    };
}

#pragma mark - 退出登陆
- (void)logoutButton{
    PublicButton *logout = [PublicButton buttonWithImage:@"" backgroundImageImage:@"" title:@"退出登录" titleColor:[UIColor colorWithHexString:@"#333333"] textFont:[UIFont systemFontOfSize:16] backgroundColor:[UIColor colorWithHexString:@"#DDDDDD"] addView:self.view target:self action:@selector(logoutClick)];
    logout.layer.cornerRadius = 18;
    
    [logout mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.view.mas_bottom).offset(-49);
        make.left.mas_equalTo(self.view.mas_left).offset(40);
        make.right.mas_equalTo(self.view.mas_right).offset(-40);
        make.height.mas_offset(@35);
    }];
}

- (void)logoutClick{
    NSLog(@"退出登陆");
    [PublicUserDefaults clearAll];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
