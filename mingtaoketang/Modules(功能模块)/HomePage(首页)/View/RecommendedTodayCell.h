//
//  RecommendedTodayCell.h
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/4/25.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RecommendedTodayData;
NS_ASSUME_NONNULL_BEGIN

@interface RecommendedTodayCell : UICollectionViewCell
/** 模型初始化 */
@property (nonatomic,strong) RecommendedTodayData *recommendedModel;
@end

NS_ASSUME_NONNULL_END
