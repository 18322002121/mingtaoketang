//
//  SettingModel.h
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/4/27.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SettingModel : NSObject

@property (nonatomic,strong) NSString *gridTitle;
@property (nonatomic,strong) NSString *iconImage;
@property (nonatomic,strong) NSString *controller;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)initWithDict:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
