//
//  CurriculumViewModel.m
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/5/7.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "CurriculumViewModel.h"


@implementation CurriculumViewChildren

@end
@implementation CurriculumViewData
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"children" : [CurriculumViewChildren class]};
}
@end
@implementation CurriculumViewModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"data" : [CurriculumViewData class]};
}
@end

