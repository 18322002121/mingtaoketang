//
//  FlashSaleCell.h
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/4/25.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FlashSaleData;
NS_ASSUME_NONNULL_BEGIN

@interface FlashSaleCell : UICollectionViewCell
@property (nonatomic,strong) void (^RushToBuyClickBlock)(UIButton *sender);
/** 初始化模型 */
@property (nonatomic,strong) FlashSaleData * flashSaleModel;
@end

NS_ASSUME_NONNULL_END
