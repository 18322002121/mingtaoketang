//
//  RecommendedTodayModel.m
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/5/6.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "RecommendedTodayModel.h"

@implementation RecommendedTodayData

@end
@implementation RecommendedTodayModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"data" : [RecommendedTodayData class]};
}
@end

