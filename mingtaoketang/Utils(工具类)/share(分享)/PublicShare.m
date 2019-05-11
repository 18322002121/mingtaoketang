//
//  PublicShare.m
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/5/11.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "PublicShare.h"

@implementation PublicShare

+ (PublicShare *)shareManage{
    
    static PublicShare *shareManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareManager = [[PublicShare alloc]init];
    });
    return shareManager;
}

/** 友盟分享设置 */
- (void)setupShareConfig{
    /*! 打开调试log的开关 */
    [[UMSocialManager defaultManager] openLog:YES];
    /** 微信分享 */
    [[UMSocialManager defaultManager]setPlaform:UMSocialPlatformType_WechatSession appKey:WX_APPKEY appSecret:WX_APPSECRET redirectURL:@""];
    
    /** 新浪微博分享 */
    [[UMSocialManager defaultManager]setPlaform:UMSocialPlatformType_Sina appKey:Sina_AppKey appSecret:SinaAppSecret redirectURL:@""];
    /** qq分享 */
    [[UMSocialManager defaultManager]setPlaform:UMSocialPlatformType_Qzone appKey:QQKey appSecret:QQAppID redirectURL:@""];
}

/** 判断平台是否安装 */
- (BOOL)uMSocialIsInstall:(UMSocialPlatformType)platformType{
    return [[UMSocialManager defaultManager] isInstall:platformType];
}

/** 微信分享 */
- (void)weChatShareWithShareType:(ShowShareStatus)shareType viewController:(UIViewController *)viewController{
    switch (shareType) {
        case ShowShareStatusText:
            if (kStringIsEmpty(_shareText)) {
                UIWindow *view = [[UIApplication sharedApplication].windows lastObject];
                NSLog(@"分享失败：纯文本分享中，文本内容不能为空！");
                [MBProgressHUD showMessag:@"分享失败：文本内容不能为空！" toView:view];
                return;
            }
            [self shareTextToPlatformType:UMSocialPlatformType_WechatSession shareText:_shareText viewController:viewController];
            break;
        case ShowShareStatusImage:
            if (kStringIsEmpty(_shareBigImage)){
                UIWindow *view = [[UIApplication sharedApplication].windows lastObject];
                NSLog(@"分享失败：shareBigImage 不能为空！");
                [MBProgressHUD showMessag:@"分享失败：分享图片不能为空！" toView:view];
                return;
            }
            [self shareImageToPlatformType:UMSocialPlatformType_WechatSession thumbImage:nil bigImage:_shareBigImage viewController:viewController];
            break;
        case ShowShareStatusImageUrl:
            if (kStringIsEmpty(_shareImageUrl)){
                UIWindow *view = [[UIApplication sharedApplication].windows lastObject];
                NSLog(@"分享失败：shareImageUrl 不能为空！");
                [MBProgressHUD showMessag:@"分享失败：分享 URL 图片不能为空！" toView:view];
                return;
            }
            [self shareImageURLToPlatformType:UMSocialPlatformType_WechatSession thumbImage:nil imageUrl:_shareImageUrl viewController:viewController];
            break;
        case ShowShareStatusWebLink:
            if (kStringIsEmpty(_shareWebpageUrl)){
                UIWindow *view = [[UIApplication sharedApplication].windows lastObject];
                NSLog(@"分享失败：shareWebpageUrl 不能为空！");
                [MBProgressHUD showMessag:@"分享失败：分享网页不能为空！" toView:view];
                return;
            }
            [self shareWebPageToPlatformType:UMSocialPlatformType_WechatSession title:_shareTitle shareText:_shareText imageUrl:_shareImageUrl webpageUrl:_shareWebpageUrl viewController:viewController];
            break;
        case ShowShareStatusTextImage:
            if (kStringIsEmpty(_shareWebpageUrl)){
                UIWindow *view = [[UIApplication sharedApplication].windows lastObject];
                NSLog(@"分享失败：shareWebpageUrl 不能为空！");
                [MBProgressHUD showMessag:@"分享失败：分享网页不能为空！" toView:view];
                return;
            }
            break;
        default:
            break;
    }
}



