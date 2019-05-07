//
//  FlashSaleModel.h
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/5/6.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FlashSaleData :NSObject
@property (nonatomic , copy) NSString              * market_price;
@property (nonatomic , copy) NSString              * cat_thumb;
@property (nonatomic , copy) NSString              * cat_name;
@property (nonatomic , copy) NSString              * shop_price;
@property (nonatomic , copy) NSString              * cat_id;

@end

@interface FlashSaleModel :NSObject
@property (nonatomic , copy) NSString              * msg;
@property (nonatomic , copy) NSArray<FlashSaleData *>              * data;
@property (nonatomic , copy) NSString              * status;

@end

NS_ASSUME_NONNULL_END
