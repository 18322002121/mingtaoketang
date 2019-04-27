//
//  SettingModel.m
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/4/27.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "SettingModel.h"

@implementation SettingModel

- (instancetype)initWithDict:(NSDictionary *)dict{
    
    if (self=[super init]) {
        self.gridTitle=dict[@"gridTitle"];
        self.iconImage=dict[@"iconImage"];
        self.controller=dict[@"controller"];
    }
    return self;
}
+ (instancetype)initWithDict:(NSDictionary *)dict{
    
    return [[self alloc]initWithDict:dict];
}

@end
