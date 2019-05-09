//
//  VerificationTool.h
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/5/9.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface VerificationTool : NSObject
/** 验证是否是手机号 */
+ (BOOL)isPhoneNumber:(NSString *)phoneNum;
/** 验证输入的是否全为数字 */
+ (BOOL)isAllNumber:(NSString *)allNumberStr;


@end

NS_ASSUME_NONNULL_END
