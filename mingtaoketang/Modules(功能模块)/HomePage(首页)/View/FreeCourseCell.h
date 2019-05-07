//
//  FreeCourseCell.h
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/4/25.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class FreeCourseData;
@interface FreeCourseCell : UITableViewCell
/** 初始化模型 */
@property (nonatomic,strong) FreeCourseData *freeCourseModel;
@end

NS_ASSUME_NONNULL_END
