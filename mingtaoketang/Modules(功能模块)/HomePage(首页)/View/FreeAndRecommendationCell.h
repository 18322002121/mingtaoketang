//
//  FreeAndRecommendationCell.h
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/4/25.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HomeData;
NS_ASSUME_NONNULL_BEGIN

@interface FreeAndRecommendationCell : UICollectionViewCell
/** banner模型 */
@property (nonatomic,strong) HomeData *bannerModel;

@end

NS_ASSUME_NONNULL_END
