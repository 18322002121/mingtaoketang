//
//  PublicTableView.h
//  mingtaohangkong
//
//  Created by Linlin Ge on 2019/4/11.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PublicTableView : UITableView

/** 返回多少个Section */
@property (nonatomic,strong) NSInteger (^numberOfSectionsInTableViewBlock)(UITableView *tableView);

/** 返回多少个Row */
@property (nonatomic,strong) NSInteger (^numberOfRowsInSectionBlock)(UITableView *tableView,NSInteger section);

/** 返回Row的高度 */
@property (nonatomic,strong) CGFloat(^heightForRowAtIndexPath)(UITableView *tableView,NSIndexPath *indexPath);

/** 返回多少个Cell */
@property (nonatomic,strong) UITableViewCell * (^cellForRowAtIndexPathBlock)(UITableView *tableView,NSIndexPath *indexPath);

/** 返回每个区头部高度 */
@property (nonatomic,strong) CGFloat (^heightForHeaderInSectionBlock)(UITableView *tableView,NSInteger section);

/** 返回每个区脚高度 */
@property (nonatomic,strong) CGFloat (^heightForFooterInSectionBlock)(UITableView *tableView,NSInteger section);

/** 返回每个区头View */
@property (nonatomic,strong) UIView * (^viewForHeaderInSectionBlock)(UITableView *tableView,NSInteger section);

/** 返回每个区脚View */
@property (nonatomic,strong) UIView * (^viewForFooterInSectionBlock)(UITableView *tableView,NSInteger section);

/** 选择cell点击事件 */
@property (nonatomic,strong) void (^didSelectRowAtIndexPathBlock)(UITableView *tableView,NSIndexPath *indexPath);


@end

NS_ASSUME_NONNULL_END
