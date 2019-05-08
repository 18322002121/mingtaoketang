//
//  CurriculumCell.h
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/4/26.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class CurriculumViewChildren;
@interface CurriculumCell : UICollectionViewCell
/** 初始化模型 */
@property (nonatomic,strong) CurriculumViewChildren *childrenModel;
@end

NS_ASSUME_NONNULL_END
