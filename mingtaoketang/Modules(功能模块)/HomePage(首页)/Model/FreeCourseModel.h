//
//  FreeCourseModel.h
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/5/7.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FreeCourseData :NSObject
@property (nonatomic , copy) NSString              * click_count;
@property (nonatomic , copy) NSString              * goods_id;
@property (nonatomic , copy) NSString              * goods_thumb;
@property (nonatomic , copy) NSString              * goods_name;

@end

@interface FreeCourseModel :NSObject
@property (nonatomic , copy) NSString              * msg;
@property (nonatomic , copy) NSArray<FreeCourseData *>              * data;
@property (nonatomic , copy) NSString              * status;

@end

NS_ASSUME_NONNULL_END
