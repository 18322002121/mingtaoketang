//
//  LiveBroadcastCourseShowModel.m
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/5/6.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "LiveBroadcastCourseShowModel.h"

@implementation LiveBroadcastCourseShowData
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
             @"iid":@"id"
             };
}
@end

@implementation LiveBroadcastCourseShowModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"data" : [LiveBroadcastCourseShowData class]};
}

@end