/** 分享纯文本 */
- (void)shareTextToPlatformType:(UMSocialPlatformType)platformType
                      shareText:(NSString *)shareText
                 viewController:(UIViewController *)viewController{
    /*! 创建分享消息对象 */
     UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    /*! 设置文本 */
    messageObject.text = shareText;
    /*! 调用分享接口 */
    [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:viewController completion:^(id data, NSError *error) {
        if (error) {
            UMSocialLogInfo(@"************Share fail with error %@*********",error);
        }else{
            if ([data isKindOfClass:[UMSocialShareResponse class]]) {
                UMSocialShareResponse *resp = data;
                /*! 分享结果消息 */
                UMSocialLogInfo(@"response message is %@",resp.message);
                /*! 第三方原始返回的数据 */
                UMSocialLogInfo(@"response originalResponse data is %@",resp.originalResponse);
                
            }else{
                UMSocialLogInfo(@"response data is %@",data);
            }
        }
        [self alertWithError:error];
    }];
}

/** 分享纯图片 */
- (void)shareImageToPlatformType:(UMSocialPlatformType)platformType
                      thumbImage:(NSString *)thumbImage
                        bigImage:(NSString *)bigImage
                  viewController:(UIViewController *)viewController{
    /*! 创建分享消息对象 */
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    
    /*! 创建图片内容对象 */
    UMShareImageObject *shareObject = [[UMShareImageObject alloc] init];
    /*! 如果有缩略图，则设置缩略图本地 */
    shareObject.thumbImage = [UIImage imageNamed:thumbImage];
    
    [shareObject setShareImage:[UIImage imageNamed:bigImage]];
    
    /*! 设置Pinterest参数 */
    if (platformType == UMSocialPlatformType_Pinterest) {
        [self setPinterstInfo:messageObject];
    }
    /*! 设置Kakao参数 */
    if (platformType == UMSocialPlatformType_KakaoTalk) {
        messageObject.moreInfo = @{@"permission" : @1}; // @1 = KOStoryPermissionPublic
    }
    /*! 分享消息对象设置分享内容对象 */
    messageObject.shareObject = shareObject;
    
    /*! 调用分享接口 */
    [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:viewController completion:^(id data, NSError *error) {
        if (error) {
            UMSocialLogInfo(@"************Share fail with error %@*********",error);
        }else{
            if ([data isKindOfClass:[UMSocialShareResponse class]]) {
                UMSocialShareResponse *resp = data;
                /*! 分享结果消息 */
                UMSocialLogInfo(@"response message is %@",resp.message);
                /*! 第三方原始返回的数据 */
                UMSocialLogInfo(@"response originalResponse data is %@",resp.originalResponse);
                
            }else{
                UMSocialLogInfo(@"response data is %@",data);
            }
        }
        [self alertWithError:error];
    }];
}

/** 分享网络图片 */
- (void)shareImageURLToPlatformType:(UMSocialPlatformType)platformType
                            thumbImage:(NSString *)thumbImage
                              imageUrl:(NSString *)imageUrl
                        viewController:(UIViewController *)viewController
{
    /*! 创建分享消息对象 */
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    
    /*! 创建图片内容对象 */
    UMShareImageObject *shareObject = [[UMShareImageObject alloc] init];
    /*! 如果有缩略图，则设置缩略图，此处为 URL */
    //    shareObject.thumbImage = thumbImage;
    UIImageView *imageView = [UIImageView new];
    [imageView sd_setImageWithURL:[NSURL URLWithString:imageUrl] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        [shareObject setShareImage:image];
        
        /*! 设置Pinterest参数 */
        if (platformType == UMSocialPlatformType_Pinterest) {
            [self setPinterstInfo:messageObject];
        }
        
        /*! 设置Kakao参数 */
        if (platformType == UMSocialPlatformType_KakaoTalk) {
            messageObject.moreInfo = @{@"permission" : @1}; // @1 = KOStoryPermissionPublic
        }
        
        /*! 分享消息对象设置分享内容对象 */
        messageObject.shareObject = shareObject;
        
        /*! 调用分享接口 */
        [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:viewController completion:^(id data, NSError *error) {
            if (error) {
                UMSocialLogInfo(@"************Share fail with error %@*********",error);
            }else{
                if ([data isKindOfClass:[UMSocialShareResponse class]]) {
                    UMSocialShareResponse *resp = data;
                    /*! 分享结果消息 */
                    UMSocialLogInfo(@"response message is %@",resp.message);
                    /*! 第三方原始返回的数据 */
                    UMSocialLogInfo(@"response originalResponse data is %@",resp.originalResponse);
                    
                }else{
                    UMSocialLogInfo(@"response data is %@",data);
                }
            }
            [self alertWithError:error];
        }];
        
    }];
    
}

