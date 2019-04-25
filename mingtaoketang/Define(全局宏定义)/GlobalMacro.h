//
//  GlobalMacro.h
//  mingtaohangkong
//
//  Created by Linlin Ge on 2019/3/7.
//  Copyright © 2019年 hcy. All rights reserved.
//

#ifndef GlobalMacro_h
#define GlobalMacro_h

//获取系统对象
#define kApplication        [UIApplication sharedApplication]
#define kAppWindow          [UIApplication sharedApplication].delegate.window
#define kAppDelegate        [AppDelegate shareAppDelegate]
#define kRootViewController [UIApplication sharedApplication].delegate.window.rootViewController
#define kUserDefaults       [NSUserDefaults standardUserDefaults]
#define kNotificationCenter [NSNotificationCenter defaultCenter]

//获取屏幕宽高
#define kStatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height
#define KScreenWidth [[UIScreen mainScreen] bounds].size.width
#define KScreenHeight [[UIScreen mainScreen] bounds].size.height
#define kNavBarHeight self.navigationController.navigationBar.frame.size.height
#define HN_NAVIGATION_BAR_HEIGHT ([UIScreen mainScreen].bounds.size.height == 812 ? 88 :64)
#define kTabBarHeight ([[UIApplication sharedApplication] statusBarFrame].size.height>20?83:49)
#define App_Frame_Height        [[UIScreen mainScreen] applicationFrame].size.height
#define App_Frame_Width         [[UIScreen mainScreen] applicationFrame].size.width

/** 导航栏和状态栏总高度 */
#define kNavAndStatusHight  (self.navigationController.navigationBar.frame.size.height+[[UIApplication sharedApplication] statusBarFrame].size.height)

/** 强弱引用 */
#define kWeakSelf(type)  __weak typeof(type) weak##type = type;
#define kStrongSelf(type) __strong typeof(type) type = weak##type;

/** 字体大小(常规/粗体) */
#define BOLDSYSTEMFONT(FONTSIZE)[UIFont boldSystemFontOfSize:FONTSIZE]
#define SYSTEMFONT(FONTSIZE)    [UIFont systemFontOfSize:FONTSIZE]
#define FONT(NAME, FONTSIZE)    [UIFont fontWithName:(NAME) size:(FONTSIZE)]

/** App版本号 */
#define appMPVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

/** 当前版本 */
#define FSystemVersion          ([[[UIDevice currentDevice] systemVersion] floatValue])
#define DSystemVersion          ([[[UIDevice currentDevice] systemVersion] doubleValue])
#define SSystemVersion          ([[UIDevice currentDevice] systemVersion])

/** 是否空对象 */
#define IS_NULL_CLASS(OBJECT) [OBJECT isKindOfClass:[NSNull class]]

/** 色值 */
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r,g,b) RGBA(r,g,b,1.0f)

#define HEXCOLOR(hex) [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16)) / 255.0 green:((float)((hex & 0xFF00) >> 8)) / 255.0 blue:((float)(hex & 0xFF)) / 255.0 alpha:1]

#define COLOR_RGB(rgbValue,a) [UIColor colorWithRed:((float)(((rgbValue) & 0xFF0000) >> 16))/255.0 green:((float)(((rgbValue) & 0xFF00)>>8))/255.0 blue: ((float)((rgbValue) & 0xFF))/255.0 alpha:(a)]

/** 字符串是否为空 */
#define kStringIsEmpty(str) ([str isKindOfClass:[NSNull class]] || str == nil || [str length] < 1 ? YES : NO )

/** 数组是否为空 */
#define kArrayIsEmpty(array) (array == nil || [array isKindOfClass:[NSNull class]] || array.count == 0)

/** 字典是否为空 */
#define kDictIsEmpty(dic) (dic == nil || [dic isKindOfClass:[NSNull class]] || dic.allKeys == 0)

/** 是否是空对象 */
#define kObjectIsEmpty(_object) (_object == nil \
|| [_object isKindOfClass:[NSNull class]] \
|| ([_object respondsToSelector:@selector(length)] && [(NSData *)_object length] == 0) \
|| ([_object respondsToSelector:@selector(count)] && [(NSArray *)_object count] == 0))

//-------------------打印日志-------------------------
//DEBUG  模式下打印日志,当前行
#ifdef DEBUG
#define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define DLog(...)
#endif

/** 颜色 */
#define KClearColor [UIColor clearColor]
#define KWhiteColor [UIColor whiteColor]
#define KBlackColor [UIColor blackColor]
#define KGrayColor [UIColor grayColor]
#define KGray2Color [UIColor lightGrayColor]
#define KBlueColor [UIColor blueColor]
#define KRedColor [UIColor redColor]
#define kRandomColor [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]        //随机色生成

/** 拼接字符串 */
#define NSStringFormat(format,...) [NSString stringWithFormat:format,##__VA_ARGS__]

/** 字体 */
#define BOLDSYSTEMFONT(FONTSIZE)[UIFont boldSystemFontOfSize:FONTSIZE]
#define SYSTEMFONT(FONTSIZE)    [UIFont systemFontOfSize:FONTSIZE]
#define FONT(NAME, FONTSIZE)    [UIFont fontWithName:(NAME) size:(FONTSIZE)]

#endif /* GlobalMacro_h */
