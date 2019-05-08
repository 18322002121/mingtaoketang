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
///** 检查用户名 */
//+ (void)appCheckNameUsername:(NSString *)username success:(successBlock)success failure:(failureBlock)failure;
//
///** 检查手机号 */
//+ (void)appCheckMobileMobile:(NSString *)mobile success:(successBlock)success failure:(failureBlock)failure;
//
///** 检查email */
//+ (void)appCheckEmailEmail:(NSString *)email success:(successBlock)success failure:(failureBlock)failure;
//
///** 注册提交 */
//+ (void)appRegisterMethodUsername:(NSString *)username password:(NSString *)password email:(NSString *)email mobile:(NSString *)mobile success:(successBlock)success failure:(failureBlock)failure;
//
///** 登陆 */
//+ (void)appLoginUsername:(NSString *)username password:(NSString *)password success:(successBlock)success failure:(failureBlock)failure;

/** 首页banner */
+ (void)banner_type:(NSString *)banner_type success:(successBlock)success failure:(failureBlock)failure;

/** 首页直播 */
+ (void)uid:(NSString *)uid success:(successBlock)success failure:(failureBlock)failure;

/** 今日推荐 */
+ (void)appTuijianSuccess:(successBlock)success failure:(failureBlock)failure;

/** 限时抢购 */
+ (void)appQianggouSuccess:(successBlock)success failure:(failureBlock)failure;

/** 资讯,助手,开班 */
+ (void)appArticle_catSuccess:(successBlock)success failure:(failureBlock)failure;

/** 资讯助手文章 */
+ (void)appcat_id:(NSString *)cat_ids success:(successBlock)success failure:(failureBlock)failure;

/** 免费视频列表 */
+ (void)appTaste_videoSuccess:(successBlock)success failure:(failureBlock)failure;

/** 课程套餐分类列表 */
+ (void)appCourse_listSuccess:(successBlock)success failure:(failureBlock)failure;

@end