/** 网页分享 */
- (void)shareWebPageToPlatformType:(UMSocialPlatformType)platformType
                                title:(NSString *)title
                            shareText:(NSString *)shareText
                             imageUrl:(NSString *)imageUrl
                           webpageUrl:(NSString *)webpageUrl
                       viewController:(UIViewController *)viewController
{
    /*! 创建分享消息对象 */
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    UIImageView *imageView = [UIImageView new];
    [imageView sd_setImageWithURL:[NSURL URLWithString:imageUrl] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        /*! 创建网页内容对象 */
        UMShareWebpageObject *shareObject = [UMShareWebpageObject shareObjectWithTitle:title descr:shareText thumImage:image];
        /*! 设置网页地址 */
        shareObject.webpageUrl = webpageUrl;
        
        /*! 分享消息对象设置分享内容对象 */
        messageObject.shareObject = shareObject;
        
        /*! 调用分享接口 */
        [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:viewController completion:^(id data, NSError *error) {
            if (error) {
                UMSocialLogInfo(@"************Share fail with error %@*********",error);
            }else{
                if ([data isKindOfClass:[UMSocialShareResponse class]]) {
                    UMSocialShareResponse *resp = data;
                    /*! 分享结果消息 */
                    UMSocialLogInfo(@"response message is %@",resp.message);
                    /*! 第三方原始返回的数据 */
                    UMSocialLogInfo(@"response originalResponse data is %@",resp.originalResponse);
                    
                }else{
                    UMSocialLogInfo(@"response data is %@",data);
                }
            }
            [self alertWithError:error];
        }];
        
    }];
}

/** 分享列表 */
- (void)shareListWithShareType:(ShowShareStatus)shareType
                viewController:(UIViewController *)viewController{
//   [UMSocialShareUIConfig]
    
    
    
    
}



















- (void)setPinterstInfo:(UMSocialMessageObject *)messageObj
{
    messageObj.moreInfo = @{@"source_url": @"http://www.umeng.com",
                            @"app_name": @"U-Share",
                            @"suggested_board_name": @"UShareProduce",
                            @"description": @"U-Share: best social bridge"};
}





























- (void)alertWithError:(NSError *)error
{
    NSString *result = nil;
    if (!error) {
        result = [NSString stringWithFormat:@"分享成功！"];
    }
    else{
        NSMutableString *str = [NSMutableString string];
        if (error.userInfo) {
            for (NSString *key in error.userInfo) {
                [str appendFormat:@"%@ = %@\n", key, error.userInfo[key]];
            }
        }
        if (error) {
            result = [NSString stringWithFormat:@"Share fail with error code: %d\n%@",(int)error.code, str];
        }
        else{
            result = [NSString stringWithFormat:@"Share fail"];
        }
    }
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"分享内容"
                                                    message:result
                                                   delegate:nil
                                          cancelButtonTitle:NSLocalizedString(@"sure", @"确定")
                                          otherButtonTitles:nil];
    [alert show];
}









@end
