//
//  HCYRequestManager.h
//  mayizhisheng
//
//  Created by HCY on 2018/8/20.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^successBlock)(id responseObject);
typedef void (^failureBlock)(NSError * errorMessage);

@interface HCYRequestManager : NSObject
/** 检查用户名 */
+ (void)appCheckNameUsername:(NSString *)username success:(successBlock)success failure:(failureBlock)failure;

/** 检查手机号 */
+ (void)appCheckMobileMobile:(NSString *)mobile success:(successBlock)success failure:(failureBlock)failure;

/** 检查email */
+ (void)appCheckEmailEmail:(NSString *)email success:(successBlock)success failure:(failureBlock)failure;

/** 注册提交 */
+ (void)appRegisterMethodUsername:(NSString *)username password:(NSString *)password email:(NSString *)email mobile:(NSString *)mobile success:(successBlock)success failure:(failureBlock)failure;

/** 登陆 */
+ (void)appLoginUsername:(NSString *)username password:(NSString *)password success:(successBlock)success failure:(failureBlock)failure;

/** 首页广告位 */
+ (void)appLoginBanner_type:(NSString *)banner_type success:(successBlock)success failure:(failureBlock)failure;


@end
