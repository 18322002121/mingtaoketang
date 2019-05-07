//
//  FreeCourseModel.m
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/5/7.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "FreeCourseModel.h"

@implementation FreeCourseData

@end
@implementation FreeCourseModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"data" : [FreeCourseData class]};
}
@end
