//
//  RecommendedTodayModel.h
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/5/6.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RecommendedTodayData :NSObject
@property (nonatomic , copy) NSString              * cat_id;
@property (nonatomic , copy) NSString              * cat_name;

@end

@interface RecommendedTodayModel :NSObject
@property (nonatomic , copy) NSString              * msg;
@property (nonatomic , copy) NSArray<RecommendedTodayData *>              * data;
@property (nonatomic , copy) NSString              * status;

@end

NS_ASSUME_NONNULL_END
