//
//  HCYRequestHandler.h
//  mayizhisheng
//
//  Created by HCY on 2018/8/20.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,HCYRequestheaderType) {
    HCYRequestheaderTypeGet,
    HCYRequestheaderTypePost
};
// 请求成功Block
typedef void (^HCYHttpRequestSuccess)(id responseObject);
// 请求失败的Block
typedef void(^HCYHttpRequestFailed)(NSError *error);
//上传或者下载的进度
typedef void (^HCYHttpRequestProgress)(NSProgress *progress);

@interface HCYRequestHandler : NSObject
/** 网络请求类的实例 */
+ (instancetype)shareManager;

- (void)GET:(NSString *)URLString
                        parameters:(id)parameters
                           success:(HCYHttpRequestSuccess)success
                           failure:(HCYHttpRequestFailed)failure;


- (void)POST:(NSString *)URLString
                         parameters:(id)parameters
                            success:(HCYHttpRequestSuccess)success
                            failure:(HCYHttpRequestFailed)failure;



- (void)sendRequestServerUrl:(NSString *)URLString requestheaderType:(HCYRequestheaderType)requestheaderType parameters:(id)parameters
                     success:(HCYHttpRequestSuccess)success
                     failure:(HCYHttpRequestFailed)failure;

/** 单张图片上传 */
- (void)uploadImagesWithURL:(NSString *)URLString parameters:(id)parameters fileNames:(NSString *)fileNames
                     uploadData:(NSData *)uploadData success:(HCYHttpRequestSuccess)success
                    failure:(HCYHttpRequestFailed)failure;

@end
