//
//  MineHeaderView.h
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/4/26.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MineHeaderView : UICollectionReusableView
@property (nonatomic,strong) void (^RechargeClickBlock)(UIButton *sender);
@end

NS_ASSUME_NONNULL_END
