//
//  HCYRequestManager.m
//  mayizhisheng
//
//  Created by HCY on 2018/8/20.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "HCYRequestManager.h"

@implementation HCYRequestManager

/** 检查用户名 */
+ (void)appCheckNameUsername:(NSString *)username success:(successBlock)success failure:(failureBlock)failure{
    NSMutableDictionary *dict=[[NSMutableDictionary alloc]init];
    [dict setValue:username forKey:@"username"];
    [[HCYRequestHandler shareManager]sendRequestServerUrl:appCheckName requestheaderType:(HCYRequestheaderTypePost) parameters:dict success:success failure:failure];
}

/** 检查手机号 */
+ (void)appCheckMobileMobile:(NSString *)mobile success:(successBlock)success failure:(failureBlock)failure{
    NSMutableDictionary *dict=[[NSMutableDictionary alloc]init];
    [dict setValue:mobile forKey:@"mobile"];
    [[HCYRequestHandler shareManager]sendRequestServerUrl:appCheckMobile requestheaderType:(HCYRequestheaderTypePost) parameters:dict success:success failure:failure];
}

/** 检查email */
+ (void)appCheckEmailEmail:(NSString *)email success:(successBlock)success failure:(failureBlock)failure{
    NSMutableDictionary *dict=[[NSMutableDictionary alloc]init];
    [dict setValue:email forKey:@"email"];
    [[HCYRequestHandler shareManager]sendRequestServerUrl:appCheckEmail requestheaderType:(HCYRequestheaderTypePost) parameters:dict success:success failure:failure];
}

/** 注册提交 */
+ (void)appRegisterMethodUsername:(NSString *)username password:(NSString *)password email:(NSString *)email mobile:(NSString *)mobile success:(successBlock)success failure:(failureBlock)failure{
    NSMutableDictionary *dict=[[NSMutableDictionary alloc]init];
    [dict setValue:username forKey:@"username"];
    [dict setValue:password forKey:@"password"];
    [dict setValue:email forKey:@"email"];
    [dict setValue:mobile forKey:@"mobile"];
    [[HCYRequestHandler shareManager]sendRequestServerUrl:appRegisterMethod requestheaderType:(HCYRequestheaderTypePost) parameters:dict success:success failure:failure];
}

/** 登陆 */
+ (void)appLoginUsername:(NSString *)username password:(NSString *)password success:(successBlock)success failure:(failureBlock)failure{
    NSMutableDictionary *dict=[[NSMutableDictionary alloc]init];
    [dict setValue:username forKey:@"username"];
    [dict setValue:password forKey:@"password"];
    [[HCYRequestHandler shareManager]sendRequestServerUrl:appLogin requestheaderType:(HCYRequestheaderTypePost) parameters:dict success:success failure:failure];
}

/** 首页广告位 */
+ (void)appLoginBanner_type:(NSString *)banner_type success:(successBlock)success failure:(failureBlock)failure{
    NSMutableDictionary *dict=[[NSMutableDictionary alloc]init];
    [dict setValue:banner_type forKey:@"banner_type"];
    [[HCYRequestHandler shareManager]sendRequestServerUrl:banner requestheaderType:(HCYRequestheaderTypePost) parameters:dict success:success failure:failure];
}

@end
