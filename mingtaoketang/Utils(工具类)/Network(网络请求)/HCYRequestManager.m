//
//  HCYRequestManager.m
//  mayizhisheng
//
//  Created by HCY on 2018/8/20.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "HCYRequestManager.h"

@implementation HCYRequestManager

///** 检查用户名 */
//+ (void)appCheckNameUsername:(NSString *)username success:(successBlock)success failure:(failureBlock)failure{
//    NSMutableDictionary *dict=[[NSMutableDictionary alloc]init];
//    [dict setValue:username forKey:@"username"];
//    [[HCYRequestHandler shareManager]sendRequestServerUrl:appCheckName requestheaderType:(HCYRequestheaderTypePost) parameters:dict success:success failure:failure];
//}
//
///** 检查手机号 */
//+ (void)appCheckMobileMobile:(NSString *)mobile success:(successBlock)success failure:(failureBlock)failure{
//    NSMutableDictionary *dict=[[NSMutableDictionary alloc]init];
//    [dict setValue:mobile forKey:@"mobile"];
//    [[HCYRequestHandler shareManager]sendRequestServerUrl:appCheckMobile requestheaderType:(HCYRequestheaderTypePost) parameters:dict success:success failure:failure];
//}
//
///** 检查email */
//+ (void)appCheckEmailEmail:(NSString *)email success:(successBlock)success failure:(failureBlock)failure{
//    NSMutableDictionary *dict=[[NSMutableDictionary alloc]init];
//    [dict setValue:email forKey:@"email"];
//    [[HCYRequestHandler shareManager]sendRequestServerUrl:appCheckEmail requestheaderType:(HCYRequestheaderTypePost) parameters:dict success:success failure:failure];
//}
//
///** 注册提交 */
//+ (void)appRegisterMethodUsername:(NSString *)username password:(NSString *)password email:(NSString *)email mobile:(NSString *)mobile success:(successBlock)success failure:(failureBlock)failure{
//    NSMutableDictionary *dict=[[NSMutableDictionary alloc]init];
//    [dict setValue:username forKey:@"username"];
//    [dict setValue:password forKey:@"password"];
//    [dict setValue:email forKey:@"email"];
//    [dict setValue:mobile forKey:@"mobile"];
//    [[HCYRequestHandler shareManager]sendRequestServerUrl:appRegisterMethod requestheaderType:(HCYRequestheaderTypePost) parameters:dict success:success failure:failure];
//}
//
///** 登陆 */
//+ (void)appLoginUsername:(NSString *)username password:(NSString *)password success:(successBlock)success failure:(failureBlock)failure{
//    NSMutableDictionary *dict=[[NSMutableDictionary alloc]init];
//    [dict setValue:username forKey:@"username"];
//    [dict setValue:password forKey:@"password"];
//    [[HCYRequestHandler shareManager]sendRequestServerUrl:appLogin requestheaderType:(HCYRequestheaderTypePost) parameters:dict success:success failure:failure];
//}

/** 首页banner */
+ (void)banner_type:(NSString *)banner_type success:(successBlock)success failure:(failureBlock)failure{
    NSMutableDictionary *dict=[[NSMutableDictionary alloc]init];
    [dict setValue:banner_type forKey:@"banner_type"];
    [[HCYRequestHandler shareManager]sendRequestServerUrl:banner requestheaderType:(HCYRequestheaderTypePost) parameters:dict success:success failure:failure];
}

/** 首页直播 */
+ (void)uid:(NSString *)uid success:(successBlock)success failure:(failureBlock)failure{
    NSMutableDictionary *dict=[[NSMutableDictionary alloc]init];
    [dict setValue:uid forKey:@"uid"];
    [[HCYRequestHandler shareManager]sendRequestServerUrl:home_live requestheaderType:(HCYRequestheaderTypePost) parameters:dict success:success failure:failure];
}

/** 今日推荐 */
+ (void)appTuijianSuccess:(successBlock)success failure:(failureBlock)failure{
    NSMutableDictionary *dict=[[NSMutableDictionary alloc]init];
    [[HCYRequestHandler shareManager]sendRequestServerUrl:tuijian requestheaderType:(HCYRequestheaderTypePost) parameters:dict success:success failure:failure];
}

