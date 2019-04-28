//
//  AboutUsViewController.m
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/4/27.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "AboutUsViewController.h"
#import "AboutUsViewCell.h"

@interface AboutUsViewController ()
@property(nonatomic,strong)PublicTableView *tableView;
@end

static NSString *const aboutUsViewCell =@"AboutUsViewCell";
@implementation AboutUsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.title = @"关于我们";
}

- (PublicTableView *)tableView{
    if (!_tableView) {
        _tableView = [[PublicTableView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight)style:(UITableViewStyleGrouped)];
        [_tableView registerClass:[AboutUsViewCell class] forCellReuseIdentifier:aboutUsViewCell];
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
        AboutUsViewCell *cell =[tableView dequeueReusableCellWithIdentifier:aboutUsViewCell forIndexPath:indexPath];
        normalCell = cell;
        return normalCell;
    };
    
    tableviews.heightForRowAtIndexPath = ^CGFloat(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
        return 50;
    };
    
    tableviews.heightForHeaderInSectionBlock = ^CGFloat(UITableView * _Nonnull tableView, NSInteger section) {
        return 412;
    };
    
    tableviews.viewForHeaderInSectionBlock = ^UIView * _Nonnull(UITableView * _Nonnull tableView, NSInteger section) {
        UIView *subView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 0.01)];
        UIImageView *iconImage = [[UIImageView alloc]init];
        iconImage.backgroundColor = kRandomColor;
        [subView addSubview:iconImage];
        PublicLabel *titlesLabel = [PublicLabel labelWithText:@"杭州·名淘集团" textColor:[UIColor colorWithHexString:@"#333333"] font:[UIFont systemFontOfSize:18] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [subView addSubview:titlesLabel];
        
        [iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(subView.mas_centerX).offset(0);
            make.top.mas_equalTo(subView.mas_top).offset(96);
            make.size.mas_equalTo(CGSizeMake(114, 114));
        }];
        
        [titlesLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(iconImage.mas_bottom).offset(78);
            make.centerX.mas_equalTo(subView.mas_centerX).offset(0);
        }];
        
        return subView;
    };
    
    tableviews.heightForFooterInSectionBlock = ^CGFloat(UITableView * _Nonnull tableView, NSInteger section) {
        return 80;
    };
    
    tableviews.viewForFooterInSectionBlock = ^UIView * _Nonnull(UITableView * _Nonnull tableView, NSInteger section) {
        
        //获取系统版本号
        NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
        NSString *nativeVersion = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
        
        UIView *subView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 80)];
        PublicLabel *versionLabel = [PublicLabel labelWithText:[NSString stringWithFormat:@"名淘教育%@",nativeVersion] textColor:[UIColor colorWithHexString:@"#A7A7A7"] font:[UIFont systemFontOfSize:12] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [subView addSubview:versionLabel];
        
        [versionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(subView.mas_centerX).offset(0);
            make.centerY.mas_equalTo(subView.mas_centerY).offset(0);
        }];
        
        return subView;
    };
    
    tableviews.didSelectRowAtIndexPathBlock = ^(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
        [tableView deselectRowAtIndexPath:indexPath animated:NO];
    };
    
}

@end
