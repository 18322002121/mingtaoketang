//
//  HomeBannerModel.h
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/5/5.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HomeData :NSObject
@property (nonatomic , copy) NSString              * iid;
@property (nonatomic , copy) NSString              * path;
@property (nonatomic , copy) NSString              * www;

@end

@interface HomeBannerModel :NSObject
@property (nonatomic , copy) NSString              * msg;
@property (nonatomic , copy) NSArray<HomeData *>              * data;
@property (nonatomic , copy) NSString              * status;

@end

NS_ASSUME_NONNULL_END
