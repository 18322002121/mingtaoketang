//
//  VerificationTool.m
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/5/9.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "VerificationTool.h"

@implementation VerificationTool
/** 验证是否是手机号 */
+ (BOOL)isPhoneNumber:(NSString *)phoneNum{
    NSString *MOBILE = @"^1(3[0-9]|4[57]|5[0-35-9]|7[01235678]|8[0-9])\\d{8}$";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    return [regextestmobile evaluateWithObject:phoneNum];
}

/** 验证输入的是否全为数字 */
+ (BOOL)isAllNumber:(NSString *)allNumberStr{
    NSString *pattern = @"^[0-9]*$";
    NSRegularExpression *regex = [[NSRegularExpression alloc] initWithPattern:pattern options:0 error:nil];
    NSArray *results = [regex matchesInString:allNumberStr options:0 range:NSMakeRange(0, allNumberStr.length)];
    return results.count > 0;
}



@end
