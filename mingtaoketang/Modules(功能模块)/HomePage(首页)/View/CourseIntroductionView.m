//
//  CourseIntroductionView.m
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/5/9.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "CourseIntroductionView.h"
#import "CourseIntroductionCell.h"

@interface CourseIntroductionView ()
/** 初始化tableview */
@property (nonatomic,strong) PublicTableView *courseIntroductionTableview;
@end

static NSString *const courseIntroductionCell =@"CourseIntroductionCell";
@implementation CourseIntroductionView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.courseIntroductionTableview.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (PublicTableView *)courseIntroductionTableview{
    if (!_courseIntroductionTableview) {
        _courseIntroductionTableview = [[PublicTableView alloc]initWithFrame:CGRectZero style:(UITableViewStyleGrouped)];
        [_courseIntroductionTableview registerClass:[CourseIntroductionCell class] forCellReuseIdentifier:courseIntroductionCell];
        [self reloadTableviewDatasource:_courseIntroductionTableview];
        [self addSubview:_courseIntroductionTableview];
    }
    return _courseIntroductionTableview;
}

- (void)reloadTableviewDatasource:(PublicTableView *)tableviews{
    tableviews.numberOfSectionsInTableViewBlock = ^NSInteger(UITableView * _Nonnull tableView) {
        return 1;
    };
    
    tableviews.numberOfRowsInSectionBlock = ^NSInteger(UITableView * _Nonnull tableView, NSInteger section) {
        return 6;
    };
    
    tableviews.cellForRowAtIndexPathBlock = ^UITableViewCell * _Nonnull(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
        UITableViewCell *normalCell = nil;
        CourseIntroductionCell *cell =[tableView dequeueReusableCellWithIdentifier:courseIntroductionCell forIndexPath:indexPath];
        normalCell = cell;
        return normalCell;
    };
    
    tableviews.heightForRowAtIndexPath = ^CGFloat(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
        return 70;
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
        
    };
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [_courseIntroductionTableview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).offset(0);
        make.left.mas_equalTo(self.mas_left).offset(0);
        make.right.equalTo(self.mas_right).offset(0);
        make.bottom.mas_equalTo(self.mas_bottom).offset(0);
    }];
}

@end
