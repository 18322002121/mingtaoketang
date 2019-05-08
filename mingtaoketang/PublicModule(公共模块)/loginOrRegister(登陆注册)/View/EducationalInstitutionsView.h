//
//  EducationalInstitutionsView.h
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/5/8.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface EducationalInstitutionsView : UIView
/** 登陆按钮回调 */
@property (nonatomic,strong) void (^loginButtonClickBlock)(UIButton *sender);
/** 发送验证码按钮回调 */
@property (nonatomic,strong) void (^sendVerificationButtonClickBlock)(UIButton *sender);
/** 院校选择按钮回调 */
@property (nonatomic,strong) void (^educationalButtonClickBlock)(UIButton *sender);
@end

NS_ASSUME_NONNULL_END
