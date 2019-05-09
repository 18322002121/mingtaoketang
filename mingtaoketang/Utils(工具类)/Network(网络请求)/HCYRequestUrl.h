//
//  HCYRequestUrl.h
//  mayizhisheng
//
//  Created by HCY on 2018/8/20.
//  Copyright © 2018年 HCY. All rights reserved.
//

#ifndef HCYRequestUrl_h
#define HCYRequestUrl_h


//#pragma mark-正式库
//#define API_HOST @"http://www.lingqidian.net/formal"


#pragma mark-测试库
#define API_HOST @"http://192.168.1.102/mt/public"


/** 首页轮播图 */
#define banner [NSString stringWithFormat:@"%@/api/Index/banner",API_HOST]
/** 首页直播 */
#define home_live [NSString stringWithFormat:@"%@/api/Index/home_live",API_HOST]
/** 今日推荐 */
#define tuijian [NSString stringWithFormat:@"%@/api/Index/tuijian",API_HOST]
/** 限时抢购 */
#define qianggou [NSString stringWithFormat:@"%@/api/Index/qianggou",API_HOST]
/** 资讯,助手,开班 */
#define article_cat [NSString stringWithFormat:@"%@/api/Index/article_cat",API_HOST]
/** 资讯助手文章 */
#define appCat_id [NSString stringWithFormat:@"%@/api/Index/article",API_HOST]
/** 免费视频列表 */
#define taste_video [NSString stringWithFormat:@"%@/api/Index/taste_video",API_HOST]
/** 课程套餐分类列表 */
#define course_list [NSString stringWithFormat:@"%@/api/index/course_list",API_HOST]
/** 注册 */
#define zhuce [NSString stringWithFormat:@"%@/api/index/zhuce",API_HOST]

#endif /* HCYRequestUrl_h */
