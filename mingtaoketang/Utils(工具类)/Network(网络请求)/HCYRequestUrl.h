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





#endif /* HCYRequestUrl_h */
