//
//  HomeBannerModel.m
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/5/5.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "HomeBannerModel.h"

@implementation HomeData

@end
@implementation HomeBannerModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
             @"iid":@"id"
             };
}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"data" : [HomeData class]};
}

@end
