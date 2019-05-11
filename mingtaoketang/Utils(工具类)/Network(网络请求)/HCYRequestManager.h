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
typedef void (^requestProgress)(NSProgress *progress);
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

/** 注册 */
+ (void)appMobile:(NSString *)mobile password:(NSString *)password campus_id:(NSString *)campus_id sms_code:(NSString *)sms_code success:(successBlock)success failure:(failureBlock)failure;

/** 头像上传 */
+ (void)appUid:(NSString *)uid image:(UIImage *)image uploadData:(NSData *)uploadData success:(successBlock)success failure:(failureBlock)failure;

/** 账号密码登录 */
+ (void)user_name:(NSString *)user_name password:(NSString *)password success:(successBlock)success failure:(failureBlock)failure;

/** 获取个人信息 */
+ (void)app_user_detail_uid:(NSString *)uid success:(successBlock)success failure:(failureBlock)failure;

/** 修改昵称 */
+ (void)app_edit_nicknameUid:(NSString *)uid nickname:(NSString *)nickname success:(successBlock)success failure:(failureBlock)failure;

/** 修改性别 */
+ (void)edit_sexUid:(NSString *)uid sex:(NSString *)sex success:(successBlock)success failure:(failureBlock)failure;

@end
