//
//  CourseListSelectView.h
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/5/9.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CourseListSelectView : UIView
/** 课程选择按钮回调 */
@property (nonatomic,strong) void (^curriculumClassificationClickBlock)(UIButton *sender);
@end

NS_ASSUME_NONNULL_END
