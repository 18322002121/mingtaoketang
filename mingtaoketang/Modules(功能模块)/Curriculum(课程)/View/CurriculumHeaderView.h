//
//  CurriculumHeaderView.h
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/4/26.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class CurriculumViewData;
@interface CurriculumHeaderView : UICollectionReusableView
/** 初始化模型 */
@property (nonatomic,strong) CurriculumViewData *curriculumDataModel;
@end

NS_ASSUME_NONNULL_END