/** 限时抢购 */
+ (void)appQianggouSuccess:(successBlock)success failure:(failureBlock)failure{
    NSMutableDictionary *dict=[[NSMutableDictionary alloc]init];
    [[HCYRequestHandler shareManager]sendRequestServerUrl:qianggou requestheaderType:(HCYRequestheaderTypePost) parameters:dict success:success failure:failure];
}

/** 资讯,助手,开班 */
+ (void)appArticle_catSuccess:(successBlock)success failure:(failureBlock)failure{
    NSMutableDictionary *dict=[[NSMutableDictionary alloc]init];
    [[HCYRequestHandler shareManager]sendRequestServerUrl:article_cat requestheaderType:(HCYRequestheaderTypePost) parameters:dict success:success failure:failure];
}

/** 资讯助手文章 */
+ (void)appcat_id:(NSString *)cat_ids success:(successBlock)success failure:(failureBlock)failure{
    NSMutableDictionary *dict=[[NSMutableDictionary alloc]init];
    [dict setValue:cat_ids forKey:@"cat_id"];
    [[HCYRequestHandler shareManager]sendRequestServerUrl:appCat_id requestheaderType:(HCYRequestheaderTypePost) parameters:dict success:success failure:failure];
}

/** 免费视频列表 */
+ (void)appTaste_videoSuccess:(successBlock)success failure:(failureBlock)failure{
    NSMutableDictionary *dict=[[NSMutableDictionary alloc]init];
    [[HCYRequestHandler shareManager]sendRequestServerUrl:taste_video requestheaderType:(HCYRequestheaderTypePost) parameters:dict success:success failure:failure];
}

/** 课程套餐分类列表 */
+ (void)appCourse_listSuccess:(successBlock)success failure:(failureBlock)failure{
    NSMutableDictionary *dict=[[NSMutableDictionary alloc]init];
    [[HCYRequestHandler shareManager]sendRequestServerUrl:course_list requestheaderType:(HCYRequestheaderTypePost) parameters:dict success:success failure:failure];
}

/** 注册 */
+ (void)appMobile:(NSString *)mobile password:(NSString *)password campus_id:(NSString *)campus_id sms_code:(NSString *)sms_code success:(successBlock)success failure:(failureBlock)failure{
    NSMutableDictionary *dict=[[NSMutableDictionary alloc]init];
    [dict setValue:mobile forKey:@"mobile"];
    [dict setValue:password forKey:@"password"];
    [dict setValue:campus_id forKey:@"campus_id"];
    [dict setValue:sms_code forKey:@"sms_code"];
    [[HCYRequestHandler shareManager]sendRequestServerUrl:zhuce requestheaderType:(HCYRequestheaderTypePost) parameters:dict success:success failure:failure];
}

/** 头像上传 */
+ (void)appUid:(NSString *)uid image:(UIImage *)image uploadData:(NSData *)uploadData success:(successBlock)success failure:(failureBlock)failure{
    NSMutableDictionary *dict=[[NSMutableDictionary alloc]init];
    [dict setValue:uid forKey:@"uid"];
    [dict setValue:image forKey:@"image"];
    [[HCYRequestHandler shareManager]uploadImagesWithURL:user_img parameters:dict fileNames:nil uploadData:uploadData success:success failure:failure];
}

/** 账号密码登录 */
+ (void)user_name:(NSString *)user_name password:(NSString *)password success:(successBlock)success failure:(failureBlock)failure{
    NSMutableDictionary *dict=[[NSMutableDictionary alloc]init];
    [dict setValue:user_name forKey:@"user_name"];
    [dict setValue:password forKey:@"password"];
    [[HCYRequestHandler shareManager]sendRequestServerUrl:app_login requestheaderType:HCYRequestheaderTypePost parameters:dict success:success failure:failure];
}

/** 获取个人信息 */
+ (void)app_user_detail_uid:(NSString *)uid success:(successBlock)success failure:(failureBlock)failure{
    NSMutableDictionary *dict=[[NSMutableDictionary alloc]init];
    [dict setValue:uid forKey:@"uid"];
    [[HCYRequestHandler shareManager]sendRequestServerUrl:app_user_detail requestheaderType:HCYRequestheaderTypePost parameters:dict success:success failure:failure];
}




@end
