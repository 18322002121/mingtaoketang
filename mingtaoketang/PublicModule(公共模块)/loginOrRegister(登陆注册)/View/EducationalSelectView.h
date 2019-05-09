//
//  EducationalSelectView.h
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/5/8.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface EducationalSelectView : UIView
/** 取消按钮回调 */
@property (nonatomic,strong) void (^canCelButtonClickBlock)(UIButton *sender);
@end

NS_ASSUME_NONNULL_END
