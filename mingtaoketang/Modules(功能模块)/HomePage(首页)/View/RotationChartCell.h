//
//  RotationChartCell.h
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/4/25.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RotationChartCell : UICollectionViewCell
/** banner数组 */
@property (nonatomic,strong) NSMutableArray *bannerArray;
@property (nonatomic,strong) void (^DidSelectItemAtIndex)(NSInteger index);
@end

NS_ASSUME_NONNULL_END
