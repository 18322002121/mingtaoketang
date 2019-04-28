//
//  MyCourseViewCell.h
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/4/28.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyCourseViewCell : UITableViewCell
@property (nonatomic,strong) void (^ContinueLearningClickBlock)(UIButton *sender);
@end

NS_ASSUME_NONNULL_END
