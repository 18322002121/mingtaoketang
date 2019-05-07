//
//  InformationViewCell.h
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/5/7.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class InformationViewData;
@interface InformationViewCell : UICollectionViewCell
/** 初始化模型 */
@property (nonatomic,strong) InformationViewData *informationModel;
@end

NS_ASSUME_NONNULL_END
