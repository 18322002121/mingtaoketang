//
//  InformationViewModel.m
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/5/7.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "InformationViewModel.h"

@implementation InformationViewData
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
             @"iid":@"id"
             };
}
@end

@implementation InformationViewModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"data" : [InformationViewData class]};
}
@end
