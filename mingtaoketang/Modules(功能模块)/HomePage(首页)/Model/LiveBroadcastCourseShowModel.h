//
//  LiveBroadcastCourseShowModel.h
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/5/6.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LiveBroadcastCourseShowData :NSObject
@property (nonatomic , copy) NSString              * iid;
@property (nonatomic , copy) NSString              * room_id;
@property (nonatomic , copy) NSString              * zhibo_title;
@property (nonatomic , copy) NSString              * zhibo_teacher;
@property (nonatomic , copy) NSString              * start_time;
@property (nonatomic , copy) NSString              * avatar;
@property (nonatomic , copy) NSString              * collect_zhibo;
@property (nonatomic , copy) NSString              * nowTime;
@property (nonatomic , copy) NSString              * number;
@property (nonatomic , copy) NSString              * end_time;
@property (nonatomic , copy) NSString              * nickname;
@property (nonatomic , copy) NSString              * status;

@end

@interface LiveBroadcastCourseShowModel :NSObject
@property (nonatomic , copy) NSString              * msg;
@property (nonatomic , copy) NSArray<LiveBroadcastCourseShowData *>              * data;
@property (nonatomic , copy) NSString              * status;

@end

NS_ASSUME_NONNULL_END
