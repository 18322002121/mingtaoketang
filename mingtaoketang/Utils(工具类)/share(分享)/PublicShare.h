//
//  PublicShare.h
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/5/11.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/*! 友盟分享 SDK：配置需要的key */
#define Umeng_Appkey     @"56f217d467e58e513a000434"
#define Sina_AppKey      @"2447331824"
#define SinaAppSecret    @"4ee72cf1958fa92b88570d1b99328718"
#define WX_APPKEY        @"wx19d8c52e02fa7556"
#define WX_APPSECRET     @"90eeb0c9ef2a1c99fb473890809f7f19"
#define QQKey            @"wrGGgg89e0lqqoXT"
#define QQAppID          @"1105285308"

typedef NS_ENUM(NSUInteger, ShowShareStatus)
{
    /*! 纯文本 */
    ShowShareStatusText = 1,
    
    /*! 纯图片：本地图片 */
    ShowShareStatusImage,
    
    /*! 纯图片：网络图片 URL */
    ShowShareStatusImageUrl,
    
    /*! 网页：一般的分享是这种，title、content、缩略图、URL */
    ShowShareStatusWebLink,
    
    /*! 文本 + 图片 【暂时只对新浪分享有效】 */
    ShowShareStatusTextImage,
    
    /*! 音乐 */
    ShowShareStatusMusicLink,
    
    /*! 视频 */
    ShowShareStatusVideoLink,
    
    /*! gif 动图【注：目前只有微信支持动图分享，其他平台均不支持】*/
    ShowShareStatusTypeGif,
    
    /*! 文件 */
    ShowShareStatusTypeFile
};

@interface PublicShare : NSObject
/*! 分享类型 */
@property (nonatomic, assign) ShowShareStatus shareType;
/*! 分享标题 */
@property (nonatomic, strong) NSString *shareTitle;
/*! 分享摘要 */
@property (nonatomic, strong) NSString *shareText;
/*! 分享大图【本地 imageName】】 */
@property (nonatomic, strong) NSString *shareBigImage;
/*! 分享 URL 图片 */
@property (nonatomic, strong) NSString *shareImageUrl;
/*! 分享网页 */
@property (nonatomic, strong) NSString *shareWebpageUrl;
/*! 分享音乐 URL【必传】 */
@property (nonatomic, strong) NSString *shareMusicUrl;
/*! 分享音乐 DataUrl */
@property (nonatomic, strong) NSString *shareMusicDataUrl;
/*! 分享视频 URL */
@property (nonatomic, strong) NSString *shareVideoUrl;
/*! 分享 gif 动图路径 */
@property (nonatomic, strong) NSString *shareGifFilePath;
/*! 分享文件路径 */
@property (nonatomic, strong) NSString *shareFileFilePath;
/*! 分享文件后缀类型 */
@property (nonatomic, strong) NSString *shareFileFileExtension;









/** 友盟分享工具类封装 */
+ (PublicShare *)shareManage;
/** 友盟分享设置 */
- (void)setupShareConfig;
/** 判断平台是否安装 */
- (BOOL)uMSocialIsInstall:(UMSocialPlatformType)platformType;
/** 微信分享 */
- (void)weChatShareWithShareType:(ShowShareStatus)shareType viewController:(UIViewController *)viewController;
/** 微信朋友圈分享 */
- (void)wechatFriendshipCircleType:(ShowShareStatus)shareType viewController:(UIViewController *)viewController;
/** 新浪微博分享 */
- (void)sinaShareWithShareType:(ShowShareStatus)shareType
                   viewController:(UIViewController *)viewController;
/** qq分享 */
- (void)qqShareWithShareType:(ShowShareStatus)shareType
                 viewController:(UIViewController *)viewController;
/** Qzone分享  */
- (void)qZoneShareWithShareType:(ShowShareStatus)shareType
                    viewController:(UIViewController *)viewController;

/** 分享列表 */
- (void)shareListWithShareType:(ShowShareStatus)shareType
                   viewController:(UIViewController *)viewController;
/** 清除授权 */
- (void)cancelAuthWithPlatformType:(UMSocialPlatformType)platformType;

@end

NS_ASSUME_NONNULL_END
