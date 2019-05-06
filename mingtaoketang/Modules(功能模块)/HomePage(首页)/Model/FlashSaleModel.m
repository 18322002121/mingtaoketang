//
//  FlashSaleModel.m
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/5/6.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "FlashSaleModel.h"

@implementation FlashSaleData

@end

@implementation FlashSaleModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"data" : [FlashSaleData class]};
}
@end
